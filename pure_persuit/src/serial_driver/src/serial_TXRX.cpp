#include "ros/ros.h"
#include<iostream>
#include <string>
#include<vector>
#include<serial/serial.h>
#include<std_msgs/String.h>
#include<fstream>
#include<geometry_msgs/Twist.h>
#include<geometry_msgs/Pose.h>
#include<geometry_msgs/Quaternion.h>
#include<nav_msgs/Odometry.h>
#include"styx_msgs/CarState.h"
#include "ZtGeographyCoordinateTransform.h"
#include "tf/transform_datatypes.h"
#include"styx_msgs/Position.h"
#define WHEEL_BASE  1.0f
using namespace std;
serial::Serial ser_TX;
//float ref_x=584275.325612,ref_y=3790116.699350,rotation_angle=91.52753/57.3;
float ref_x=433229.361448,ref_y=4025377.921128,rotation_angle=91.52753/57.3;
#pragma pack(1)
typedef union _Send_Data_   
{
	unsigned char buffer[8];
    struct  _TX_Data
    {
        //unsigned char Header;
        float X_speed;
        float angle;
        //unsigned char End_flag;
    }tx_Data;
}send_Data;
#pragma pack(4)
//解析串口得到的数据
void stringParse(string s,vector<string> & v)
{
    //分割有效数据，存入vector中
    string::size_type pos1, pos2;
    pos2 = s.find(",");
    pos1 = 0;
    while ( string::npos !=pos2 )
    {
        v.push_back( s.substr( pos1, pos2-pos1 ) );
        pos1 = pos2 + 1;
        pos2 = s.find(",",pos1);
    }
    if ( pos1 != s.length() )
    {
        v.push_back( s.substr( pos1 ));
    }
}



int  main(int argc, char *argv[])
{
    ros::init(argc, argv, "serial_TXRX");
    std::string descr=getenv("CAR_TYPE");
    ros::NodeHandle n;
    string path;
    ros::param::get("~path", path);
    double x , y ,  z ;
    double x_pos,y_pos;
    ZtGeographyCoordinateTransform ztGCT;
    styx_msgs::CarState car_state;
    styx_msgs::CarState base_state;
    geometry_msgs::PointStamped this_point_stamped;
    nav_msgs::Odometry odom;
    styx_msgs::Position position;
    ros::Publisher position_pub=n.advertise<styx_msgs::Position>(descr+"/position",1);
    ros::Publisher carState_pub = n.advertise< styx_msgs::CarState>(descr+"/robot/car_states", 1);
    ros::Publisher baseState_pub = n.advertise< styx_msgs::CarState>(descr+"/robot/base_states", 1);
    ros::Publisher point_pub = n.advertise<geometry_msgs::PointStamped>(descr+"/current_point", 1, true);
    ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>(descr+"/odom", 50);
    setlocale(LC_ALL, ""); //解决输出中文问号的问题
    vector<string> v;
    ofstream ofs; 
    ofs.open(path,ios::out | ios::trunc);
    //创建串口对像
   serial::Serial ser_RX;
     //配置串口(串口号、波特率)
    try 
    { 
        //设置串口属性，并打开串口 
        ser_RX.setPort("/dev/beidou_base"); 
        ser_RX.setBaudrate(115200); 
        serial::Timeout to = serial::Timeout::simpleTimeout(1000); 
        ser_RX.setTimeout(to); 
        ser_RX.open(); 


    } 
    catch (serial::IOException & e) 
    { 
        ROS_ERROR_STREAM("Unable to open port "); 
        return -1; 
    } 
 
    //检测串口是否已经打开，并给出提示信息 
    if(ser_RX.isOpen()) 
    { 
        ROS_INFO_STREAM("Serial_RX Port initialized"); 
    } 
    else 
    {
        ROS_ERROR_STREAM("Unable to open port RX"); 
        return -1; 
    }

    ros::Rate loop_rate(20);
    string reve_string;
    string tmp_string;
    string gstart="$GP";
    string gend="*";
    int i=0,start=-1,end=-1;
    unsigned int count=0;
    double x_odom =0.0, y_odom =0.0, th_odom =0.0;
    double vx =0.0, vy =0.0, vth =0.0, dt=0.0;
    double delta_x=0.0,delta_y=0.0,delta_th=0.0;
    ros::Time last_time,current_time;
    last_time = ros::Time::now();
    while(ros::ok()){
          if(ser_RX.available()){
              //接受从串口得到的数据
              tmp_string= ser_RX.read(ser_RX.available());
              //ROS_INFO("DATA FROM rev：%s",tmp_string.c_str());
              //保存到文件中
              if(ofs.is_open()){
                  ofs<<tmp_string;
              }
              else{
                  ROS_INFO("open file for writing failed!!!");
              }
              //ROS_INFO("DATA FROM tmp：%s",tmp_string.c_str());
              reve_string+=tmp_string;
              //ROS_INFO("====================================");
              //ROS_INFO("DATA FROM rev：%s",reve_string.c_str());
              while(i<reve_string.length())
              {
                  //找起始标志
                  start=reve_string.find(gstart);
                  //如果没找到，丢弃这部分数据，但要留下最后2位，避免遗漏掉起始标志
                  if (start==-1)
                  {
                      if (reve_string.length()>2)
                      {
                          reve_string=reve_string.substr(reve_string.length()-3);
                      }
                      break;
                      
                  }
                  else
                  {
                      //如果找到起始标志，开始找终止标志
                      //寻找终止标志
                      end=reve_string.find(gend);
                      //如果没找到，把起始标志开始的数据留下，前面的数据丢弃，然后跳出循环
                      if (end==-1 || end<start)
                      {
                          if(end!=0)
                          {
                              reve_string=reve_string.substr(start);
                          }
                          break;
                      }
                      else
                      {
                          //如果找到了终止标志，把这段有效的数据剪切给解析的函数，剩下的继续开始寻找
                          i=end;
                          //把有效的数据给解析的函数
                          stringParse(reve_string.substr(start,end-start),v);
                          if(v.at(0)=="$GPCHC")
                          {
                              count++;
                              //24个数据
                              if(v.size()==24)
                              {
                                  position.latitude=atof(v.at(12).c_str());
                                  position.longitude=atof(v.at(13).c_str());
                                  position.yaw=atof(v.at(3).c_str());
                                  position_pub.publish(position);
                                  ROS_INFO("%f,%f,%f",position.latitude, position.longitude,position.yaw);
                                  //发布相关数据
                                  //经纬度转xyz
                                  ztGCT.BL2XY(atof(v.at(12).c_str()), atof(v.at(13).c_str()), x, y);
                                  car_state.pose.position.x=(x-ref_x)*cos(rotation_angle)+(y-ref_y)*sin(rotation_angle);
                                  car_state.pose.position.y=-1.0*(x-ref_x)*sin(rotation_angle)+(y-ref_y)*cos(rotation_angle);
                                  //car_state.pose.position.x=y;
                                  //car_state.pose.position.y=x;
                                  car_state.pose.position.z=0;//z
                                  //car_state.pose.position.z=0;
                                  //欧拉角转四元数,欧拉角是以弧度还是角度输入呢？？？
                                  car_state.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(atof(v.at(5).c_str())/57.3,atof(v.at(4).c_str())/57.3,atof(v.at(3).c_str())/57.3);//返回四元数
                                  //ROS_INFO("%f,%f,%f",x, y,3.1415926+atof(v.at(3).c_str())/57.3);
                                  car_state.twist.linear.x=atof(v.at(18).c_str());
                                  car_state.twist.linear.y=0.0;
                                  car_state.twist.linear.z=0.0;
                                  car_state.twist.angular.x=0.0;
                                  car_state.twist.angular.y=0.0;
                                  car_state.twist.angular.z=atof(v.at(8).c_str());
                                  carState_pub.publish(car_state);
                                  ztGCT.BL2XY(atof(v.at(12).c_str()), atof(v.at(13).c_str()), x_pos, y_pos);
                                  base_state.pose.position.x=x_pos;
                                  base_state.pose.position.y= y_pos;
                                  base_state.pose.position.z=0;//z


                                  //car_state.pose.position.z=0;
                                  //欧拉角转四元数,欧拉角是以弧度还是角度输入呢？？？编队
                                  base_state.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(3.1415926+atof(v.at(5).c_str())/57.3,atof(v.at(4).c_str())/57.3,atof(v.at(3).c_str())/57.3);//返回四元数
                                  ROS_INFO("%f,%f,%f",x, y,3.1415926+atof(v.at(3).c_str())/57.3);
                                  base_state.twist.linear.x=atof(v.at(18).c_str());
                                  base_state.twist.linear.y=0.0;
                                  base_state.twist.linear.z=0.0;
                                  base_state.twist.angular.x=0.0;
                                  base_state.twist.angular.y=0.0;
                                  base_state.twist.angular.z=atof(v.at(8).c_str());
                                  baseState_pub.publish(base_state);

                                  current_time=ros::Time::now();
                                  this_point_stamped.header.stamp = current_time;
                                  this_point_stamped.header.frame_id = "/world";
                                  this_point_stamped.point.x = (x-ref_x)*cos(rotation_angle)+(y-ref_y)*sin(rotation_angle);;
                                  this_point_stamped.point.y = -1.0*(x-ref_x)*sin(rotation_angle)+(y-ref_y)*cos(rotation_angle);
                                  this_point_stamped.point.z = 0.0;

                                  point_pub.publish(this_point_stamped);
                                
                                  vx=atof(v.at(18).c_str());
                                  vy=0.0;
                                  vth=atof(v.at(8).c_str());
                                  current_time=ros::Time::now();
                                  dt = (current_time - last_time).toSec();

                                //mark1
                                  delta_x = (vx * cos(th_odom) - vy * sin(th_odom)) * dt;
                                  delta_y = (vx * sin(th_odom) + vy * cos(th_odom)) * dt;
                                  delta_th = vth * dt;
                                  x_odom += delta_x;
                                  y_odom += delta_y;
                                  th_odom += delta_th;   

                                  geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(th_odom);
                                  current_time=ros::Time::now();
                                  odom.header.stamp = current_time;
                                  odom.header.frame_id = descr+"/odom";

                                  //set the position
                                  odom.pose.pose.position.x = x_odom;
                                  odom.pose.pose.position.y = y_odom;
                                  odom.pose.pose.position.z = 0.0;
                                  odom.pose.pose.orientation = odom_quat;

                                  //set the velocity
                                  odom.child_frame_id = descr+"/base_link";//this->robot_frame_id;
                                  odom.twist.twist.linear.x = vx ;//this->vx;线速度
                                  odom.twist.twist.linear.y = 0.0 ;//this->vy;
                                  odom.twist.twist.angular.z = vth;//this->vth;//角速度

                                  odom_pub.publish(odom);
                              }
                          }
                          /*else if(v.at(0)=="$GPNEU")
                          {
                              //5个数据
                              if(v.size()==5)
                              {
                                  //发布相关数据
                              }
                          }*/
                          //清空Vector
                          v.clear();
                          //如果剩下的字符大于等于4，则继续循环寻找有效数据,如果所剩字符小于等于3则跳出循环
                          if(i+8<reve_string.length())
                          {
                              reve_string=reve_string.substr(end+5);
                          }
                          else
                          {
                              reve_string.clear();
                              //ROS_INFO("DATA FROM rev：%s",reve_string.c_str());
                              break;
                          }
                      }
                  }
                  
              }
          }
          loop_rate.sleep();
          ros::spinOnce();
    }

    ofs.close();
    return 0;
}
