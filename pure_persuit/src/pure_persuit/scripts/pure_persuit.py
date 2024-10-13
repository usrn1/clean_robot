#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# @Time    :2021
# @Author  : GL
# @Software:车辆循迹程序
import os
import csv
import math

from geometry_msgs.msg import Quaternion, PoseStamped, TwistStamped, Twist

from styx_msgs.msg import Lane, Waypoint

from gazebo_msgs.msg import ModelStates

import tf
import rospy

HORIZON =7.0    #前视距离
Init_yaw= 3.6425829     #3.6425829
base_type=os.getenv("CAR_TYPE")#获取车辆名称
class PurePersuit:
	def __init__(self):
		rospy.init_node('pure_persuit', log_level=rospy.DEBUG)
		rospy.Subscriber(base_type+'/robot/rear_pose', PoseStamped, self.pose_cb, queue_size = 1)#获取车辆后轮位置
		rospy.Subscriber(base_type+'/robot/velocity', TwistStamped, self.vel_cb, queue_size = 1)#获取车辆速度
		rospy.Subscriber(base_type+'/final_waypoints', Lane, self.lane_cb, queue_size = 1)#获取车辆局部路径
		self.twist_pub = rospy.Publisher('/cmd_vel', Twist, queue_size = 1)#发布车辆速度
		self.currentPose = None
		self.currentVelocity = None
		self.currentWaypoints = None
		self.loop()
	def loop(self):
		rate = rospy.Rate(20)
		rospy.logwarn("pure persuit starts")
		while not rospy.is_shutdown():
			if self.currentPose and self.currentVelocity and self.currentWaypoints:
				twistCommand = self.calculateTwistCommand()#计算车辆的速度
				self.twist_pub.publish(twistCommand)#发布车辆的速度
			rate.sleep()

	def pose_cb(self,data):#位置回调函数
		self.currentPose = data

	def vel_cb(self,data):#速度回调函数
		self.currentVelocity = data

	def lane_cb(self,data):#局部路径回调函数
		self.currentWaypoints = data

	def calculateTwistCommand(self):
		lad = 0.0 
		targetIndex = len(self.currentWaypoints.waypoints) - 1
		for i in range(len(self.currentWaypoints.waypoints)):#look ahead distance accumulator
			if((i+1) < len(self.currentWaypoints.waypoints)):
				this_x = self.currentWaypoints.waypoints[i].pose.pose.position.x
				this_y = self.currentWaypoints.waypoints[i].pose.pose.position.y
				next_x = self.currentWaypoints.waypoints[i+1].pose.pose.position.x
				next_y = self.currentWaypoints.waypoints[i+1].pose.pose.position.y
				lad = lad + math.hypot(next_x - this_x, next_y - this_y)
				if(lad > HORIZON):
					targetIndex = i+1
					break
		targetWaypoint = self.currentWaypoints.waypoints[targetIndex]
		targetSpeed = self.currentWaypoints.waypoints[0].twist.twist.linear.x
		targetX = targetWaypoint.pose.pose.position.x#目标位置x
		targetY = targetWaypoint.pose.pose.position.y#目标位置y	
		currentX = self.currentPose.pose.position.x#现在位置x
		currentY = self.currentPose.pose.position.y#现在位置y
		quanternion = (self.currentPose.pose.orientation.x, self.currentPose.pose.orientation.y, self.currentPose.pose.orientation.z, self.currentPose.pose.orientation.w)		#get vehicle yaw angle
		euler = tf.transformations.euler_from_quaternion(quanternion)		#四元数转欧拉角
		yaw = euler[2]
		#print(yaw)
		#mark由于使用的坐标系与北斗坐标系不一致，故航向角方向不一致，北斗cgi航向角方向为顺时针，而此处为逆时针，故需要将航向角进行转换，将公式中的-yaw改为yaw，四元数转换欧拉角时，yaw的范围是-pi到pi，而北斗cgi的航向角范围是0到2pi
		alpha = math.atan2(targetY - currentY, targetX - currentX) +yaw                        #-(yaw-init_yaw)    1. pi/2 - yaw	#get angle difference
		l = math.sqrt(math.pow(currentX - targetX, 2) + math.pow(currentY - targetY, 2))#计算距离
		print(alpha)
		print(l)
      
		#print(alpha)
		if(l > 1):
			#if(l<1.5):
			#	l=10
			theta = math.atan(2 * 2.0 * math.sin(alpha) / l)#2.0为轴距  前轮转角公式: theta = 2 * L * math.sin(alpha) / l
			# #get twist command
			twistCmd = Twist()
			twistCmd.linear.x = targetSpeed #targetSpeed-theta/3#线速度计算


			#twistCmd.linear.y = 0
			twistCmd.angular.z = theta*180/3.1415926# theta这是弧度  
			#控制驻车档位,取消驻车状态
			twistCmd.angular.y = 1
			twistCmd.angular.x = 0
			#print(theta)
		else:
			twistCmd = Twist()
			twistCmd.linear.x = 0
			#设置到达目标点标志
			#twistCmd.linear.y = 1
			twistCmd.angular.z = 0
			#制动刹车
			twistCmd.angular.x = 0
			#控制驻车档位，到达目标进入驻车状态
			twistCmd.angular.y=2
		return twistCmd


if __name__ == '__main__':
    try:
        PurePersuit()
    except rospy.ROSInterruptException:
        rospy.logerr('Could not start motion control node.')

