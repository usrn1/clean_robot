#include <ros/ros.h>
#include <serial/serial.h>
#include <math.h>
#include <string>
#include<std_msgs/String.h>
#include<iostream>
#include<geometry_msgs/Twist.h>
#define pi 3.1415926 
using namespace std;
serial::Serial sp; 
typedef union _Send_Data_   
{
	unsigned char buffer[8];
    struct  _TX_Data
    {
        int leftVelSet;
        int rightVelSet;
    }tx_Data;
}send_Data;
const double ROBOT_RADIUS = 300;//两轮之间的半径距离
const double ROBOT_LENGTH =780;//车身长度
void cmd_velCallback(const geometry_msgs::Twist &twist_aux)
{
    send_Data data;
    int lVelSet,rVelSet;
    double r = (twist_aux.linear.x/ twist_aux.angular.z)*100;//mm
    if(twist_aux.linear.x==0)      //旋转
    {
        lVelSet=(int)abs(twist_aux.angular.z* ROBOT_RADIUS);//mm/s
        rVelSet=(int)abs(twist_aux.angular.z* ROBOT_RADIUS);//mm/s
        if(twist_aux.angular.z>0)
        {
            data.tx_Data.leftVelSet=+lVelSet;
            data.tx_Data.rightVelSet =+rVelSet;
        }
        else
        {
            data.tx_Data.leftVelSet=-lVelSet;
            data.tx_Data.rightVelSet =-rVelSet;
        }
    } 
    else if(twist_aux.angular.z==0)//直线
    {
        lVelSet=(int)abs(twist_aux.linear.x*280);//mm/s
        rVelSet=(int)abs(twist_aux.linear.x*280);
        if(twist_aux.linear.x>0)
        {
            data.tx_Data.leftVelSet=-lVelSet;
            data.tx_Data.rightVelSet =+rVelSet;
        }
        else
        {
            data.tx_Data.leftVelSet=+lVelSet;
            data.tx_Data.rightVelSet =-rVelSet;
        }
    }
    else //速度不一致
    {
        lVelSet=(int)abs(twist_aux.angular.z * (r - ROBOT_RADIUS)*0.83);//mm/s
        rVelSet =(int)abs(twist_aux.angular.z * (r + ROBOT_RADIUS)*0.83);
        if(twist_aux.linear.x>0)
        {
            if(twist_aux.angular.z * (r - ROBOT_RADIUS)>0)
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)>0)
                {
                    data.tx_Data.leftVelSet=-lVelSet;
                    data.tx_Data.rightVelSet =+rVelSet;
                }
                else
                {
                    data.tx_Data.leftVelSet=-lVelSet;
                    data.tx_Data.rightVelSet =-rVelSet;
                }
            }
            else
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)>0)
                {
                    data.tx_Data.leftVelSet=+lVelSet;
                    data.tx_Data.rightVelSet =+rVelSet;
                }

            }
        }
        else
        {
            if(twist_aux.angular.z * (r - ROBOT_RADIUS)<0)
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)<0)
                {
                    data.tx_Data.leftVelSet=+lVelSet;
                    data.tx_Data.rightVelSet =-rVelSet;
                }
                else
                {
                    data.tx_Data.leftVelSet=+lVelSet;
                    data.tx_Data.rightVelSet =+rVelSet;
                }


            }
            else
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)<0)
                {
                    data.tx_Data.leftVelSet=-lVelSet;
                    data.tx_Data.rightVelSet =-rVelSet;
                }
            }
        }
    }
    ROS_INFO("左轮速度:%d, 右轮速度:%d",data.tx_Data.leftVelSet,data.tx_Data.leftVelSet);
    sp.write(data.buffer,sizeof(data.buffer));
}
int main(int argc, char*argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "base_controller");
    ros::NodeHandle n;
    ros::Subscriber  cmd_vel_sub = n.subscribe("/cmd_vel", 1, cmd_velCallback);
    try
    {
        sp.setPort("/dev/jichuang_base");
        sp.setBaudrate(115200); 
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);
        sp.setTimeout(to);
        sp.open();
    }
    catch(serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port.");
        return -1;
    }
    if(sp.isOpen())
    {
        ROS_INFO_STREAM("/dev/jichuang_base is opened.");
    }
    else
    {
        return -1;
    }
    ros::spin();
    return 0;
}