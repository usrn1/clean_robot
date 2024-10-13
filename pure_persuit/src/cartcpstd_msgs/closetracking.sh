#！/bin/bash
ProcNumbera=$(ps -ef |grep -w "serial_TXRX.launch" |wc -l)
ProcNumberb=$(ps -ef |grep -w "waypoint_loader" |wc -l)
ProcNumberc=$(ps -ef |grep -w "waypoint_updeter" |wc -l)
ProcNumberd=$(ps -ef |grep -w "pure_persuit" |wc -l)
sum=`expr ${ProcNumbera} + ${ProcNumberb} + ${ProcNumberc} + ${ProcNumberd}`

if [ ${sum} -le 4 ];
then 	echo 0
else 
	echo 1
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
ProcNumber=$(ps -ef |grep -w "waypoint_loader" |wc -l)
if [ ${ProcNumberb} -le 1 ];
then 
	echo "waypoint_loader进程已关闭"
else
	IDs=`ps -ef | grep "waypoint_loader" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "成功结束waypoint_loader进程"
fi
ProcNumber=$(ps -ef |grep -w "waypoint_updater" |wc -l)
if [ ${ProcNumberc} -le 1 ];
then 
	echo "waypoint_updater进程已关闭"
else
	IDs=`ps -ef | grep "waypoint_updater" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "成功结束waypoint_updater进程"
fi
ProcNumber=$(ps -ef |grep -w "pure_persuit" |wc -l)
if [ ${ProcNumberd} -le 1 ];
then 
	echo "pure_persuit进程已关闭"
else
	IDs=`ps -ef | grep "pure_persuit" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "成功结束pure_persuit进程"
fi


rosnode kill maincar_serial_TXRX
rosnode kill maincar_waypoint_loader
rosnode kill maincar_waypoint_updater
rosnode kill maincar_vehicle_pose_and_velocity_updater

#rosnode kill bache2_pure_persuit
