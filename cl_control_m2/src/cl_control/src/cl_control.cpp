#include <fcntl.h>
#include <dirent.h>
#include <linux/input.h>
#include <sys/stat.h>
#include <pthread.h>
#include <time.h>
#include <Eigen/Dense>
#include<map>
#include <boost/bind.hpp>
#include <boost/thread.hpp>

#include "cl_control.h"

//L*W*H=3.25*1.5*0.36   长宽高
//Wheelbase=2m  轴距
//轮距:1.31m
//轮胎直径：D=38.1cm  轮胎半径：R=19.05cm
//通过电机转速计算车速 V=2*3.1415926*R*转速/60    转速单位为rpm
//通过电机转速计算车辆
//通过车速计算电机转速  转速=60*V/2*3.1415926*R

uint16_t count = 0;
double dt = 0.1;
double ki = 0.1;
double kp =0.4;
double integral = 0;
double current_x = 0, last_x;
float angular = 0, vel = 0;
uint16_t Rpm_total=0;

uint16_t LF_Rpm=0;
uint16_t RF_Rpm=0;
uint16_t LR_Rpm=0;
uint16_t RR_Rpm=0;

uint16_t RR_Rpm_temp=0;

uint8_t LF_Motor_Gear=0;
uint8_t RF_Motor_Gear=0;
uint8_t LR_Motor_Gear=0;
uint8_t RR_Motor_Gear=0;

uint8_t  LF_Motor_En = 0;
uint8_t  RF_Motor_En = 0;
uint8_t  LR_Motor_En = 0;
uint8_t  RR_Motor_En = 0;

uint8_t LF_Motor_Brake = 0;
uint8_t RF_Motor_Brake = 0;
uint8_t LR_Motor_Brake = 0;
uint8_t RR_Motor_Brake = 0;

_Float32 Target_Brk_Press = 0;
uint16_t Target_Steer_F = 0;
uint8_t Target_Steer_F_En = 0;
uint16_t Target_Steer_R = 0;
uint8_t Target_Steer_R_En = 0;
uint8_t EPB_Switch = 0;
uint8_t Target_Mode = 0;


int WheelAngleTosteering(float a)
{

	
    std::map<float,int> steeringToWheelAngle;
	
    steeringToWheelAngle[-33.45] = 536;
    steeringToWheelAngle[-30.239] = 494;
    steeringToWheelAngle[-27.249] = 453;
    steeringToWheelAngle[-24.421] = 412;
    steeringToWheelAngle[-21.715] = 371;
    steeringToWheelAngle[-19.107] = 330;
    steeringToWheelAngle[-16.574] = 288;
    steeringToWheelAngle[-14.102] = 247;
    steeringToWheelAngle[-11.679] = 206;
    steeringToWheelAngle[-9.295] = 165;
    steeringToWheelAngle[-6.942] = 124;
    steeringToWheelAngle[-4.612] = 82;
    steeringToWheelAngle[-2.3] = 41;
    steeringToWheelAngle[0] = 0;
    steeringToWheelAngle[2.293] = -41;
    steeringToWheelAngle[4.5982] = -82;
    steeringToWheelAngle[6.873] = -124;
    steeringToWheelAngle[9.17] = -165;
    steeringToWheelAngle[11.475] = -206;
    steeringToWheelAngle[13.792] = -247;
    steeringToWheelAngle[16.125] = -288;
    steeringToWheelAngle[18.477] = -330;
    steeringToWheelAngle[20.85] = -371;
    steeringToWheelAngle[23.249] = -412;
    steeringToWheelAngle[25.675] = -453;
    steeringToWheelAngle[28.162] = -494;
    steeringToWheelAngle[30.621] = -536;

	/*
	steeringToWheelAngle[33.45] = 536;
    steeringToWheelAngle[30.239] = 494;
    steeringToWheelAngle[27.249] = 453;
    steeringToWheelAngle[24.421] = 412;
    steeringToWheelAngle[21.715] = 371;
    steeringToWheelAngle[19.107] = 330;
    steeringToWheelAngle[16.574] = 288;
    steeringToWheelAngle[14.102] = 247;
    steeringToWheelAngle[11.679] = 206;
    steeringToWheelAngle[9.295] = 165;
    steeringToWheelAngle[6.942] = 124;
    steeringToWheelAngle[4.612] = 82;
    steeringToWheelAngle[-2.3] = 41;
    steeringToWheelAngle[0] = 0;
    steeringToWheelAngle[-2.293] = -41;
    steeringToWheelAngle[-4.5982] = -82;
    steeringToWheelAngle[-6.873] = -124;
    steeringToWheelAngle[-9.17] = -165;
    steeringToWheelAngle[-11.475] = -206;
    steeringToWheelAngle[-13.792] = -247;
    steeringToWheelAngle[-16.125] = -288;
    steeringToWheelAngle[-18.477] = -330;
    steeringToWheelAngle[-20.85] = -371;
    steeringToWheelAngle[-23.249] = -412;
    steeringToWheelAngle[-25.675] = -453;
    steeringToWheelAngle[-28.162] = -494;
    steeringToWheelAngle[-30.621] = -536;*/
	

    //x << 33.45, 30.239, 27.249, 24.421, 21.715, 19.107, 16.574, 14.102, 11.679, 9.295, 6.942, 4.612, 2.3, 0, -2.293, -4.5982, -6.873, -9.17, -11.475, -13.792, -16.125, -18.477, -20.85, -23.249, -25.675, -28.162, -30.621;

    //y << 536, 494, 453, 412, 371, 330, 288, 247, 206, 165, 124, 82, 41, 0, -41, -82, -124, -165, -206, -247, -288, -330, -371, -412, -453, -494, -536;
auto it = steeringToWheelAngle.upper_bound(a);

    if (it == steeringToWheelAngle.begin()) {
        {
            return it->second;
        }

    } else
	 {
        double steeringAngleHigh = it->first;
        double wheelAngleHigh = it->second;
        --it;
        double steeringAngleLow = it->first;
        double wheelAngleLow = it->second;
		double interpolatedWheelAngle = wheelAngleLow + (wheelAngleHigh - wheelAngleLow) / (steeringAngleHigh - steeringAngleLow) * (a - steeringAngleLow);
		if(interpolatedWheelAngle<=0.1 && interpolatedWheelAngle>=-0.1){

			double interpolatedWheelAngle = 0;
			std::cout<<interpolatedWheelAngle<<std::endl;
			return interpolatedWheelAngle;
		}else
		{
			std::cout<<interpolatedWheelAngle<<std::endl;
			return interpolatedWheelAngle;
		}


		}
       
    

    
}
namespace cl_tool {




cl_control::cl_control()
{
	ros::NodeHandle private_node("~");
	
}


cl_control::~cl_control()
{

}
/*
void cl_control::IPC_Control1_Callback(cl_msgs::control1 msg)
{

	cmd_mutex_.lock();

	memset(sendData_u_Control1,0,8);

	//左前轮电机转速LF
	sendData_u_Control1[0] = sendData_u_Control1[0] | (msg.LF_Rpm & 0xff); //8
	sendData_u_Control1[1] = sendData_u_Control1[1] | ((msg.LF_Rpm & 0x3ff)>>8 & 0x03); //2
	//右前轮电机转速RF
	sendData_u_Control1[1] = sendData_u_Control1[1] | ((msg.RF_Rpm & 0x3f)<<2); //6
	sendData_u_Control1[2] = sendData_u_Control1[2] | ((msg.RF_Rpm & 0x3ff)>>6 & 0x0f); //4 
	//左后轮电机转速LR
	sendData_u_Control1[2] = sendData_u_Control1[2] | ((msg.LR_Rpm & 0x0f)<<4 & 0xf0); // 4
	sendData_u_Control1[3] = sendData_u_Control1[3] | ((msg.LR_Rpm & 0x3ff)>>4 & 0x3f); //6
	//右后轮电机转速RR
	sendData_u_Control1[3] =  sendData_u_Control1[3] | ((msg.RR_Rpm & 0x03)<<6 & 0xf0); //2
	sendData_u_Control1[4] =  sendData_u_Control1[4] | ((msg.RR_Rpm & 0x3ff)>>2 & 0xff); //8

	
	//左前轮挡位LF
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((msg.LF_Motor_Gear & 0x03) & 0x0f); //
	//std::cout<<msg.LF_Motor_Gear<<std::endl;
	//右前轮挡位RF
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((msg.RF_Motor_Gear & 0x03)<<2 & 0x0f); // 左移2位，
	//左后轮挡位LR
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((msg.LR_Motor_Gear & 0x03)<<4 & 0xf0); // 左移4位，
	//右后轮挡位RR
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((msg.RR_Motor_Gear & 0x03)<<6 & 0xf0); // 左移6位

	//左前轮电机控制始能LF
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.LF_Motor_En & 0x01) & 0x0f); // 
	//右前轮电机控制始能RF
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.RF_Motor_En & 0x01)<<1 & 0x0f); // 左移1位，
	//左后轮电机控制始能LR
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.LR_Motor_En & 0x01)<<2 & 0x0f); // 左移2位，
	//右后轮电机控制始能RR
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.RR_Motor_En & 0x01)<<3 & 0x0f); // 左移3位，

	//左前轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.LF_Motor_Brake & 0x01)<<4 & 0xf0); // 左移4位，
	//右前轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.RF_Motor_Brake & 0x01)<<5 & 0xf0); // 左移5位，
	//左后轮电机制动	
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.LR_Motor_Brake & 0x01)<<6 & 0xf0); // 左移6位，
	//右后轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((msg.RR_Motor_Brake & 0x01)<<7 & 0xf0); //左移7位，

	//sendData_u_Control1[7] = sendData_u_Control1[0] ^ sendData_u_Control1[1] ^ sendData_u_Control1[2] ^ sendData_u_Control1[3] ^ sendData_u_Control1[4] ^ sendData_u_Control1[5] ^ sendData_u_Control1[6];

	send_frame_[0].can_id = 0xA1;
	//send_frame_[2].can_id = 0xA1;
	send_frame_[0].can_dlc = 8;

	memcpy(send_frame_[0].data, sendData_u_Control1, 8);

	int ret = write(dev_handler_, &send_frame_[0], sizeof(send_frame_[0]));
    if (ret <= 0) 
	{
      ROS_ERROR("send message failed, error code: %d",ret);
    }	

	cmd_mutex_.unlock();

}

void cl_control::IPC_Control2_Callback(cl_msgs::control2 msg)
{
	cmd_mutex_.lock();
	
	memset(sendData_u_Control2,0,8);
	sendData_u_Control2[0] =sendData_u_Control2[0] | (uint(msg.Target_Brk_Press*10) & 0xff); // 8  提取出Target_Brk_Press
	//前轮目标转向角度
	sendData_u_Control2[1] = sendData_u_Control2[1] | (msg.Target_Steer_F & 0xff); //8 提取出Target_Steer_Angle
	//std::cout<<sendData_u_Control2[0]<<std::endl;
	sendData_u_Control2[2] = sendData_u_Control2[2] | ((msg.Target_Steer_F & 0xff00)>>8); // 7 提取出Target_Steer_Angle

	//前轮目标转向使能
	//std::cout<<msg.Target_Steer_F_En<<std::endl;
	sendData_u_Control2[2] = sendData_u_Control2[2] | ((msg.Target_Steer_F_En & 0x01)<<7); // 1 提取出Target_Steer_Enable

	//后轮目标转向角度
	sendData_u_Control2[3] = sendData_u_Control2[3] | (msg.Target_Steer_R & 0xff); //8 提取出Target_Steer_Angle
	sendData_u_Control2[4] = sendData_u_Control2[4] | ((msg.Target_Steer_R & 0xff00)>>8); // 7提取出Target_Steer_Angle

	//后轮目标转向使能
	sendData_u_Control2[4] = sendData_u_Control2[4] | ((msg.Target_Steer_R_En & 0x01)<<7); // 1
	//EPB状态
	sendData_u_Control2[5] = sendData_u_Control2[5] | ((msg.EPB_Switch & 0x3)<<3); //1 提取出EPB_Status
	//车辆控制模式
	sendData_u_Control2[5] = sendData_u_Control2[5] | ((msg.Target_Mode & 0x01)<<5); //1  提取出Vehicle_Mode
	//工控机生命信号
	sendData_u_Control2[6] = sendData_u_Control2[6] | (count & 0x0f); //4

	count++;
	if(count == 16)	count = 0;

	//sendData_u_Control2[6] = 0;
	//sendData_u_Control2[7] = sendData_u_Control2[0] ^ sendData_u_Control2[1] ^ sendData_u_Control2[2] ^ sendData_u_Control2[3] ^ sendData_u_Control2[4] ^ sendData_u_Control2[5] ^ sendData_u_Control2[6];


	send_frame_[0].can_id = 0xA2;
	send_frame_[0].can_dlc = 8;

	//send_frame_[2].can_id = 0xA2;
	//send_frame_[2].can_dlc = 8;

	memcpy(send_frame_[0].data, sendData_u_Control2, 8);

	int ret = write(dev_handler_, &send_frame_[0], sizeof(send_frame_[0]));
    if (ret <= 0) 
	{
      ROS_ERROR("send message failed, error code: %d",ret);
    }	

	cmd_mutex_.unlock();
}*/

void cl_control::IPC_Control1_Callback( cl_msgs::control3 msg)
{
	/*
	uint16_t LF_Rpm=0;
	uint16_t RF_Rpm=0;
	uint16_t LR_Rpm=0;
	uint16_t RR_Rpm=0;

	uint16_t RR_Rpm_temp=0;

	uint8_t LF_Motor_Gear=0;
	uint8_t RF_Motor_Gear=0;
	uint8_t LR_Motor_Gear=0;
	uint8_t RR_Motor_Gear=0;

	uint8_t  LF_Motor_En = 0;
	uint8_t  RF_Motor_En = 0;
	uint8_t  LR_Motor_En = 0;
	uint8_t  RR_Motor_En = 0;

	uint8_t LF_Motor_Brake = 0;
	uint8_t RF_Motor_Brake = 0;
	uint8_t LR_Motor_Brake = 0;
	uint8_t RR_Motor_Brake = 0;

	*/
	
	/*cl_msgs::VCU_info_1 back_msg;
	uint err = msg.RR_Rpm-back_msg.RR_Rpm;

	if(20<err && err<100)
	{
		integral += dt*err;
		msg.RR_Rpm+= uint(kp*err+ki*integral);
		RR_Rpm_temp = msg.RR_Rpm;
	}
	else{
		RR_Rpm_temp = msg.RR_Rpm;
		integral = 0;
	}
	RR_Rpm = RR_Rpm_temp;*/

	LF_Rpm = msg.LF_Rpm;
	RF_Rpm = msg.RF_Rpm;
	LR_Rpm = msg.LR_Rpm;
	RR_Rpm = msg.RR_Rpm;
	LF_Motor_Gear = msg.LF_Motor_Gear;
	RF_Motor_Gear = msg.RF_Motor_Gear;
	LR_Motor_Gear = msg.LR_Motor_Gear;
	RR_Motor_Gear = msg.RR_Motor_Gear;
	LF_Motor_En = msg.LF_Motor_En;
	RF_Motor_En = msg.RF_Motor_En;
	LR_Motor_En = msg.LR_Motor_En;
	RR_Motor_En = msg.RR_Motor_En;
	LF_Motor_Brake = msg.LF_Motor_Brake;
	RF_Motor_Brake = msg.RF_Motor_Brake;
	LR_Motor_Brake = msg.LR_Motor_Brake;
	RR_Motor_Brake = msg.RR_Motor_Brake;

	//cmd_mutex_.lock();

	memset(sendData_u_Control1,0,8);

	//左前轮电机转速LF
	sendData_u_Control1[0] = sendData_u_Control1[0] | (LF_Rpm & 0xff); //8
	sendData_u_Control1[1] = sendData_u_Control1[1] | ((LF_Rpm & 0x3ff)>>8 & 0x03); //2
	//右前轮电机转速RF494
	sendData_u_Control1[1] = sendData_u_Control1[1] | ((RF_Rpm & 0x3f)<<2); //6
	sendData_u_Control1[2] = sendData_u_Control1[2] | ((RF_Rpm & 0x3ff)>>6 & 0x0f); //4 
	//左后轮电机转速LR
	sendData_u_Control1[2] = sendData_u_Control1[2] | ((LR_Rpm & 0x0f)<<4 & 0xf0); // 4
	sendData_u_Control1[3] = sendData_u_Control1[3] | ((LR_Rpm & 0x3ff)>>4 & 0x3f); //6
	//右后轮电机转速RR
	sendData_u_Control1[3] =  sendData_u_Control1[3] | ((RR_Rpm & 0x03)<<6 & 0xf0); //2
	sendData_u_Control1[4] =  sendData_u_Control1[4] | ((RR_Rpm & 0x3ff)>>2 & 0xff); //8
	//std::cout<<RR_Rpm<<'1'<<std::endl;


	
	//左前轮挡位LF
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((LF_Motor_Gear & 0x03) & 0x0f); //
	//std::cout<<LF_Motor_Gear<<std::endl;
	//右前轮挡位RF
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((RF_Motor_Gear & 0x03)<<2 & 0x0f); // 左移2位，
	//左后轮挡位LR
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((LR_Motor_Gear & 0x03)<<4 & 0xf0); // 左移4位，
	//右后轮挡位RR
	sendData_u_Control1[5] =  sendData_u_Control1[5] | ((RR_Motor_Gear & 0x03)<<6 & 0xf0); // 左移6位
	//std::cout<<sendData_u_Control1[5]<<std::endl;

	//左前轮电机控制始能LF
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((LF_Motor_En & 0x01) & 0x0f); // 
	//右前轮电机控制始能RF
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((RF_Motor_En & 0x01)<<1 & 0x0f); // 左移1位，
	//左后轮电机控制始能LR
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((LR_Motor_En & 0x01)<<2 & 0x0f); // 左移2位，
	//右后轮电机控制始能RR
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((RR_Motor_En & 0x01)<<3 & 0x0f); // 左移3位，
	//std::cout<<sendData_u_Control1[5]<<std::endl;

	//左前轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((LF_Motor_Brake & 0x01)<<4 & 0xf0); // 左移4位，
	//右前轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((RF_Motor_Brake & 0x01)<<5 & 0xf0); // 左移5位，
	//左后轮电机制动	
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((LR_Motor_Brake & 0x01)<<6 & 0xf0); // 左移6位，
	//右后轮电机制动
	sendData_u_Control1[6] =  sendData_u_Control1[6] | ((RR_Motor_Brake & 0x01)<<7 & 0xf0); //左移7位，

	//sendData_u_Control1[7] = sendData_u_Control1[0] ^ sendData_u_Control1[1] ^ sendData_u_Control1[2] ^ sendData_u_Control1[3] ^ sendData_u_Control1[4] ^ sendData_u_Control1[5] ^ sendData_u_Control1[6];

	send_frame_[0].can_id = 0xA1;
	//send_frame_[2].can_id = 0xA1;
	send_frame_[0].can_dlc = 8;

	memcpy(send_frame_[0].data, sendData_u_Control1, 8);

	int ret = write(dev_handler_, &send_frame_[0], sizeof(send_frame_[0]));
    if (ret <= 0) 
	{
      ROS_ERROR("send message failed, error code: %d",ret);
    }	

	//cmd_mutex_.unlock();

}

void cl_control::IPC_Control2_Callback(const cl_msgs::control3 msg)
{

	/*
	_Float32 Target_Brk_Press = 0;
	uint16_t Target_Steer_F = 0;
	uint8_t Target_Steer_F_En = 0;
	uint16_t Target_Steer_R = 0;
	uint8_t Target_Steer_R_En = 0;
	uint8_t EPB_Switch = 0;
	uint8_t Target_Mode = 0;*/

	Target_Brk_Press = msg.Target_Brk_Press;
	Target_Steer_F = msg.Target_Steer_F;
	Target_Steer_F_En = msg.Target_Steer_F_En;
	Target_Steer_R = msg.Target_Steer_R;
	Target_Steer_R_En = msg.Target_Steer_R_En;
	EPB_Switch = msg.EPB_Switch;
	Target_Mode = msg.Target_Mode;


	//cmd_mutex_.lock();
	
	memset(sendData_u_Control2,0,8);
	sendData_u_Control2[0] =sendData_u_Control2[0] | (uint(Target_Brk_Press*10) & 0xff); // 8  提取出Target_Brk_Press
	//前轮目标转向角度
	sendData_u_Control2[1] = sendData_u_Control2[1] | (Target_Steer_F & 0xff); //8 提取出Target_Steer_Angle
	//std::cout<<sendData_u_Control2[0]<<std::endl;
	sendData_u_Control2[2] = sendData_u_Control2[2] | ((Target_Steer_F & 0xff00)>>8); // 7 提取出Target_Steer_Angle

	//前轮目标转向使能
	//std::cout<<msg.Target_Steer_F_En<<std::endl;
	sendData_u_Control2[2] = sendData_u_Control2[2] | ((Target_Steer_F_En & 0x01)<<7); // 1 提取出Target_Steer_Enable

	//后轮目标转向角度
	sendData_u_Control2[3] = sendData_u_Control2[3] | (Target_Steer_R & 0xff); //8 提取出Target_Steer_Angle
	sendData_u_Control2[4] = sendData_u_Control2[4] | ((Target_Steer_R & 0xff00)>>8); // 7提取出Target_Steer_Angle

	//后轮目标转向使能
	sendData_u_Control2[4] = sendData_u_Control2[4] | ((Target_Steer_R_En & 0x01)<<7); // 1
	//EPB状态
	sendData_u_Control2[5] = sendData_u_Control2[5] | ((EPB_Switch & 0x3)<<3); //1 提取出EPB_Status
	//车辆控制模式
	sendData_u_Control2[5] = sendData_u_Control2[5] | ((Target_Mode & 0x01)<<5); //1  提取出Vehicle_Mode
	//工控机生命信号
	sendData_u_Control2[6] = sendData_u_Control2[6] | (count & 0x0f); //4

	count++;
	if(count == 16)	count = 0;

	//sendData_u_Control2[6] = 0;
	//sendData_u_Control2[7] = sendData_u_Control2[0] ^ sendData_u_Control2[1] ^ sendData_u_Control2[2] ^ sendData_u_Control2[3] ^ sendData_u_Control2[4] ^ sendData_u_Control2[5] ^ sendData_u_Control2[6];


	send_frame_[0].can_id = 0xA2;
	send_frame_[0].can_dlc = 8;

	memcpy(send_frame_[0].data, sendData_u_Control2, 8);

	int ret = write(dev_handler_, &send_frame_[0], sizeof(send_frame_[0]));
    if (ret <= 0) 
	{
      ROS_ERROR("send message failed, error code: %d",ret);
    }	

	//cmd_mutex_.unlock();
}

void cl_control::cmd_vel_Callback(const geometry_msgs::Twist msg)
{
	//cmd_mutex_.lock();
	//float angular = 0;
	//float vel =0;
	//float Rpm_total = 0;
	vel = msg.linear.x;
	//bool flag = msg.linear.y;
	if(vel<0)
	{
		vel=0;
	}
	//float omega = msg.angular.z;

	angular = msg.angular.z;
	//std::cout<<msg.angular.z<<std::endl;
	//std::cout<<angular<<std::endl;	

	cl_msgs::control3 control3_msg;
	control3_msg.Target_Mode = 1;
	control3_msg.Target_Steer_F_En=1;
	//control3_msg.EPB_Switch = msg.angular.y;
	
	if(vel == 0)
	{
		control3_msg.Target_Steer_F=0;
		control3_msg.Target_Brk_Press = 0;
		//control3_msg.EPB_Switch = msg.angular.y;
	}
	if(angular>25.4)
	{
		control3_msg.Target_Steer_F = 0;
	}
	if(angular<-27)
	{
		control3_msg.Target_Steer_F = 900;
	}
	if(angular>=-27 && angular<=25.4)
	{
		control3_msg.Target_Steer_F = WheelAngleTosteering(angular)+450;
	}

	
	//float angular = atan(2*omega/vel)*180/3.1415926; //2为轴距
	/*
	if(angular>26)
	{
		control3_msg.Target_Steer_F = 0;
		break;
	}
	else if (angular<-24.4)
	{
		control3_msg.Target_Steer_F = 900;
		break;
	}
	else
	{
		//程序运行时，车辆的转向角度是相对于车辆的前进方向的，所以需要加上450
		control3_msg.Target_Steer_F = WheelAngleTosteering(angular)+450;
		break;
		
	}/*
	switch (angular)
	{
	case angular>26:
		control3_msg.Target_Steer_F = 0;
		break;
	case angular<-24.4:
		control3_msg.Target_Steer_F = 900;
		break;
	
	default:
		control3_msg.Target_Steer_F = WheelAngleTosteering(angular)+450;
		break;
	}*/
	std::cout<<control3_msg.Target_Steer_F<<std::endl;

	//control3_msg.Target_Steer_F = WheelAngleTosteering(omega);  //pure pursuit

	Rpm_total = 60*vel/(2*3.1415926*0.1905); //0.1905为轮胎半径
	//std::cout<<Rpm_total<<std::endl;
	if(0 <= Rpm_total && Rpm_total <=100)
	{
		/*
		control3_msg.LR_Motor_En = 1;
		control3_msg.RR_Motor_En = 1;

		control3_msg.LR_Motor_Gear = 1;
		control3_msg.RR_Motor_Gear = 1;

		control3_msg.RF_Rpm = Rpm_total/2;
		control3_msg.RR_Rpm = Rpm_total/2;*/


		control3_msg.LF_Motor_En = 1;
		control3_msg.RF_Motor_En = 1;
		control3_msg.LR_Motor_En = 1;
		control3_msg.RR_Motor_En = 1;

		control3_msg.RF_Motor_Gear = 1;
		control3_msg.RR_Motor_Gear = 1;
		control3_msg.LF_Motor_Gear = 1;
		control3_msg.LR_Motor_Gear = 1;


		control3_msg.RF_Rpm = Rpm_total;
		control3_msg.RR_Rpm = Rpm_total;
		control3_msg.LF_Rpm = Rpm_total;
		control3_msg.LR_Rpm = Rpm_total;
	}
	
	else{
		control3_msg.LF_Motor_En = 1;
		control3_msg.RF_Motor_En = 1;
		control3_msg.LR_Motor_En = 1;
		control3_msg.RR_Motor_En = 1;

		control3_msg.RF_Motor_Gear = 1;
		control3_msg.RR_Motor_Gear = 1;
		control3_msg.LF_Motor_Gear = 1;
		control3_msg.LR_Motor_Gear = 1;


		control3_msg.RF_Rpm = 100;
		control3_msg.RR_Rpm = 100;
		control3_msg.LF_Rpm = 100;
		control3_msg.LR_Rpm = 100;
	}

	/*if (flag)
	{
	geometry_msgs::PoseStamped msg;
		for(int i=0;i<2;i++)
		{
			last_x = msg.pose.position.x;	
			while(1)
			{
				sleep(10);
				control3_msg.Target_Brk_Press = 0;
				control3_msg.EPB_Switch = 1;
				
				control3_msg.LR_Motor_En = 1;
				control3_msg.RR_Motor_En = 1;

				control3_msg.LR_Motor_Gear = 1;
				control3_msg.RR_Motor_Gear = 1;

				Rpm_total = 40;

				control3_msg.RF_Rpm = Rpm_total/2;
				control3_msg.RR_Rpm = Rpm_total/2;

				IPC_Control_pub_.publish(control3_msg);
				current_x = msg.pose.position.x;

				if (current_x - last_x > 1.5)
				{
					control3_msg.Target_Brk_Press = 2;
					control3_msg.EPB_Switch = 2;
					break;
				}
				
			}
			flag = 0;
		}
	}
	else
	{
		control3_msg.Target_Brk_Press = 2;
		control3_msg.EPB_Switch = 2;
	}*/
	
		
	
	//std::cout<<control3_msg.LR_Motor_En<<std::endl;
	//std::cout<<control3_msg.LR_Motor_Gear<<std::endl;
	//std::cout<<control3_msg.LR_Rpm<<std::endl;

	IPC_Control_pub_.publish(control3_msg);

	//cmd_mutex_.unlock();
}
void cl_control::recvData()
{
	while(ros::ok())
	{
		if(read(dev_handler_, &recv_frame_[0], sizeof(recv_frame_[0])) >=0)
		{
			for(int j=0;j<1;j++)
			{
				switch (recv_frame_[0].can_id)
				{
					//VCU_info1
					case 0xB1:
					{
						cl_msgs::VCU_info_1 msg;
						msg.Angle_F = (float)(short)((recv_frame_[0].data[0]  &0xff) | (recv_frame_[0].data[1] & 0x0f)<<8)/10-35; //8 4
						msg.Angle_R = (float)(short)((recv_frame_[0].data[1] & 0xf0 )>>4 | (recv_frame_[0].data[2] & 0xff)<<4)/10-35; // 4 8
						msg.LF_Rpm =  (unsigned short)((recv_frame_[0].data[3] & 0xff) | (recv_frame_[0].data[4] & 0x03)<<8); // 8 2
						msg.RF_Rpm =  (unsigned short)((recv_frame_[0].data[4] & 0xfc)>>2 | (recv_frame_[0].data[5] & 0x0f)<<6); // 6 4
						msg.LR_Rpm =  (unsigned short)((recv_frame_[0].data[5] & 0xf0)>>4 | (recv_frame_[0].data[6] & 0x3f)<<4); // 4 6
						msg.RR_Rpm =  (unsigned short)((recv_frame_[0].data[6] & 0xc0)>>6 | (recv_frame_[0].data[7] & 0xff)<<2); // 2 8

						IPC_VCU_info1_pub_.publish(msg);
						break;
						/*
						unsigned char crc = recv_frames_[0].data[0] ^ recv_frames_[0].data[1] ^ recv_frames_[0].data[2] ^ recv_frames_[0].data[3] ^ recv_frames_[0].data[4] ^ recv_frames_[0].data[5] ^ recv_frames_[0].data[6];

						if(crc == recv_frames_[0].data[7])
						{
								
							ctrl_fb_pub_.publish(msg);
						}

						break;*/

					}

					case 0xB2:
					{
						cl_msgs::VCU_info_2 msg;
						msg.GearPosition_LF = (recv_frame_[0].data[0] & 0x03); // 2
						msg.GearPosition_RF = (recv_frame_[0].data[0] & 0x0c)>>2; // 4
						msg.GearPosition_LR = (recv_frame_[0].data[0] & 0x30)>>4; // 6
						msg.GearPosition_RR = (recv_frame_[0].data[0] & 0xc0)>>6; // 8
						msg.VCU_Life_Signal = (recv_frame_[0].data[1] & 0x0f); // 4
						msg.VCU_Mode = (recv_frame_[0].data[1] & 0x30)>>4; // 6
						msg.EPB_Status = (recv_frame_[0].data[1] & 0xc0)>>6; // 8
						msg.IPC_Status = (recv_frame_[0].data[2] & 0x01); // 1
						msg.Hardware_Error_Level = (recv_frame_[0].data[2] & 0x06)>>1; // 3
						msg.RemoteController_Status = (recv_frame_[0].data[2] & 0x08)>>3; // 4
						msg.SES_F_En_Status = (recv_frame_[0].data[2] & 0x10)>>4; // 5
						msg.SES_R_En_Status = (recv_frame_[0].data[2] & 0x20)>>5; // 6
						msg.DBS_Status = (recv_frame_[0].data[2] & 0xc0)>>6; // 8
						msg.Pressure = (recv_frame_[0].data[3] & 0xff)/10; // 8
						msg.SES_F_Error_Level = (recv_frame_[0].data[4] & 0x03); // 2
						msg.SES_R_Error_Level = (recv_frame_[0].data[4] & 0x0c)>>2; // 4
						msg.BMS_Error = (recv_frame_[0].data[4] & 0x30)>>4; // 6
						msg.DCDC_Error = (recv_frame_[0].data[4] & 0xc0)>>6; //8
						msg.EPB_Error = (recv_frame_[0].data[5] & 0x01);  //1
						msg.DBS_ErrorCode = (recv_frame_[0].data[5] & 0x3e)>>1;//6


						IPC_VCU_info2_pub_.publish(msg);
						break;


					}
					case 0xB3:
					{
						cl_msgs::VCU_info_3 msg;
						msg.Battery_Voltage = (float)(short)((recv_frame_[0].data[0] & 0xff) | (recv_frame_[0].data[1] & 0xff)<<8)/10;
						msg.SOC = (float)(short)(recv_frame_[0].data[2] & 0xff)/2.5;
						msg.Battery_Current = (float)(short)(recv_frame_[0].data[3] & 0xff | (recv_frame_[0].data[4] & 0xff)<<8)/10;
						msg.DCDC_Output_Voltage = (float)(short)(recv_frame_[0].data[5] & 0xff | (recv_frame_[0].data[6]& 0x0f)<<8)/10;
						msg.DCDC_Output_Current = (float)(short)(recv_frame_[0].data[6] & 0xf0 | (recv_frame_[0].data[7]& 0xff)<<8);

						IPC_VCU_info3_pub_.publish(msg);
						break;
					}
					default:
						break;
				}
			}
		}
	}
}

void cl_control::sendData()
{
	ros::Rate loop(100);


	while(ros::ok())
	{

		loop.sleep();
	}

}
void cl_control::run()
{

    IPC_Control1_sub_ = nh.subscribe<cl_msgs::control3 >("base_control",5, &cl_control::IPC_Control1_Callback, this);
    IPC_Control2_sub_ = nh.subscribe<cl_msgs::control3>("base_control",5, &cl_control::IPC_Control2_Callback, this);
	cmd_vel_sub_ = nh.subscribe<geometry_msgs::Twist>("/cmd_vel",5, &cl_control::cmd_vel_Callback, this);

    IPC_VCU_info1_pub_ = nh.advertise<cl_msgs::VCU_info_1>("VCU_info1",5);
    IPC_VCU_info2_pub_ = nh.advertise<cl_msgs::VCU_info_2>("VCU_info2",5);
    IPC_VCU_info3_pub_ = nh.advertise<cl_msgs::VCU_info_3>("VCU_info3",5);
	IPC_Control_pub_ = nh.advertise<cl_msgs::control3>("base_control",5);
	//IPC_Control2_pub_ = nh.advertise<cl_msgs::control2>("control_angle2",5);
	//打开设备
	dev_handler_ = socket(PF_CAN, SOCK_RAW, CAN_RAW);
	if (dev_handler_ < 0) 
	{
		ROS_ERROR(">>open can deivce error!");
		return;
	}
    else
	{
		ROS_INFO(">>open can deivce success!");
	}


	struct ifreq ifr;
	
	std::string can_name("can0");

	strcpy(ifr.ifr_name,can_name.c_str());

	ioctl(dev_handler_,SIOCGIFINDEX, &ifr);


    // bind socket to network interface
	struct sockaddr_can addr;
	memset(&addr, 0, sizeof(addr));
	addr.can_family = AF_CAN;
	addr.can_ifindex = ifr.ifr_ifindex;
	int ret = ::bind(dev_handler_, reinterpret_cast<struct sockaddr *>(&addr),sizeof(addr));
	if (ret < 0) 
	{
		ROS_ERROR(">>bind dev_handler error!\r\n");
		return;
	}

	//创建接收发送数据线程
	boost::thread recvdata_thread(boost::bind(&cl_control::recvData, this));
	//boost::thread senddata_thread(boost::bind(&cl_control::sendData, this));

	ros::spin();
	
	close(dev_handler_);
}

}

int main(int argc, char ** argv)
{
	ros::init(argc, argv, "cl_control_node");

	cl_tool::cl_control cl_control;
	cl_control.run();

	return 0;
}
