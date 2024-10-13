#！/bin/bash
#在关闭循迹的程序中关闭serial_TXRX,此文件中只关闭tf

ProcNumbera=$(ps -ef |grep -w "serial_TXRX.launch" |wc -l)
if [ ${ProcNumbera} -le 1 ];
then 
	echo "0serial_TXRX进程已关闭"
else
	IDs=`ps -ef | grep "serial_TXRX.launch" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "1成功结束serial_TXRX进程"
fi

ProcNumberb=$(ps -ef |grep -w "tf.launch" |wc -l)
if [ ${ProcNumberb} -le 1 ];
then 
	
	echo "0tf进程已关闭"
	
else
	IDs=`ps -ef | grep "tf.launch" | grep -v grep | awk '{print $2}'`

	for id in $IDs
	do
		kill -9 $id
	done
	echo "1成功结束tf进程"
	
fi

ProcNumberc=$(ps -ef |grep -w "static_tf.launch" |wc -l)
if [ ${ProcNumberc} -le 1 ];
then 
	echo "0serial_TXRX进程已关闭"
else
	IDs=`ps -ef | grep "static_tf.launch" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "1成功结束serial_TXRX进程"
fi

ProcNumberd=$(ps -ef |grep -w "robot_front.launch" |wc -l)
if [ ${ProcNumberd} -le 1 ];
then 
	echo "0serial_TXRX进程已关闭"
else
	IDs=`ps -ef | grep "robot_front.launch" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
	echo "1成功结束serial_TXRX进程"
fi



#IDs=`ps -ef | grep "robot_front" | awk '{print $2}'`
#for id in $IDs
#do
#	kill -9 $id
#done

#rosnode kill bache2_serial_TXRX
#rosnode kill bache2_waypoint_updater
#rosnode kill bache2_transform_publisher
#rosnode kill bache2_front
#rosnode kill bache2_follower

