#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# @Time    :2021
# @Author  : GL
# @Software:发布车辆的中心位置、后轮位置和速度
import os
import numpy as np
from math import cos, sin

from geometry_msgs.msg import PoseStamped, TwistStamped
from gazebo_msgs.msg import ModelStates, LinkStates
from styx_msgs.msg  import CarState
base_type=os.getenv("CAR_TYPE")#获取车辆类型
import tf
import tf_conversions
import rospy
Init_yaw= 3.6425829
class vehicle_pose_and_velocity_updater:
	def __init__(self):
		rospy.init_node('vehicle_pose_and_velocity_updater', log_level=rospy.DEBUG)#节点名称
		self.rear_pose_pub = rospy.Publisher(base_type+'/robot/rear_pose', PoseStamped, queue_size = 1)#发布车辆后轮位置
		self.center_pose_pub = rospy.Publisher(base_type+'/robot/center_pose', PoseStamped, queue_size = 1)#车辆中心点位置
		self.vel_pub = rospy.Publisher(base_type+'/robot/velocity', TwistStamped , queue_size = 1)#发布车辆速度
		self.point_pub = rospy.Publisher(base_type+'/rear_point', PoseStamped, queue_size = 1)#rviz中发布后轮位置')
		rospy.Subscriber(base_type+'/robot/car_states', CarState, self.model_cb, queue_size = 1)#订阅车辆的位姿信息
		rospy.spin()

	def model_cb(self,data):
		#try:
		#	vehicle_model_index = data.name.index("smart")
		#except:
		#	return
		vehicle_position = data.pose#车辆的位置
		vehicle_velocity = data.twist#车辆的速度
		orientation = vehicle_position.orientation#车辆的四元数
		(_, _, yaw) = tf.transformations.euler_from_quaternion([orientation.x,orientation.y,orientation.z,orientation.w])#四元数转欧拉角
                yaw=yaw           #yaw = yaw + rotation_angle这个输出航向角是在旋转变化前的
		time_stamp = rospy.Time.now()

		# vehicle center position
		center_pose = PoseStamped()
		center_pose.header.frame_id ='/world'
		center_pose.header.stamp = time_stamp
		center_pose.pose.position = vehicle_position.position#车辆位置
		center_pose.pose.orientation =orientation#车辆四元数
		self.center_pose_pub.publish(center_pose)

		# vehicle rear axle position
		rear_pose = PoseStamped()
		rear_pose.header.frame_id = '/world'
		rear_pose.header.stamp = time_stamp
		rear_x = vehicle_position.position.x #中心点x
		rear_y = vehicle_position.position.y# 中心点y
		center_x=rear_x-cos(yaw)*1.0#1.0为车辆中心位置到后轮中心位置的长度，#人形靶标需要修改此值
		center_y=rear_y-sin(yaw)*1.0
		rear_pose.pose.position.x = center_x
		rear_pose.pose.position.y = center_y
		rear_pose.pose.orientation = vehicle_position.orientation
		self.rear_pose_pub.publish(rear_pose)#发布车辆后轮位姿
		# vehicle rear point
		self.point_pub.publish(rear_pose)#rviz中发布后轮位置

		# vehicle velocity
		velocity = TwistStamped()
		velocity.header.frame_id = ''
		velocity.header.stamp = time_stamp
		velocity.twist.linear = vehicle_velocity.linear
		velocity.twist.angular = vehicle_velocity.angular
		self.vel_pub.publish(velocity)#发布车辆速度



if __name__ == "__main__":
	try:
		vehicle_pose_and_velocity_updater()
	except:
		rospy.logwarn("cannot start vehicle pose and velocity updater updater")
