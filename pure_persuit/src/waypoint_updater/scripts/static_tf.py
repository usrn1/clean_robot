#! /usr/bin/env python
# -*- coding: UTF-8 -*-
# @Time    :2021
# @Author  : GL
# @Software:发布相对于maincar的位置，用于车辆编队
import rospy
import tf2_ros
import tf
import math
from geometry_msgs.msg import TransformStamped
if __name__ == "__main__":
    # 初始化 ROS 节点
    rospy.init_node("static_tf")
    #参数获取
    leader_robot_name=rospy.get_param('~leader_robot_name')#领航车辆的名称
    target_name=rospy.get_param('~target_name')#坐标名称
    L_triangle=rospy.get_param('L_triangle',5)#三角形编队距离
    L_front=rospy.get_param('L_front',2.8)#一字型编队前车距离
    L_rear=rospy.get_param('L_rear',5.5)#一字型编队后车距离
    theta=rospy.get_param('~theta',3.1415926)#编队角度
    if target_name=='axis5':
        L=L_front
    elif target_name=='axis6':
        L=L_rear
    else:
        L=L_triangle
    #创建 静态坐标广播器
    broadcaster = tf2_ros.StaticTransformBroadcaster()
    #创建并组织被广播的消息
    tfs = TransformStamped()
    # 头信息
    tfs.header.frame_id = leader_robot_name+'/base_link'
    tfs.header.stamp = rospy.Time.now()
    tfs.header.seq = 100
    # 子坐标系
    tfs.child_frame_id = target_name
    # 坐标系相对信息
    #偏移量
    tfs.transform.translation.x = L*math.cos(theta)
    tfs.transform.translation.y = L*math.sin(theta)
    tfs.transform.translation.z = 0
    # 四元数
    qtn = tf.transformations.quaternion_from_euler(0,0,0)
    tfs.transform.rotation.x = qtn[0]
    tfs.transform.rotation.y = qtn[1]
    tfs.transform.rotation.z = qtn[2]
    tfs.transform.rotation.w = qtn[3]
    # 5.广播器发送消息
    broadcaster.sendTransform(tfs)
    # spin
    rospy.spin()
