#include<ros/ros.h>
#include<iostream>
#include <string>
#include<vector>
#include<stdio.h>
#include<serial/serial.h>
#include<std_msgs/String.h>
#include<fstream>
#include<math.h>
#include<nav_msgs/Odometry.h>
#include<std_msgs/Bool.h>
#include<geometry_msgs/Twist.h>
#include"dynamic_reconfigure/server.h"
#include"serial_driver/haitun_dyConfig.h"
#include"unistd.h"
#define pi acos(-1)
serial::Serial sps; 
using namespace std;
unsigned char buffer[13] = {0};//
unsigned char buffer_send[15]={0};
nav_msgs::Odometry odom;//定义里程计信息全局变量
//联合体定义
union _FLOAT_Data
{
    float d1;
    char data[4];
}brake,throttle,brake0,brake1,changebrake;//刹车、油门联合体定义
union _Steer_data
{
    short int d2;
    char data[2];
}steer;//方向盘联合体定位
char gear;//档位
char handbrake;//手刹
char emergency_stop;//紧急停车
float brak0=(float)(-pi/4);//刹车踩到底
float brak1=0.0;//刹车没有cai
bool flag=0;//急停标志位
/////////////////////////////////线速度的增量pidjiao矫正/////////////////////
float err_l=0;//实际速度与目标速度误差
float err_last_l=0;        //定义上个偏差
float err_next_l=0;       //定义上一个偏差值
float Kp_l,Ki_l,Kd_l;
float DATA=(-pi/4);
//增量式算法
float PID_calculate_l(float ActualSpeed_l,float speed_l)//实际速度，设定速度
{
    ros::param::get("Kp_l",Kp_l);
    ros::param::get("Ki_l",Ki_l);
    ros::param::get("Kd_l",Kd_l);
    err_l =speed_l - ActualSpeed_l;
    float incrementSpeed_l = Kp_l*(err_l- err_next_l) + Ki_l*err_l + Kd_l * (err_l - 2*err_next_l + err_last_l);
    err_last_l = err_next_l;     //定义上一个偏差值
    err_next_l = err_l;
    float result=incrementSpeed_l;
    return result;
}
int LimitSteer(int num)//方向盘限位函数
{
    if(num>535)
    {
        num=535;
        return num;
    }
    else if(num<-535)
    {
        num=-535;
        return num;
    }
    else
    {
        return num;
    }
}
float Limitbrake_throttle(float num)//油门刹车限位函数
{
    if(num>0)
    {
        num=0;
        return num;
    }
    else if(num<(float)(-pi/4))
    {
        num=(float)(-pi/4);
        return num;
    }
    else
    {
        return num;
    }
}
void emerge_brake()//车辆急停函数
{
    brake0.d1=brak0;
    unsigned char buff[13] = {0};
    for(int i=0;i<4;i++)
    {
        buff[i]=brake0.data[i];
    }
    cout<<"车辆处于急停状态"<<endl;
    buffer_send[0]=0xAA;
    buffer_send[14]=0xBB;
    for(int i=0;i<13;i++)
    {
         buffer_send[i+1]=buff[i];
    }
    sps.write(buffer_send,sizeof(buffer_send));
    sleep(0.005);
}
void emerge_brakeCallback(const std_msgs::Bool &flage)//急停信息订阅
{
    flag=flage.data;
}
void odomCallback(const nav_msgs::Odometry &sub_odom)//北斗速度信息订阅
{
    odom=sub_odom;
}
void cmd_velCallback(const geometry_msgs::Twist &twist_aux)//速度信息处理之后下发下位机
{ 
    brake0.d1=DATA;//刹车踩到底
    changebrake.d1=(float)(-pi/4);
    brake1.d1=0;  //刹车没踩下
    double throttle_param,steer_param,Pid_speed_param;
    ros::param::get("/haitun_base_control/throttle_param",throttle_param);
    ros::param::get("/haitun_base_control/steer_param",steer_param);
    ros::param::get("/haitun_base_control/Pid_speed_param",Pid_speed_param);
    if(twist_aux.linear.x==0)//速度为0时
    {
        DATA=(-pi/4);;
        if(abs(odom.twist.twist.linear.x)<0.01)//北斗测得速度也为0
        {  
            brake.d1=(float)(-pi/4);
            throttle.d1=0.0;
            steer.d2=0;
            gear=1;
            handbrake=0;
            emergency_stop=0;
        }
        else
        {
            brake.d1=(float)(-pi/4);
            throttle.d1=0.0;
            steer.d2=-(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));;
            steer.d2=LimitSteer(steer.d2);
            gear=1;
            handbrake=0;
            emergency_stop=0;
        }
        if(flag==1)
        {
            emerge_brake();
        }
        else
        {
            steer.d2=LimitSteer(steer.d2);
            //串口信息赋值
            for(int i=0;i<4;i++)
            {
                buffer[i]=brake.data[i];
            }
            for(int i=4;i<8;i++)
            {
                buffer[i]=throttle.data[i-4];
            }
            for(int i=8;i<10;i++)
            { 
                buffer[i]=steer.data[i-8];
            }
             //串口信息赋值
            buffer[10]=gear;
            buffer[11]=handbrake;
            buffer[12]=emergency_stop;
            if(handbrake==0)
            {
                cout<<"车辆处于体内停车状态，手刹处于升起状态"<<endl;
            }
            cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
           // printf("%x,%x",buffer[8],buffer[9]);
           // cout<<endl;
           buffer_send[0]=0xAA;
           buffer_send[14]=0xBB;
           for(int i=0;i<13;i++)
           {
               buffer_send[i+1]=buffer[i];
           }
           sps.write(buffer_send,sizeof(buffer_send));//串口发送
           sleep(0.005);
        }
    }
    else if(twist_aux.linear.x!=0&&abs(odom.twist.twist.linear.x)<0.01)
    {
        if(twist_aux.linear.x>0)
        {
            brake.d1=0.0;
            throttle.d1=(float)(-twist_aux.linear.x*throttle_param);
            steer.d2=-(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=0;
            handbrake=1;
            emergency_stop=0;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            { //串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake0.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                //串口信息赋值
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                //printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
                if(DATA!=0)
                {
                    cout<<"手刹正在放下"<<endl;
                    cout<<"刹车："<<brake0.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<< steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                    sleep(7);
                    // for(int i=0;i<4;i++)
                    // {
                    //    buffer[i]=brake.data[i];
                    // }
                    // cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                    // sleep(1.5);
                    // for(int i=0;i<4;i++)
                    // {
                    //     buffer[i]=changebrake.data[i];
                    // }
                    // cout<<"刹车："<<changebrake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<< steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                    // sleep(1.5);
                }
                else
                {
                        cout<<"刹车："<<brake0.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<< steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                }
                DATA=0;
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
               /// printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(3);

            }                  
        }
        if(twist_aux.linear.x<0)
        {
            brake.d1=0.0;
            throttle.d1=(float)(twist_aux.linear.x*throttle_param);
            steer.d2=(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=2;
            handbrake=1;
            emergency_stop=0;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            {//串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake0.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                //串口信息赋值
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                //printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
                if(DATA!=0)
                {
                    cout<<"手刹正在放下"<<endl;
                    cout<<"刹车："<<brake0.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                    sleep(7);
                    // for(int i=0;i<4;i++)
                    // {
                    //    buffer[i]=brake.data[i];
                    // }
                    // cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                    // sleep(1.5);
                    // for(int i=0;i<4;i++)
                    // {
                    //     buffer[i]=changebrake.data[i];
                    // }
                    // sleep(1.5);
                    // cout<<"刹车："<<changebrake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<< steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                }
                else
                {
                    cout<<"刹车："<<brake0.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                }
                DATA=0;
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                //printf("%x,%x",buffer[8],buffer[9]);
               // cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(3);

            }                  
        }     
    }
    else if(twist_aux.linear.x*odom.twist.twist.linear.x<0)
    {
        if(twist_aux.linear.x>0)
        {
            brake.d1=0.0;
            throttle.d1=(float)(-twist_aux.linear.x*throttle_param);
            steer.d2=-(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=0;
            handbrake=1;
            emergency_stop=0;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            {   //串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=changebrake.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                //串口信息赋值
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                cout<<"刹车："<<changebrake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
               // printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(3);
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                //printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
            }                  
        }
        else if(twist_aux.linear.x<0)
        {
            brake.d1=0.0;
            throttle.d1=(float)(twist_aux.linear.x*throttle_param);
            steer.d2=(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=2;
            handbrake=1;
            emergency_stop=0;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            { //串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake0.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                cout<<"刹车："<<brake0.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                //printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(3);
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                //printf("%x,%x",buffer[8],buffer[9]);
               // cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
            }
        }
    }
    else if(twist_aux.linear.x*odom.twist.twist.linear.x>0)     
    {
        if(twist_aux.linear.x>0)
        {
            brake.d1=0;
            steer.d2=-(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=0;
            handbrake=1;
            emergency_stop=0;
            float result=PID_calculate_l(odom.twist.twist.linear.x,twist_aux.linear.x);
            throttle.d1=-result;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            {//串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<< steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                /*for(int i=0;i<13;i++)
                {
                    cout<<buffer[i]<<" ";
                }
                
		cout<<endl;
		*/
                //printf("%x,%x",buffer[8],buffer[9]);
                //cout<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
            }
        }
        if(twist_aux.linear.x<0)
        {
            brake.d1=0;
            steer.d2=(short)(steer_param*atan(3.4*twist_aux.angular.z/twist_aux.linear.x));
            gear=2;
            handbrake=1;
            emergency_stop=0;
            float result=PID_calculate_l(odom.twist.twist.linear.x,twist_aux.linear.x);
            throttle.d1=result;
            throttle.d1=Limitbrake_throttle(throttle.d1);
            steer.d2=LimitSteer(steer.d2);
            if(flag==1)
            {
                emerge_brake();
            }
            else
            {//串口信息赋值
                for(int i=0;i<4;i++)
                {
                    buffer[i]=brake.data[i];
                }
                for(int i=4;i<8;i++)
                {
                    buffer[i]=throttle.data[i-4];
                }
                for(int i=8;i<10;i++)
                { 
                    buffer[i]=steer.data[i-8];
                }
                //串口信息赋值
                buffer[10]=gear;
                buffer[11]=handbrake;
                buffer[12]=emergency_stop;
                cout<<"刹车："<<brake.d1<<"  "<<"油门："<<throttle.d1<<"  "<<"方向盘："<<steer.d2<<"  "<<"档位："<<gear<<"  "<<"手刹："<<handbrake<<"  "<<"急停"<<emergency_stop<<"  "<<endl;
                buffer_send[0]=0xAA;
                buffer_send[14]=0xBB;
                for(int i=0;i<13;i++)
                {
                    buffer_send[i+1]=buffer[i];
                }
                sps.write(buffer_send,sizeof(buffer_send));//串口发送
                sleep(0.005);
            }
        }
    }
} 
void callback(serial_driver::haitun_dyConfig& config, uint32_t level)
{
   ROS_INFO("Reconfigure Request: %.2f,%.2f", config.throttle_param,config.steer_param);
}
int  main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"haitun_base_control");
    ros::NodeHandle nh;
    dynamic_reconfigure::Server<serial_driver::haitun_dyConfig> server;
    dynamic_reconfigure::Server<serial_driver::haitun_dyConfig> ::CallbackType cbType;
    cbType=boost::bind(&callback,_1,_2);
    server.setCallback(cbType);
    ros::Subscriber emergency_sub = nh.subscribe("/emergency_brake", 1, emerge_brakeCallback);//订阅急停信息
    ros::Subscriber  odom_sub = nh.subscribe("/maincar/odom", 1,odomCallback);//订阅上位机发布的速度话题
    ros::Subscriber  cmd_vel_sub = nh.subscribe("/maincar/cmd_vel", 1,cmd_velCallback);//订阅上位机发布的速度话题
    //串口设置
    try
    {
        sps.setPort("/dev/haitun_base");
        sps.setBaudrate(115200); 
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);
        sps.setTimeout(to);
        sps.open();
    }
    catch(serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port.");
        return -1;
    }
    if(sps.isOpen())
    {
        ROS_INFO_STREAM("/dev/haitun_base is opened.");
    }
    else
    {
        return -1;
    }
    ros::spin();
    return 0;
}
