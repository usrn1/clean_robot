#!/usr/bin/env python  
# -*- coding: UTF-8 -*-
# @Time    :2021
# @Author  : GL
# @Software:发布车辆的位置坐标
import rospy
import tf
import os
from geometry_msgs.msg import PoseStamped
from styx_msgs.msg  import CarState
base_type=os.getenv("CAR_TYPE")#获取车辆的类型
class transform_publisher():
	def __init__(self):
		rospy.init_node(base_type+'transform_publisher')#发布节点名称
		rospy.Subscriber(base_type+'/robot/base_states', CarState, self.pose_cb, queue_size = 1)#订阅车辆的坐标信息
		rospy.spin()
	def pose_cb(self, msg):
		pose_x= msg.pose.position.x#x
		pose_y= msg.pose.position.y#y
		pose_z= msg.pose.position.z#z
		orientation = msg.pose.orientation#四元数
		br = tf.TransformBroadcaster()#发布车辆坐标
                br.sendTransform((pose_x,pose_y,pose_z),(orientation.x,orientation.y,orientation.z,orientation.w),rospy.Time.now(),base_type+'/base_link','world')

if __name__ == "__main__":
	try:
		transform_publisher()
	except:
		rospy.logwarn("cannot start transform publisher")
