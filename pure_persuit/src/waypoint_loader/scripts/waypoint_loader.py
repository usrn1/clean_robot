#!/usr/bin/env python
#coding=utf-8
# @Time    :2021
# @Author  : GL
# @Software:将waypoints.csv文件发布出来，便于后续使用
import os
import csv
import math
from geometry_msgs.msg import Quaternion, PoseStamped
from styx_msgs.msg import Lane, Waypoint
from nav_msgs.msg import Path
import tf
import rospy
CSV_HEADER = ['x', 'y', 'yaw']
MAX_DECEL = 0.5
base_type=os.getenv("CAR_TYPE")#获取车辆类型
class WaypointLoader(object):
    def __init__(self):
        rospy.init_node('waypoint_loader', log_level=rospy.DEBUG)#节点名称
        self.pub = rospy.Publisher(base_type+'/base_waypoints', Lane, queue_size=1, latch=True)#lane类型发布，用于后续轨迹循迹
        self.pub_path = rospy.Publisher(base_type+'/base_path', Path, queue_size=1, latch=True)#path类型发布，用于在rviz下显示
        self.velocity = self.kmph2mps(rospy.get_param('~velocity'))#km/h到m/s转换
        self.new_waypoint_loader(rospy.get_param('~path'))
        rospy.spin()

    #load waypoint from file
    def new_waypoint_loader(self, path):
        if os.path.isfile(path):
            waypoints, base_path = self.load_waypoints(path)#get waypaint and base_path
            self.publish(waypoints, base_path)
            rospy.loginfo('Waypoint Loded')
        else:
            rospy.logerr('%s is not a file', path)

    def quaternion_from_yaw(self, yaw):#角度转四元数
        return tf.transformations.quaternion_from_euler(0., 0., yaw)

    def kmph2mps(self, velocity_kmph):    #velocity:km/s->m/s
        return (velocity_kmph * 1000.) / (60. * 60.)

    def load_waypoints(self, fname):
        waypoints = []
        base_path = Path()
        base_path.header.frame_id = 'world'#发布的世界坐标
        with open(fname) as wfile:
            reader = csv.DictReader(wfile, CSV_HEADER)#以CSV_HEADER这种形式读取.csv文件
            for wp in reader:
                p = Waypoint()
                p.pose.pose.position.x = float(wp['x'])#x坐标
                p.pose.pose.position.y = float(wp['y'])#y坐标
                q = self.quaternion_from_yaw(float(wp['yaw']))#四元数
                p.pose.pose.orientation = Quaternion(*q)
                p.twist.twist.linear.x = float(self.velocity)#速度
                p.forward = True
                waypoints.append(p)

                path_element = PoseStamped()
                path_element.pose.position.x = p.pose.pose.position.x#rviz下获取x,y坐标，便于显示
                path_element.pose.position.y = p.pose.pose.position.y
                base_path.poses.append(path_element)

                
        waypoints = self.decelerate(waypoints)#修改车辆到终点的速度
        return waypoints,base_path

    def distance(self, p1, p2):
        x, y, z = p1.x - p2.x, p1.y - p2.y, p1.z - p2.z
        return math.sqrt(x*x + y*y + z*z)

    def decelerate(self, waypoints):
        last = waypoints[-1]
        last.twist.twist.linear.x = 0.
        for wp in waypoints[:-1][::-1]:
            dist = self.distance(wp.pose.pose.position, last.pose.pose.position)
    
            vel = math.sqrt(2 * MAX_DECEL * dist)
            #mark2 如果车辆未到达终点，车辆速度逐渐减小 若车辆没到达终点速度为0，将if语句注释掉
            if vel < 1.:
                vel = 0.
            wp.twist.twist.linear.x =wp.twist.twist.linear.x #min(vel,wp.twist.twist.linear.x)
        return waypoints

    def publish(self, waypoints, base_path):#发布两个话题
        lane = Lane()
        lane.header.frame_id = '/world'
        lane.header.stamp = rospy.Time(0)
        lane.waypoints = waypoints
        self.pub.publish(lane)
        self.pub_path.publish(base_path)


if __name__ == '__main__':
    try:
        WaypointLoader()
    except rospy.ROSInterruptException:
        rospy.logerr('Could not start waypoint node.')
