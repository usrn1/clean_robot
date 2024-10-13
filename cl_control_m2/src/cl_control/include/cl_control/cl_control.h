#ifndef __PIDCONTROL_NODE_H__
#define __PIDCONTROL_NODE_H__

#include "ros/ros.h"
#include "std_msgs/Int32.h"
#include "geometry_msgs/Twist.h"
#include "tf/transform_broadcaster.h"
#include "nav_msgs/Odometry.h"
#include "sensor_msgs/Imu.h"
#include "geometry_msgs/Twist.h"
#include"cl_msgs/control1.h"
#include"cl_msgs/control2.h"
#include"cl_msgs/control3.h"
#include"cl_msgs/VCU_info_1.h"
#include"cl_msgs/VCU_info_2.h"
#include"cl_msgs/VCU_info_3.h"


#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/types.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


#include <string>

#include <linux/can.h>
#include <linux/can/raw.h>

namespace cl_tool{
    class cl_control
    {
    public:
        cl_control();
        ~cl_control();

        void run();
    private:
        ros::NodeHandle nh;
        ros::Subscriber IPC_Control1_sub_;
        ros::Subscriber IPC_Control2_sub_;
        ros::Subscriber cmd_vel_sub_;
    

        ros::Publisher IPC_VCU_info1_pub_;
        ros::Publisher IPC_VCU_info2_pub_;
        ros::Publisher IPC_VCU_info3_pub_;
        ros::Publisher IPC_Control_pub_;
        //ros::Publisher IPC_Control2_pub_;
        
        boost::mutex cmd_mutex_;

        unsigned char sendData_u_Control1[8] = {0};
        unsigned char sendData_u_Control2[8] = {0};

        int dev_handler_;
        can_frame send_frame_[2];
        can_frame recv_frame_[1];

        void IPC_Control1_Callback(const cl_msgs::control3 msg);
        void IPC_Control2_Callback(const cl_msgs::control3 msg);
        void cmd_vel_Callback(const geometry_msgs::Twist msg);

        void recvData();
        void sendData();
    };

    
}

#endif // __PIDCONTROL_NODE_H__