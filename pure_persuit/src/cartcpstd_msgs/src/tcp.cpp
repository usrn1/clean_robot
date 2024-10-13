/*
* 主车通信程序，此部分为通信主程序，负责获取指挥端消息并解析，从而打开/关闭对应的程序
*/
#include "checkTopic.h"

//小车速度联合体，负责将指挥端罗技方向盘发来的二进制形式的小车速度转换为int类型，分别为方向盘（wheel)，油门（accelerator）以及刹车（brake）
union carCMD{
	unsigned char speedc[4];
	int speedi;
}wheel,accelerator,brake;

//小车循迹时速度联合体
union setcmd{
	char setc[4];
	int seti ;
}track_vel;

//初始循迹速度默认值为5
int lasttrack_vel=5;

//小车位姿联合体，分别为x坐标(posex)，y坐标(posey)，z坐标(posez)以及航向角(posetheta)
union pose{
	double posed;
	char posec[8];
}posex,posey,posez,posetheta;

//小车速度联合体，分别为线速度(poselinearvel)和角速度(poseangularvel)
union vel{
	float velf;
	char velc[4];
}poselinearvel,poseangularvel;

//循迹时显控端发送的队形距离，分别为一字型的前后距离（front,rear）和三角形距离（triangle)
union dis{
	int disf;
	unsigned char disc[4];
}front,rear,triangle;
char CarParamMsg[500];
char FrameAndIIP[10] =  {(char)0x41,(char)0x41,(char)0x7F,(char)0x00,(char)0x01,(char)0x00,(char)0x00,(char)0x12,(char)0x00,(char)0x00};
float line,angu;

//消息的类型
enum CMD_COMMAND
{
	CMD_PARK,         //停车
	CMD_RELEASE_EMERGENCY_BRAKE,  //解除紧急制动
	CMD_SINGLE_MODE,        //单车遥控
	CMD_GROUP_MODE, //群组遥控
	CMD_TRACK_MODE, //寻迹
	CMD_SINGLE_TRACK,//单车寻迹
	CMD_GATHER_TRACK,//单车采集轨迹功能
	CMD_ERROR//错误
};

//数据报文的头部
struct DataHeader
{
	string FrameTag;//帧标志
	int dataLength; //数据的长度
	char cmd;        //命令的类型
	unsigned char* msg;       //消息
};

//存放客户端的套接字
std::vector<SOCKET> g_clients;
//回调函数，收到小车的位置
void poseMsg(const turtlesim::Pose::ConstPtr& msg);
void GetCarParam();
void sendCarParam();
int  basecontrol(bool i);
extern  EasyTcpClient client;
extern unsigned char* recvbuff;

int gearNow = 0;  //存放当前挡位
int gearLast = 1; //存放上一次的档位，利用电平升降判断是否进行档位变化
char modeLast = 0x00;//存放上一次的车辆状态
// int flag = 0;
int LastMode = -1;   //存放上一次模式，初始值模式为-1
FILE  *openfile,*closefile,*base_control,*closebase_control,*multi,*closemulti,*dealtrackfile,*trackfile;
char Formation_Mode = 0x00;//编队队形
bool if_dealtrack = true;//是否关闭轨迹信息处理程序，true已经关了，false 还没关
char direction = 0x00;//存放循迹时方向
char last_direction = 0x00;//存放上一次循迹方向
ros::Publisher pubEstop; //发布者，发布急停指令
std_msgs::Bool estop ; //急停指令

//关闭文件函数，通过创建文件将打开的节点杀死
int func_closefile(const string filepath)
{
	const char* filename = filepath.data();
	char buff[1024];
	memset(buff,'/0',sizeof(buff));
	closefile = popen(filename,"r");
	fread(buff,sizeof(char),sizeof(buff),closefile);
	//cout << "是否关闭close文件标志为(0表示已经关闭，1表示需要使用pclose关闭)" <<buff[0] <<endl;
	for(int i = 1 ; i < sizeof(buff) ; i ++)
	{
		if(buff[i] == '0')
			break;
		cout << buff[i];
	}
	if(buff[0] == '0')
	{
		pclose(openfile);
		return 0;
	}
				   
	else
	{
		//pclose(closefile);
		pclose(openfile);
		return 1;
	}
}

//打开文件函数，根据指令运行对应的launch文件
void func_openfile(const string filepath)
{
	const char* filename = filepath.data();
 	openfile = popen( filename,"r");
	if(filename == NULL)
	{
		perror("popen error\n");
	}
}

//根据指挥端发来的模式信息，发布对应的小车速度/消息
int dealmode(int mode , ros::Publisher pub,DataHeader* header,ros::Publisher pub_mode)
{
	switch (mode)
	{
	//指挥端到靶车
	case CMD_PARK:   //停车，信息描述为选定车辆地址（4）.靶车接收到信号后刹车并将执行机构归正。
	{
		ros::Rate r(10);
		int i = 0;
		while(ros::ok()&&i<10)
		{
			geometry_msgs::Twist msg;
			msg.linear.x = 0.0;
			msg.linear.y = 0.0;
			msg.linear.z = 0.0;
			msg.angular.x = 0.0;
			msg.angular.y = 0.0;
			msg.angular.z =  0.0 ;
			pub.publish(msg);
			pubEstop.publish(estop);
			r.sleep();
			i++;
		}
	}
	break;
	case CMD_RELEASE_EMERGENCY_BRAKE:  //解除紧急制动，信息描述为选定车辆地址（4）
	{
			char   estopflag = header->msg[4];
			ros::Rate r(10);
			int flag =  0;
			while(ros::ok()&&flag == 0)
			{
			if(estopflag == 0x01)
			{
				estop.data=true;
				pubEstop.publish(estop);
			}
			else{
				estop.data=false;
				pubEstop.publish(estop);
			}
			ros::spinOnce();
			r.sleep();
			flag++;
			}
			flag=0;
	}
	break;
	case CMD_SINGLE_MODE:  //单车遥控模式，信息描述：选定车辆地址（4）+00H（无编队）+方向盘角度（4）+油门（4）+刹车（4）+档位（1）(没必要发送车辆地址，前面信息已经包括了车辆地址)
	{
			Formation_Mode = header->msg[4];
			 for(int i = 0 ,  j = 3 ; i < 4  ; i ++ , j --)
					wheel.speedc[j] =	header->msg[i + 5];		
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					accelerator.speedc[j] =	header->msg[i + 9];
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					brake.speedc[j] =	header->msg[i + 13];
			int  gears = (int)header->msg[17];
			//std::cout << "gears = " << gears <<std::endl;
			if(gearLast == 1&& gears != 1)	
				{
					gearLast = gears ;
					gearNow  +=  (-- gears) ;
				}
			else
				gearLast = gears ;
			if(gearNow > 1 )
							gearNow --;
			if(gearNow < -1)
							gearNow ++;
			std::cout <<"方向盘 = " <<  wheel.speedi  << "\t油门 = "<<accelerator.speedi  << "\t刹车= " << brake.speedi <<  "\t当前档位= " << gearNow << std::endl;

			geometry_msgs::Twist twist_msg;

			//4-2.设置发送频率
			ros::Rate r(10);
			//4-3.循环发送
			int flag =  0;
			while(ros::ok()&&flag == 0)
			{
			if( fabs((float)(32767-accelerator.speedi) / 16383)>=(float)(32767-brake.speedi)/16383)
				twist_msg.linear.x  = gearNow * ( fabs((float)(32767-accelerator.speedi) / 16383) - fabs((float)(32767-brake.speedi)/16383));
			else
				twist_msg.linear.x = 0.0;
			twist_msg.linear.y = 0.0;
			twist_msg.linear.z = 0.0;
			twist_msg.angular.x = 0.0;
			twist_msg.angular.y = 0.0;
			if(gearNow>=0)
					twist_msg.angular.z =  -gearNow *(float)wheel.speedi / 4681 ;
			if(gearNow<0)
					twist_msg.angular.z =  gearNow *(float)wheel.speedi / 4681 ;
			pub.publish(twist_msg);
			std::cout << "线速度 = " << twist_msg.linear.x  ;
			std::cout << "\t角速度 = " << twist_msg.angular.z  << std::endl;
	
			ros::spinOnce();
			r.sleep();
			flag ++;
		}
		flag =0;
	}
	break;
	case CMD_GROUP_MODE:  //群组遥控模式，信息描述：选定车辆地址（4）+  编队队形 +方向盘角度（4）+油门（4）+刹车（4）+档位（1）
	{ 

			Formation_Mode = header->msg[4];
			 for(int i = 0 ,  j = 3 ; i < 4  ; i ++ , j --)
					wheel.speedc[j] =	header->msg[i + 5];		
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					accelerator.speedc[j] =	header->msg[i + 9];
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					brake.speedc[j] =	header->msg[i + 13];
			int  gears = (int)header->msg[17];
			std::cout << "gears = " << gears <<std::endl;
			if(gearLast == 1&& gears != 1)	
				{
					gearLast = gears ;
					gearNow  +=  (-- gears) ;
				}
			else
				gearLast = gears ;
			if(gearNow > 1 )
							gearNow --;
			if(gearNow < -1)
							gearNow ++;
			std::cout <<"方向盘 = " <<  wheel.speedi  << "\t油门 = "<<accelerator.speedi  << "\t刹车 = " << brake.speedi <<  "\t当前档位= " << gearNow << std::endl;

			geometry_msgs::Twist twist_msg;

			//4-2.设置发送频率
			ros::Rate r(10);
			//4-3.循环发送
			int flag =  0;
			while(ros::ok()&&flag == 0)
			{
			if( fabs((float)(32767-accelerator.speedi) / 16383)>=(float)(32767-brake.speedi)/16383)
				twist_msg.linear.x  = gearNow * ( fabs((float)(32767-accelerator.speedi) / 16383) - fabs((float)(32767-brake.speedi)/16383));
			else
				twist_msg.linear.x = 0.0;
			twist_msg.linear.y = 0.0;
			twist_msg.linear.z = 0.0;
			twist_msg.angular.x = 0.0;
			twist_msg.angular.y = 0.0;
			if(gearNow>=0)
					twist_msg.angular.z =  -gearNow *(float)wheel.speedi / 13107 ;
			if(gearNow<0)
					twist_msg.angular.z =  gearNow *(float)wheel.speedi / 13107 ;
			pub.publish(twist_msg);
			std::cout << "线速度 = " << twist_msg.linear.x  ;
			std::cout << "\t角速度 = " << twist_msg.angular.z  << std::endl;

			ros::spinOnce();
			r.sleep();
			flag ++;
		}
		flag =0;
	}
	break;
	case CMD_TRACK_MODE:  //群组寻迹模式，信息描述：车辆地址（4）+编队队形（1）+速度（4)+方向（1）+距离（两个）

	{		
			cout << "寻迹接受数据：";
			for(int i = 0 ; i < 22 ; i ++)
				cout << (int)header->msg[i];
			cout << endl;
			
			//判断是否关闭轨迹信息处理程序
			if(!if_dealtrack)
			{
				const string closedeal_track_cmd = "~/test/src/cartcpstd_msgs/closedeal_track.sh";
				func_closefile(closedeal_track_cmd);
				 if_dealtrack = 1;
			}
			direction = header->msg[9];
			for(int i = 0 ; i < 4 ; i ++){
					track_vel.setc[i] = header->msg[8-i];
			}
			//前后距离
			for(int i = 0 ; i < 4 ; i ++)
				front.disc[i] = header->msg[13-i];
			for(int i = 0 ; i < 4 ; i ++)
				rear.disc[i] = header->msg[17-i];
			for(int i = 0 ; i < 4 ; i ++)
				triangle.disc[i] = header->msg[21-i];
			for(int i=0;i<10;i++)
			{

			ros::param::set("/L_front",front.disf);
			ros::param::set("/L_rear",rear.disf);
			ros::param::set("/L_triangle",triangle.disf);
			//Formation_Mode = header->msg[4];
			cout << " 速度 =  " << track_vel.seti ;
			ros::param::set("/maincar_waypoint_loader/velocity",track_vel.seti);
			//int vel = (int)header->msg[7] ;
			cout<<"\t队形 = " << (int)header->msg[4] <<  "\t方向 = "<<(int)header->msg[9]<< "\t前车距离 = " <<  front.disf << "\t后车距离 = " << rear.disf << "\t三角形距离 = " << triangle.disf << endl;
			}
			if(last_direction == 0x00) //第一次打开循迹程序
			{
					
				if(direction == 0x01)//目前轨迹是正向，打开正向寻迹的程序
				{
					const string  opensingletrackin_cmd= "~/test/src/cartcpstd_msgs/singletracking.sh";
					func_openfile(opensingletrackin_cmd);
					last_direction = direction;
				}
				if(direction == 0x02)//目前轨迹是反向，打开反向寻迹的程序
				{
					const string  openinverttrackin_cmd= "~/test/src/cartcpstd_msgs/invert_tracking.sh";
					func_openfile(openinverttrackin_cmd);
					last_direction = direction;
				}
				lasttrack_vel = track_vel.seti ;
			}
			else 
			{
				if(lasttrack_vel != track_vel.seti  || last_direction != direction)//速度改变或者方向改变
			//重新启动launch文件
			{
				cout << "之前循迹速度=" << lasttrack_vel<<"                                 " << "此时循迹速度=" << track_vel.seti<<endl;
				cout << "之前循迹方向="<< last_direction<<"                                  "<<"此时循迹方向=" << (int)direction <<endl;
				if(last_direction == 0x01)//上一个轨迹是正向，关闭正向寻迹的程序
				{
				const string closesingletrackin_cmd = "~/test/src/cartcpstd_msgs/closetracking.sh";
				func_closefile(closesingletrackin_cmd);
				}
				if(last_direction == 0x02)//上一个轨迹是反向，关闭反向寻迹的程序
				{
				const string closeinverttrackin_cmd = "~/test/src/cartcpstd_msgs/closeinvert_tracking.sh";
				func_closefile(closeinverttrackin_cmd);
				}

				if(direction == 0x01)//目前轨迹是正向，打开正向寻迹的程序
				{
					const string  opensingletrackin_cmd= "~/test/src/cartcpstd_msgs/singletracking.sh";
					func_openfile(opensingletrackin_cmd);
					last_direction = direction;
				}
				if(direction == 0x02)//目前轨迹是反向，打开反向寻迹的程序
				{
					const string  openinverttrackin_cmd= "~/test/src/cartcpstd_msgs/invert_tracking.sh";
					func_openfile(openinverttrackin_cmd);
					last_direction = direction;
				}
				lasttrack_vel = track_vel.seti;
			}
			}
			int flag =  0;
			ros::Rate r(10);
			while(ros::ok()&&flag == 0)
			{
			pubEstop.publish(estop);
			ros::spinOnce();
			r.sleep();
			flag ++;
			}
			flag =0;	
				
	}
	break;

		case CMD_SINGLE_TRACK:  //信息描述：车辆地址+速度(四字节，int)+方向(1)
	{
		//判断是否关闭轨迹信息处理程序
			if(!if_dealtrack)
			{
				const string closedeal_track_cmd = "~/test/src/cartcpstd_msgs/closedeal_track.sh";
				func_closefile(closedeal_track_cmd);
				 if_dealtrack = 1;
			}
			direction = header->msg[8];
			for(int i = 0 ; i < 4 ; i ++){
					track_vel.setc[i] = header->msg[7-i];
			}
		
			cout << " 速度 =  " << track_vel.seti ;
			ros::param::set("/maincar_waypoint_loader/velocity",track_vel.seti);
			int vel = (int)header->msg[7] ;
			cout<<"\t方向 = "<<(int)header->msg[8]<<endl;
			if(last_direction == 0x00) //第一次打开循迹程序
			{
					
				if(direction == 0x01)//目前轨迹是正向，打开正向寻迹的程序
				{
					const string  opensingletrackin_cmd= "~/test/src/cartcpstd_msgs/singletracking.sh";
					func_openfile(opensingletrackin_cmd);
					last_direction = direction;
				}
				if(direction == 0x02)//目前轨迹是反向，打开反向寻迹的程序
				{
					const string  openinverttrackin_cmd= "~/test/src/cartcpstd_msgs/invert_tracking.sh";
					func_openfile(openinverttrackin_cmd);
					last_direction = direction;
				}
				lasttrack_vel = track_vel.seti ;
			}
			else 
			{
				if(lasttrack_vel != track_vel.seti  || last_direction != direction)//速度改变或者方向改变
				//重新启动launch文件
				{
				cout << "之前循迹速度=" << lasttrack_vel<<"                                 " << "此时循迹速度=" << track_vel.seti<<endl;
				cout << "之前循迹方向="<< last_direction<<"                                  "<<"此时循迹方向=" << (int)direction <<endl;
				if(last_direction == 0x01)//上一个轨迹是正向，关闭正向寻迹的程序
				{
				const string closesingletrackin_cmd = "~/test/src/cartcpstd_msgs/closetracking.sh";
				func_closefile(closesingletrackin_cmd);
				}
				if(last_direction == 0x02)//上一个轨迹是反向，关闭反向寻迹的程序
				{
				const string closeinverttrackin_cmd = "~/test/src/cartcpstd_msgs/closeinvert_tracking.sh";
				func_closefile(closeinverttrackin_cmd);
				}

				if(direction == 0x01)//目前轨迹是正向，打开正向寻迹的程序
				{
					const string  opensingletrackin_cmd= "~/test/src/cartcpstd_msgs/singletracking.sh";
					func_openfile(opensingletrackin_cmd);
					last_direction = direction;
				}
				if(direction == 0x02)//目前轨迹是反向，打开反向寻迹的程序
				{
					const string  openinverttrackin_cmd= "~/test/src/cartcpstd_msgs/invert_tracking.sh";
					func_openfile(openinverttrackin_cmd);
					last_direction = direction;
				}
				lasttrack_vel = track_vel.seti;
			}
			}
			int flag =  0;
			ros::Rate r(10);
			while(ros::ok()&&flag == 0)
			{
				pubEstop.publish(estop);
				ros::spinOnce();
				r.sleep();
				flag ++;
			}
			flag =0;	
	}
	break;

	case CMD_GATHER_TRACK://单车采集轨迹
	{
			Formation_Mode = header->msg[4];
			for(int i = 0 ,  j = 3 ; i < 4  ; i ++ , j --)
					wheel.speedc[j] =	header->msg[i + 5];		
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					accelerator.speedc[j] =	header->msg[i + 9];
			for(int i = 0 , j = 3 ; i < 4 ; i ++ , j --)
					brake.speedc[j] =	header->msg[i + 13];
			int  gears = (int)header->msg[17];
			if(gearLast == 1&& gears != 1)	
			{
				gearLast = gears ;
				gearNow  +=  (-- gears) ;
			}
			else
				gearLast = gears ;
			if(gearNow > 1 )
				gearNow --;
			if(gearNow < -1)
				gearNow ++;
			std::cout <<"方向盘 = " <<  wheel.speedi  << "\t油门 = "<<accelerator.speedi  << "\t刹车 = " << brake.speedi <<  "\t当前档位= " << gearNow << std::endl;

			geometry_msgs::Twist twist_msg;

			//4-2.设置发送频率
			ros::Rate r(10);
			//4-3.循环发送
			int flag =  0;
			while(ros::ok()&&flag == 0)
			{
			if( fabs((float)(32767-accelerator.speedi) / 16383)>=(float)(32767-brake.speedi)/16383)
				twist_msg.linear.x  = gearNow * ( fabs((float)(32767-accelerator.speedi) / 16383) - fabs((float)(32767-brake.speedi)/16383));
			else
				twist_msg.linear.x = 0.0;
			twist_msg.linear.y = 0.0;
			twist_msg.linear.z = 0.0;
			twist_msg.angular.x = 0.0;
			twist_msg.angular.y = 0.0;
			if(gearNow>=0)
				twist_msg.angular.z =  -gearNow *(float)wheel.speedi / 13107 ;
			if(gearNow<0)
				twist_msg.angular.z =  gearNow *(float)wheel.speedi / 13107 ;
			pub.publish(twist_msg);
			std::cout << "线速度 = " << twist_msg.linear.x  ;
			std::cout << "\t角速度 = " << twist_msg.angular.z  << std::endl;
	
			ros::spinOnce();
			r.sleep();
			flag ++;
		}
		flag =0;

	}
	case CMD_ERROR: {;} break;
	}
	
	//模式切换完成
	
	return 0;
}

void OnNetMessage(DataHeader* header,ros::Publisher pub,ros::Publisher pub_mode)
{	
	short mode;
	if(header->cmd == 0x01)
		mode = 0;
	else if(header->cmd == 0x02)
		mode = 1;
	else if(header->cmd == 0x03)
		mode = 2;
	else if(header->cmd == 0x04)
		mode = 3;
	else if(header->cmd == 0x05)
		mode = 4;
	else if(header->cmd == 0x07)
		mode = 5;
	else if(header->cmd == 0x08)
		mode = 6;
	else mode = 7;
	
	//如果模式发生改变，则需要将上次模式对应程序关闭，并打开当前模式的程序
	if(modeLast != header->cmd)
	{
		sleep(1);
		gearNow = 0;
		if(LastMode == 6)//关闭单车采集轨迹
		{
			//关闭单车采集轨迹
			const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
			func_closefile(closegather_track_cmd);
			sleep(0.5);

			//打开处理轨迹程序，将采集的轨迹进行处理
			const string deal_track_cmd = "~/test/src/cartcpstd_msgs/deal_track.sh";
			func_openfile(deal_track_cmd);
			//等待轨迹处理
			sleep(3);
			if_dealtrack = 0;
		}
		//判断是否关闭处理轨迹的文件，如果没有，关闭处理轨迹的程序
		if(!if_dealtrack)
		{
			const string closedeal_track_cmd = "~/test/src/cartcpstd_msgs/closedeal_track.sh";
			func_closefile(closedeal_track_cmd);
		
			if_dealtrack = 1;
		}
		if(LastMode == 2 || LastMode == 0)//不是单车遥控或者停车模式的时候把serial_TXRX关闭
		{
			const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
			func_closefile(closegather_track_cmd);
		}
		if(LastMode == 5 || LastMode == 4) //关闭单车寻迹
   		{
		//判断打开的是正向寻机还是反向
			if(last_direction == 0x01)//上一个轨迹是正向，关闭正向寻迹的程序
    		{
				const string closesingletrackin_cmd = "~/test/src/cartcpstd_msgs/closetracking.sh";
				func_closefile(closesingletrackin_cmd);
			}
			if(last_direction == 0x02)//上一个轨迹是反向，关闭反向寻迹的程序
			{
				const string closeinverttrackin_cmd = "~/test/src/cartcpstd_msgs/closeinvert_tracking.sh";
				func_closefile(closeinverttrackin_cmd);
			}
			last_direction = 0x00;
		}
		if(LastMode ==3 ||LastMode == 4)//关闭编队
		{	
			const string closerobotfront_cmd = "~/test/src/cartcpstd_msgs/closerobot_front.sh";
			func_closefile(closerobotfront_cmd);
		}
		/*if(LastMode ==3)//关闭北斗
		{
				const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
				func_closefile(closegather_track_cmd);
		}*/
		if (mode == 3 || mode == 4)//打开编队
		{
			const string robotfront_cmd = "~/test/src/cartcpstd_msgs/robot_front.sh";
			func_openfile(robotfront_cmd);
		}

		if (mode == 5)//直接进入循迹程序
		{
		}
		if(mode == 6 || mode == 2 || mode == 0)//单车采集轨迹和遥控模式，打开北斗
		{	
			const string gather_track_cmd = "~/test/src/cartcpstd_msgs/gather_track.sh";
			func_openfile(gather_track_cmd);
		}
		
		dealmode( mode , pub,header,pub_mode);
		LastMode = mode;
		//cout << "LastMode = " << LastMode <<endl;
		//模式切换完成
		int length  = 10 + sizeof(posex.posec) + sizeof(posey.posec) + sizeof(posetheta.posec) + sizeof(poselinearvel.velc) + sizeof(poseangularvel.velc);
				
		for(int i = 0 ; i < 5 ; i ++)
		{
			GetCarParam();
			CarParamMsg[6] = (char)0x23;
			CarParamMsg[7] = (char)0x13;
			CarParamMsg[8] = header->cmd;//车辆所处状态
			CarParamMsg[9] = Formation_Mode ;//编队队形
			send(client._sock,CarParamMsg,length,0);
		}
		cout << "模式切换完成时小车所处状态：" << (int)header->cmd << endl;
		cout << "模式切换发送数据：";
		for(int i = 0 ; i < length ; i ++)
			cout << (int)CarParamMsg[i];
		cout << endl;
		modeLast = header->cmd;
	}
	else
		dealmode(mode , pub,header, pub_mode);
}
 
//接收指挥端消息函数
 void Recvmsg(ros::Publisher pub,ros::Publisher pub_mode)
 {
		DataHeader recvmsg;
		unsigned char sourceIPaddress[4];
		unsigned char IPaddress[4] = {0xc0,0xa8,0x0A,0x21}; //源地址
	
		for(int i = 0 ; i < 4 ; i ++)
		{
			sourceIPaddress[i] = recvbuff[i+2];
		}
		recvmsg.dataLength = (int)recvbuff[6];
		cout << "数据长度:" << recvmsg.dataLength <<endl; 
		recvmsg.cmd =  recvbuff[7];
		printf("命令字1停车2急停3单车遥控4群组遥控5群组循迹7单车循迹8单车采集轨迹 %d\n",(int)recvmsg.cmd);
		for(int i = 0 ; i < recvmsg.dataLength+7;i++)
			cout << (int)recvbuff[i];
		cout << endl;
		unsigned char recv_msg[recvmsg.dataLength];
	
	 	for(int i = 0 ; i  < recvmsg.dataLength - 1; i ++)
		 {
			 recv_msg[i] = recvbuff[i+8];	 
		 }
		 
		//string msg(recv_msg);
		recvmsg.msg = recv_msg ;
		//处理网络消息
		if(recvbuff[0] == 'A' &&recvbuff[1] == 'A' && compare2arrar(sourceIPaddress,IPaddress) == 0) //上位机发送来的命令
		{
			if(recvmsg.cmd == 0x06)
			{
				char reply[8] = {'A','A',(char)0x7F,(char)0x00,(char)0x01,(char)0x00,(char)0x01,(char)0x14};
				send(client._sock,reply,8,0);
			}
			unsigned char IPcar_cmd[4];
			unsigned char IPcar_home[4] = {0x7F,0x00,0x01,0x00}; //本车辆地址
			for(int i =  0; i < 4 ; i ++ )
			IPcar_cmd[i] = recv_msg[i];

			//如果指挥端控制的车辆IP是本车辆，则进入OnNetMessage处理模式信息
			if(compare2arrar(IPcar_cmd,IPcar_home) == 0) //车辆地址
			{
				OnNetMessage(&recvmsg,pub,pub_mode);
			}
		}		
 }

 //与指挥端进行来连接，判断标志位i的值，如果小于1，则循环等待指挥端连接
void  connect()
{
		ros::Rate r(1);
		int i = client.ConnectServer("192.168.10.33",80);
		while(i<0)
		{
    	 i = client.ConnectServer("192.168.10.33",80);
		r.sleep();
		}		
}
//订阅到小车速度信息，则进入该回调函数
void velMsg(const nav_msgs::Odometry::ConstPtr& msg)
{
		poselinearvel.velf = msg->twist.twist.linear.x;
		poseangularvel.velf = msg->twist.twist.angular.z;
}
//订阅到小车位置信息，则进入该回调函数
void poseMsg(const styx_msgs::Position::ConstPtr& msg)
{
	    posex.posed = msg->latitude;
		posey.posed = msg->longitude;
		posetheta.posed =msg->yaw;
}
//由于指挥端可能直接与小车断开连接，该函数将之前打开的程序关闭，并初始化参数
void func_initcar(){
	if(LastMode == 6)//关闭单车采集轨迹
	{
		const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
		func_closefile(closegather_track_cmd);
		sleep(0.5);
		
		const  string deal_track_cmd = "~/test/src/cartcpstd_msgs/deal_track.sh";
		func_openfile(deal_track_cmd);
		sleep(5);
				
		if_dealtrack = 0;
	}
	if(!if_dealtrack)
	{
		const string closedeal_track_cmd = "~/test/src/cartcpstd_msgs/closedeal_track.sh";
		func_closefile(closedeal_track_cmd);
		
		if_dealtrack = 1;
	}
	if(LastMode == 2 || LastMode == 0)//不是单车遥控的时候把serial_TXRX关闭
	{
		const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
		func_closefile(closegather_track_cmd);
	}
	if(LastMode == 5 || LastMode == 4) //关闭单车寻迹
   	{
		//判断打开的是正向寻机还是反向
		if(last_direction == 0x01)//上一个轨迹是正向，关闭正向寻迹的程序
    	{
			const string closesingletrackin_cmd = "~/test/src/cartcpstd_msgs/closetracking.sh";
			func_closefile(closesingletrackin_cmd);
		}
		if(last_direction == 0x02)//上一个轨迹是反向，关闭反向寻迹的程序
		{
			const string closeinverttrackin_cmd = "~/test/src/cartcpstd_msgs/closeinvert_tracking.sh";
			func_closefile(closeinverttrackin_cmd);
		}
			last_direction = 0x00;
	}

	if(LastMode ==3 ||LastMode == 4)//关闭编队
	{
		const string closerobotfront_cmd = "~/test/src/cartcpstd_msgs/closerobot_front.sh";
		func_closefile(closerobotfront_cmd);
	}
	/*if(LastMode ==3)//关闭北斗
	{
		const string closegather_track_cmd = "~/test/src/cartcpstd_msgs/closegather_track.sh";
		func_closefile(closegather_track_cmd);
	}*/

	gearNow = 0;
	gearLast = 1; //存放上一次的档位，利用电平升降判断是否进行档位变化
 	modeLast = 0x00;//存放上一次的车辆状态
// int flag = 0;
	LastMode = -1; 
	Formation_Mode = 0x00;//编队队形
	if_dealtrack = true;//是否关闭轨迹信息处理程序，true已经关了，false 还没关
	direction = 0x00;
	last_direction = 0x00;
}
bool EStop_flag = false;
void Estopcall_back(const std_msgs::Bool & stop_flag)
{
    EStop_flag = stop_flag.data;
	if(EStop_flag)
	{
		char reply[8] = {'A','A',(char)0x7F,(char)0x00,(char)0x01,(char)0x00,(char)0x01,(char)0x10};
		send(client._sock,reply,8,0);
	}
}

//主函数
int main(int argc, char** argv)
{
       ros::init(argc,argv,"client");
       ros::NodeHandle nh;
       ros::NodeHandle n("~");	
		std::string descr=getenv("CAR_TYPE");
		connect();
		bool i = 0;
		//打开底盘程序以及多机通讯程序
		basecontrol(i);
		//发布者pub，pub_mode，分别发布小车的速度以及编队模式
		ros::Publisher pub = nh.advertise<geometry_msgs::Twist>(descr+"/cmd_vel",10);
		ros::Publisher 	pub_mode = nh.advertise<styx_msgs::model>("/model_info",1);
		pubEstop =  nh.advertise<std_msgs::Bool>("/EStop_info",1);
		ros::Rate r(10);

		//订阅者vel_sub，pose_sub，订阅小车速度和位姿信息
	    ros::Subscriber vel_sub = nh.subscribe<nav_msgs::Odometry>(descr+"/odom",100,velMsg);
		ros::Subscriber pose_sub = nh.subscribe<styx_msgs::Position>(descr+"/position",100,poseMsg);
	
   		ros::Subscriber subEstop = nh.subscribe("emergency_stop", 1,Estopcall_back);

		//设置函数指针，在checkTopic函数文件中，判断是否订阅到北斗消息，如果没有，则重新订阅，并通过此函数指针调用回调函数velMsg，poseMsg
		void (*pfVel)(const nav_msgs::Odometry::ConstPtr&);
		void (*pfPose)(const styx_msgs::Position::ConstPtr& );
		pfVel = velMsg;
		pfPose = poseMsg;

		//checkTopic函数文件中自定义类型
		CarStartServuceClient test(&nh,vel_sub,pose_sub,pfVel,pfPose);
		char buff[10];
	 	while(ros::ok())
		{
		   //connect();
			//判断是否接收到指挥端消息
			if(!client.RecvData())
				if(!EStop_flag)
					Recvmsg(pub,pub_mode);
			//向指挥端发送小车当前信息，包括所处模式速度位姿信息等
		 	 sendCarParam();
			 //判断是否订阅到北斗信息
			 test.onUpdate();
			 //如果接收函数返回值为-1，说明指挥端已经断开连接，此时需要重新连接
			if(client.RecvData()==-1)
			{
				func_initcar();
				client.InitSocket();
				
				connect();
			}
    		ros::spinOnce(); 
			r.sleep();
	 	}
	client.CloseSocket();
	std::cout << "客户端停止工作!" << std::endl;
	getchar();  //防止程序一闪而过
	i = 1;
	basecontrol(i);
	return 0;
}

void twoCharlink(char* a , char* b,int i ,int length){

	for(int j = 0;j<length;j++)
	{
		a[i + j] = b[j];
	}
}
//获取车辆自身参数
void GetCarParam()
{
	//std::cout << posex.posed <<posey.posed <<posetheta.posed<<poselinearvel.velf<<poseangularvel.velf <<std::endl;
	int len = sizeof(FrameAndIIP);
	twoCharlink(CarParamMsg,FrameAndIIP,0,len);
 	twoCharlink(CarParamMsg,posex.posec,len ,8);
	twoCharlink(CarParamMsg,posey.posec,len + 8,8);
	twoCharlink(CarParamMsg,posetheta.posec,len + 16,8);
	twoCharlink(CarParamMsg,poselinearvel.velc,len + 24,4);
	twoCharlink(CarParamMsg,poseangularvel.velc,len + 28,4);
}
void sendCarParam(){
	GetCarParam();
	CarParamMsg[6] = (char)0x2a;
	CarParamMsg[7] = (char)0x12;
	CarParamMsg[8] = (char)0x00;//车辆所处状态
	CarParamMsg[9] = (char)0x00;//编队队形
	cout <<"线速度 : " << poselinearvel.velf << "\t角速度 ：" << poseangularvel.velf << endl;
	int length  = 10 + sizeof(posex.posec) + sizeof(posey.posec) + sizeof(posetheta.posec) + sizeof(poselinearvel.velc) + sizeof(poseangularvel.velc);
	char sendGear;
	if(gearNow == 0)
	{
			sendGear = 0x00;
	}
		if(gearNow == 1)
	{
			sendGear = 0x01;
	}
		if(gearNow ==  -1)
	{
			sendGear = 0x02;
	}
	CarParamMsg[length] = sendGear;
	length++;
	send(client._sock,CarParamMsg,length,0);
}
//打开底盘和多机通信
int  basecontrol(bool i){
	if( i == 0)
    {
         //连接小车底盘
         const  string cmd = "~/test/src/cartcpstd_msgs/basecontroller.sh";
         const char* sysCommand = cmd.data();
         base_control = popen( sysCommand,"r");
         if(base_control == NULL)
         {
             perror("popen error\n");
             return -1;
         }
		//打开底盘程序后打开多机通信
		else{
			const  string openmultimaster_cmd = "~/test/src/cartcpstd_msgs/multimaster.sh";
            const char* sysmultimaster_Command = openmultimaster_cmd.data();
            multi = popen( sysmultimaster_Command,"r");
            if(multi == NULL)
            {
                perror("popen error\n");
                return -1;
            }
            else   
				return  0;
        }

    }

                                        //打开多机通迅程序

  else{
       const string closecmd = "~/test/src/cartcpstd_msgs/closebasecontroller.sh";
       const char* syscloseCommand = closecmd.data();
       closebase_control = popen( syscloseCommand,"r");
       cout<< "close file:"<<endl;
       pclose(closebase_control);
       pclose(base_control);

       const string closemulti_cmd = "~/test/src/cartcpstd_msgs/closemultimaster.sh";
       const char* sysclosemulti_Command = closemulti_cmd.data();
       closemulti = popen( sysclosemulti_Command,"r");
       cout<< "close file:"<<endl;
       pclose(closemulti);
       pclose(multi);

       return 1;
    }
}
