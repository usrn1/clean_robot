#！/bin/bash
ProcNumbera=$(ps -ef |grep -w "serial_TXRX.launch" |wc -l)
ProcNumberb=$(ps -ef |grep -w "tf.launch" |wc -l)

if [ ${ProcNumbera} -le 1 ];
	then if [ ${ProcNumberb} -le 1 ];
		then echo "0"
	else 
		echo "1"
	fi
else  
	echo "1"
fi
if [ ${ProcNumbera} -le 1 ];
then 
	echo "serial_TXRX进程已关闭"
else
	IDs=`ps -ef | grep "serial_TXRX.launch" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "成功结束serial_TXRX进程"
fi
if [ ${ProcNumberb} -le 1 ];
then 
	echo "tf进程已关闭"
else
	IDs=`ps -ef | grep "tf.launch" | grep -v grep | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "成功结束tf进程"
fi

#rosnode kill bache2_copyremove_file
#rosnode kill bache2_serialFile_parse
#rosnode kill maincars_serial_TXRX
#rosnode kill bache2_pure_persuit
#rosnode kill bache2_waypoint_loader
#rosnode kill bache2_waypoint_updater
#rosnode kill bache2_vehicle_pose_and_velocity_updater
#rosnode kill maincar_transform_publisher
#rosnode kill bache2_front
#rosnode kill bache2_follower

