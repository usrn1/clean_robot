#! /usr/bin/env python
#coding=utf-8
import rospy
import os
import shutil
import os.path
 
base_type=os.getenv("CAR_TYPE")

if __name__=='__main__':
    rospy.init_node(base_type+"copyremove_file")
    path1=rospy.get_param("~path1")
    path2=rospy.get_param("~path2")
    myfile=os.path.exists(path1)
    if myfile==1:
        os.unlink(path1)
        shutil.move(path2,path1)
    elif myfile==0:
        shutil.move(path2,path1)

    
