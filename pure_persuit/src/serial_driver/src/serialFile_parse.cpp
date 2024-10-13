#include "ros/ros.h"
#include<iostream>
#include <string>
#include<vector>
#include<serial/serial.h>
#include<std_msgs/String.h>
#include<fstream>
#include<math.h>
#include "ZtGeographyCoordinateTransform.h"
using namespace std;
fstream ofs;
unsigned int chc_count=0;
float ref_x=433229.361448,ref_y=4025377.921128,ref_yaw=3.6425829,real_x=0.0,real_y=0.0,rotation_angle=91.52753/57.3;
//float ref_x=0.0,ref_y=0.0,ref_yaw=0.0;3.6425829
//解析串口得到的数据
void stringParse(string s )
{
     double x , y ,  z ;
     ZtGeographyCoordinateTransform ztGCT;
    //分割有效数据，存入vector中
    vector<string> v;
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
    //ROS_INFO("VECTOR SIZE:%d",v.size());
    if(v.size()==24)
    {
        if(ofs.is_open())
        {
            //开始存数据
            cout<<v.at(12)<<","<<v.at(13)<<","<<endl;
            ztGCT.BL2XY(atof(v.at(12).c_str()), atof(v.at(13).c_str()), x, y);
            
            /*if(chc_count==12)
            {
              ref_x=x;
              ref_y=y;
            }*/
            real_x=(x-ref_x)*cos(rotation_angle)+(y-ref_y)*sin(rotation_angle);
            real_y=-1.0*(x-ref_x)*sin(rotation_angle)+(y-ref_y)*cos(rotation_angle);
            //cout<<x<<","<<y<<","<<endl;
            //cout<<real_y<<","<<endl;
            ofs<<real_x<<","<<real_y<<","<<(ref_yaw - atof(v.at(3).c_str())/57.3)<<endl; //ref_yaw - atof(v.at(3).c_str())/57.3+1.597
            //ofs<<x<<","<<y<<","<<atof(v.at(3).c_str())<<endl;
            //cout<<x<<" "<<y<<" "<<atof(v.at(3).c_str())<<endl;            
        }
        else
        {
            ROS_INFO("open waypoints.csv failed!!！");
        }
    }
    else
    {
        ROS_INFO("Parse serial data error!!!",v.size());
    }
}

int  main(int argc, char *argv[])
{
    ros::init(argc, argv, "serialFile_parse");
    ros::NodeHandle n;
    string path1,path2;
    ros::param::get("~path1", path1);
    ros::param::get("~path2", path2);
    setlocale(LC_ALL, ""); //解决输出中文问号的问题
    fstream ifs;
    ifs.open(path1,ios::in);
    ofs.precision(8); 
    ofs.open(path2,ios::out | ios::trunc);
    string reve_string;
    string tmp_string;
    string gstart="CHC";
    string gend="*";
    int i=0,start=-1,end=-1;
    if(ifs.is_open()){ 
        //从文件中读取数据
        while(getline(ifs,tmp_string)){
            reve_string+=tmp_string;
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
                //ROS_INFO("I AM OUT ONE");
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
                    //ROS_INFO("I AM OUT TWO");
                    //break;
                }
                else
                {
                    //如果找到了终止标志，把这段有效的数据剪切给解析的函数，剩下的继续开始寻找
                    i=end;
                    //把有效的数据给解析的函数
                    chc_count++;
                    if(chc_count%8==0)
                    {
                      stringParse(reve_string.substr(start,end-start));
                    }
                    //打印
                    //printSerialData(serial_dataStruct);
                    //如果剩下的字符大于等于4，则继续循环寻找有效数据,如果所剩字符小于等于3则跳出循环
                    reve_string=reve_string.substr(end+1);
                    //ROS_INFO("DATA FROM %d：%s",i+1,reve_string.c_str());
                    if(reve_string.length()<3)
                    {
                        //ROS_INFO("I AM OUT THREE");
                        break;
                    }
                }
            }
            
        }
        }
    }
    else
    {
       ROS_INFO("can not open file!!!");
    }
    ifs.close();
    ofs.close();
    return 0;
}
