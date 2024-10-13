#include <ros/ros.h>
#include<iostream>
#include <string>
#include<vector>
#include<stack>
#include<serial/serial.h>
#include<std_msgs/String.h>
#include<fstream>
#include<math.h>
#define pi 3.1415926
using namespace std;
struct position_data
{
        double real_x;
        double real_y;
        double rotation_angle;
};
int  main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    std::string descr=getenv("CAR_TYPE");
    ros::init(argc, argv, "wayFile_parse");
    ros::NodeHandle n("~");
    string  path1,path2;
    n.getParam("path1", path1);
    n.getParam("path2", path2);
    fstream ifs;
    string tmp_string;
    fstream ofs1,ofs2;
    ofs1.precision(8);
    ifs.precision(8);
    ifs.open(path1,ios::in);
    ofs1.open(path2,ios::out | ios::trunc);
    if(ifs.is_open())
    { 
        stack<position_data> posit;
        while(getline(ifs,tmp_string))
        {
                vector<string> v;
                string::size_type pos1, pos2;
                pos2 = tmp_string.find(",");
                pos1 = 0;
                while ( string::npos !=pos2 )
                {
                        v.push_back(tmp_string.substr( pos1, pos2-pos1 ) );
                        pos1 = pos2 + 1;
                        pos2 = tmp_string.find(",",pos1);
                }
                if ( pos1 != tmp_string.length() )
                {
                        v.push_back( tmp_string.substr( pos1 ));
                }
                position_data Position;
                Position.real_x=atof(v.at(0).c_str());
                Position.real_y=atof(v.at(1).c_str());
                Position.rotation_angle=atof(v.at(2).c_str())+pi;
                posit.push(Position);
        }
        if(ofs1.is_open())
        {
                int i=0;
                int size=posit.size();
                while(i<size)
                {
                        position_data pop_pos;
                        pop_pos=posit.top();
                        if(pop_pos.rotation_angle>pi)
                        {
                                pop_pos.rotation_angle=pop_pos.rotation_angle-2*pi;
                        }
                        if(pop_pos.rotation_angle<-pi)
                        {
                                pop_pos.rotation_angle=pop_pos.rotation_angle+2*pi;
                        }
                        ofs1<<pop_pos.real_x<<","<<pop_pos.real_y<<","<<pop_pos.rotation_angle<<endl;
                        i++;
                        posit.pop();
                }
        }
    }
    else
    {
       ROS_INFO("can not open file!!!");
    }
    ifs.close();
    ofs1.close();
    return 0;
}