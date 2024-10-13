#include <ros/ros.h>
#include <serial/serial.h>
#include "tf/transform_datatypes.h"
#include <tf/transform_broadcaster.h>
#include <math.h>
#include <string>
#include <stdio.h>
#include<std_msgs/String.h>
#include<iostream>
#include<nav_msgs/Odometry.h>
#include<geometry_msgs/Quaternion.h>
#include<geometry_msgs/Twist.h>
#include<geometry_msgs/Pose.h>
#include<stdlib.h>
#include<math.h>
#include<geometry_msgs/Twist.h>
#include<std_msgs/Bool.h>
#define pi 3.1415926 
using namespace std;
serial::Serial sp; 
struct senddata{
    unsigned char s[18]={0};
};
int left_l[4],right_r[4];
const unsigned char header[9] = {0x21,0x4D,0x20,0x0D,0x0A,0x2B,0x2D,0x3F,0x43}; //! M kongge  \n \r  +  - ? C
const unsigned char number[10] = {0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39}; //0-9
const double ROBOT_RADIUS =0.3;//两轮之间的半径距离/mm
const double ROBOT_LENGTH =0.78;//车身长度/mm
//通信协议!M(空格)+XXX(空格)-XXX \n \r ？C \r 
bool flag=0;//急停标志位
void emerge_brakeCallback(const std_msgs::Bool &flage)//急停信息订阅
{
    flag=flage.data;
}
void cmd_velCallback(const geometry_msgs::Twist &twist_aux)
{
    struct senddata vel;
    int leftVelSet,rightVelSet;
    vel.s[18]={0};
    vel.s[0]=header[0];
    vel.s[1]=header[1];
    vel.s[2]=header[2];
    vel.s[7]=header[2];
    vel.s[12]=header[3]; 
    vel.s[13]=header[4]; 
    vel.s[14]=header[7];
    vel.s[15]=header[8];
    vel.s[16]=header[3];
    vel.s[17]=header[4];
    double r = (twist_aux.linear.x/ twist_aux.angular.z);//mm
    if(twist_aux.linear.x==0)      //旋转
    {
        leftVelSet=(int)abs((twist_aux.angular.z* ROBOT_RADIUS)*200);//mm/s
        rightVelSet=(int)abs((twist_aux.angular.z* ROBOT_RADIUS)*200);//mm/s
        if(twist_aux.angular.z>0)
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            vel.s[3]= header[5];
            vel.s[8]= header[5];
        }
        else
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            vel.s[3]= header[6];
            vel.s[8]= header[6]; 
        }
    } 
    else if(twist_aux.angular.z==0)//直线
    {
        leftVelSet=(int)abs(twist_aux.linear.x*200);//mm/s
        rightVelSet=(int)abs(twist_aux.linear.x*200);
        if(twist_aux.linear.x>0)
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            vel.s[3]= header[6];
            vel.s[8]= header[5];
        }
        else
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            vel.s[3]= header[5];
            vel.s[8]= header[6]; 
        }
    }
    else //速度不一致
    {
        leftVelSet=(int)abs((twist_aux.linear.x-twist_aux.angular.z*ROBOT_RADIUS)*200);//mm/s
        rightVelSet =(int)abs((twist_aux.linear.x+twist_aux.angular.z*ROBOT_RADIUS)*200);
        if(twist_aux.linear.x>0)
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            if(twist_aux.angular.z * (r - ROBOT_RADIUS)>0)
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)>0)
                {
                    vel.s[3]= header[6];
                    vel.s[8]= header[5];
                    //左右转两轮均向前运动
                }
                else
                {
                    vel.s[3]=header[6];
                    vel.s[8]=header[6];
                    //左转左轮倒转右轮正转
                }
            }
            else
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)>0)
                {
                    vel.s[3]= header[5];
                    vel.s[8]= header[5]; 
                    //右转右轮倒转左轮正转
                }

            }
        }
        else
        {
            vel.s[4]=number[leftVelSet/100];
            vel.s[5]=number[leftVelSet%100/10];
            vel.s[6]=number[leftVelSet%100%10];
            vel.s[9]=number[(rightVelSet)/100];
            vel.s[10]=number[(rightVelSet)%100/10];
            vel.s[11]=number[(rightVelSet)%100%10];
            if(twist_aux.angular.z * (r - ROBOT_RADIUS)<0)
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)<0)
                {
                        vel.s[3]= header[5];
                        vel.s[8]= header[6];
                        //左右倒两轮均倒转
                }
                else
                {
                    vel.s[3]= header[5];
                    vel.s[8]= header[5];
                    //右倒车左轮倒转，右轮正转
                }


            }
            else
            {
                if(twist_aux.angular.z * (r +ROBOT_RADIUS)<0)
                {
                    vel.s[3]= header[6];
                    vel.s[8]= header[6]; 
                    //左倒左轮正转，右轮倒转
                }
            }
        }
    }
    ROS_INFO("%s",vel.s);
    for(int i=0;i<4;i++)
    {
        left_l[i]=vel.s[3+i];
        right_r[i]=vel.s[i+8];
    }
    if(flag==0)
    {
        sp.write(vel.s,sizeof(vel.s));
    }
    else
    {
        ROS_INFO("%s","车辆处于静止状态");
    }
}
int main(int argc, char*argv[])
{
    setlocale(LC_ALL, "");
    //std::string descr=getenv("CAR_TYPE");
    ros::init(argc, argv, "base_controller");
    ros::NodeHandle n;
     ros::Subscriber emergency_sub = n.subscribe("/emergency_brake/", 10, emerge_brakeCallback);//订阅急停信息
    ros::Subscriber  cmd_vel_sub = n.subscribe("/cmd_vel", 1, cmd_velCallback);
    ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("/odom", 50);
    nav_msgs::Odometry odom;
    geometry_msgs::TransformStamped odom_trans;
    tf::TransformBroadcaster br;
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
    ros::Rate loop_rate(10);
    string rece_data;
    string gstart="=";
    string gcolon=":";
    int start,med,length;
    long int base_leftd,base_rightd;
    const  float wheel_radius=0.3*pi;
    const float car_width=0.6;
    const  int coeffi=18432;
    string base_left,base_right;
    float left_odom,right_odom,inc_med=0,inc_left,inc_right;
    float last_left=0,last_right=0;
    float dx=0.0,dy=0.0,x_odom=0.0,y_odom=0.0;
    float last_xodom=0,last_yodom=0;
    geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(0.0);
    geometry_msgs::Quaternion last_odomquat = tf::createQuaternionMsgFromYaw(0.0);
    double delta_x=0.0,delta_y=0.0,delta_th=0.0;
    double dt=0.0,angle=0.0,dvx=0.0,dva=0.0,angle_total=0.0;
    ros::Time last_time,current_time;
    last_time = ros::Time::now();
    current_time=ros::Time::now();
    const unsigned char zero_odom[4]={0x3F,0x43,0x0D,0X0A};
    while(ros::ok())
    {
        ros::spinOnce();
        sp.write(zero_odom,sizeof(zero_odom));
        size_t n=sp.available();
        if(n!=0)
        {
            //ROS_INFO_STREAM("Reading from serial port\n");
            rece_data=sp.read(sp.available());
            //ROS_INFO("%s",rece_data.c_str());
            start=rece_data.find(gstart);
            med=rece_data.find(gcolon);
            //找到字符=：
            length=rece_data.length();
            base_left=rece_data.substr(start+1,med-start-1);
            base_right=rece_data.substr(med+1,length-med-1);
            //字符截取
            base_leftd=atol(base_left.c_str());
            base_rightd=atol(base_right.c_str());
            //字符串转换为长整型
            //ROS_INFO("base_left=%ld",base_leftd);
            //ROS_INFO("base_right=%ld",base_rightd);
            left_odom=-(base_leftd/coeffi)*wheel_radius;
            right_odom=(base_rightd/coeffi)*wheel_radius;
            //ROS_INFO("left_odom=%f",left_odom);
            //ROS_INFO("right_odom=%f",right_odom);
            current_time=ros::Time::now();
            dt=(current_time-last_time).toSec();
            inc_left=left_odom-last_left;
            inc_right=right_odom-last_right;
            if(left_l[4]=right_r[4])
            {
                if((inc_left==0&&inc_right==0)||(inc_left!=0&&inc_right!=0))
                {
                    inc_med=(inc_left+inc_right)/2.0;
                    angle=atan((inc_right-inc_left)/car_width);
                    angle_total+=angle;
                    dvx=inc_med/dt;
                    dva=angle/dt;
                    dx=inc_med*cos(angle_total);
                    dy=sin(angle_total)*inc_med;
                    //y_odom+=(dx*cos(angle)-dy*sin(angle));
                    //x_odom+=(dx*sin(angle)+cos(angle)*dy);
                    y_odom+=dy;
                    x_odom+=dx;  
                    // ROS_INFO("y_odom=%f",y_odom);
                    //ROS_INFO("x_odom=%f",x_odom);
                    //ROS_INFO("angle_total=%f",angle_total);
                    geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(angle_total);
                    odom.header.stamp=current_time;
                    odom.header.frame_id="odom";
                    odom.child_frame_id="base_link";
                    odom_trans.header.stamp=current_time;
                    odom_trans.header.frame_id="odom";
                    odom_trans.child_frame_id="base_link";
                    odom.pose.pose.position.x=x_odom;
                    odom.pose.pose.position.y=y_odom;
                    odom.pose.pose.position.z=0.0;
                    odom.pose.pose.orientation=odom_quat;
                    odom.twist.twist.linear.x=dvx;
                    odom.twist.twist.angular.z=dva;
                    odom_trans.transform.translation.x=x_odom;
                    odom_trans.transform.translation.y=y_odom;
                    odom_trans.transform.translation.z=0.0;
                    odom_trans.transform.rotation=odom_quat;
                    //br.sendTransform(odom_trans);
                    //odom_pub.publish(odom);
                    last_left=left_odom;
                    last_right=right_odom;
                    last_time=current_time;
                    last_xodom=x_odom;
                    last_yodom=y_odom;
                    last_odomquat=odom_quat;
                }
                else
                {
                    odom.header.stamp=current_time;
                    odom.header.frame_id="odom";
                    odom.child_frame_id="base_link";
                    odom_trans.header.stamp=current_time;
                    odom_trans.header.frame_id="odom";
                    odom_trans.child_frame_id="base_link";
                    odom.pose.pose.position.x=last_xodom;
                    odom.pose.pose.position.y=last_yodom;
                    odom.pose.pose.position.z=0.0;
                    odom.pose.pose.orientation=last_odomquat;
                    odom.twist.twist.linear.x=dvx;
                    odom.twist.twist.angular.z=dva;
                    odom_trans.transform.translation.x=last_xodom;
                    odom_trans.transform.translation.y=last_yodom;
                    odom_trans.transform.translation.z=0.0;
                    odom_trans.transform.rotation=last_odomquat;
                    //br.sendTransform(odom_trans);
                    //odom_pub.publish(odom);
                }
            }
            else
            {
                inc_med=(inc_left+inc_right)/2.0;
                angle=atan((inc_right-inc_left)/car_width);
                angle_total+=angle;
                dvx=inc_med/dt;
                dva=angle/dt;
                dx=inc_med*cos(angle_total);
                dy=sin(angle_total)*inc_med;
                //y_odom+=(dx*cos(angle)-dy*sin(angle));
                //x_odom+=(dx*sin(angle)+cos(angle)*dy);
                y_odom+=dy;
                x_odom+=dx;  
                // ROS_INFO("y_odom=%f",y_odom);
                //ROS_INFO("x_odom=%f",x_odom);
                //ROS_INFO("angle_total=%f",angle_total);
                geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(angle_total);
                odom.header.stamp=current_time;
                odom.header.frame_id="odom";
                odom.child_frame_id="base_link";
                odom_trans.header.stamp=current_time;
                odom_trans.header.frame_id="odom";
                odom_trans.child_frame_id="base_link";
                odom.pose.pose.position.x=x_odom;
                odom.pose.pose.position.y=y_odom;
                odom.pose.pose.position.z=0.0;
                odom.pose.pose.orientation=odom_quat;
                odom.twist.twist.linear.x=dvx;
                odom.twist.twist.angular.z=dva;
                odom_trans.transform.translation.x=x_odom;
                odom_trans.transform.translation.y=y_odom;
                odom_trans.transform.translation.z=0.0;
                odom_trans.transform.rotation=odom_quat;
                //br.sendTransform(odom_trans);
                //odom_pub.publish(odom);
                last_left=left_odom;
                last_right=right_odom;
                last_time=current_time;
                last_xodom=x_odom;
                last_yodom=y_odom;
                last_odomquat=odom_quat;

            }

        }
        loop_rate.sleep();
    }
    return 0;
}
