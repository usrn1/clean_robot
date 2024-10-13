#include "txrx_st15/txrx_st15.h"


#define PI 3.14159265359

serial::Serial ser;
using namespace std;
struct senddata
{
    unsigned char s[13] = {0};
};

struct recvdata
{
    unsigned char r[13] = {0};
};

//void robot_state_callback(){}
int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "txrx_st15");
    ros::NodeHandle nh;
    //ros::Subscriber robot_state_sub = nh.subscribe("robot_state", 5, robot_state_callback);
    

    try
    {
        ser.setPort("/dev/st15");
        ser.setBaudrate(115200);
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);
        ser.setTimeout(to);
        ser.open();
    }
    catch(serial::IOException &e)
    {
        ROS_ERROR("Unable to open st15 port");
        return -1;
    }
    if(ser.isOpen())
    {
        ROS_INFO("st15 port is open");
    }
    else
    {
        return -1;
    }
    return 0;

}
