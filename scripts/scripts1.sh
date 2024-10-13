#!/bin/bash




source /opt/ros/melodic/setup.bash 
source /home/liang/cl_rootws/cl_control_m2/devel/setup.bash
source /home/liang/cl_rootws/pure_persuit/devel/setup.bash

export CAR_TYPE=maincar

echo "Script is running"

#gnome-terminal -- bash -c “echo 153461 | sudo ip link set can0 type can bitrate 500000 && sudo ip link set can0 up;exec bash”
#echo "can successfully started"
#sleep 10s

#echo 153461 | sudo -S ip link set can0 type can bitrate 500000 &&  ip link set can0 up;exec bash

#sudo ip link set can0 type  cam bitrate 500000 <<END
#153461
#END
#gnome-terminal 
#echo "153461" | sudo -c "ip link set can0 type can bitrate 500000"
#echo "153461" | sudo -c "ip link set can0 up"
#sudo ip link set can0 type can bitrate 500000
#echo "153461"
echo "153461" | sudo -S ip link set can0 type can bitrate 500000
sudo ip link set can0 up
echo "can successfully started"
sleep 10s

gnome-terminal -- bash -c "roslaunch cl_control cl_control.launch;exec bash"

echo "cl_control.launch successfully started"

sleep 10s 
#北斗初始化需要时间！
gnome-terminal -- bash -c "roslaunch serial_driver serial_TXRX.launch;exec bash"

echo "serial_TXRX.launch successfully started"

sleep 10s

gnome-terminal -- bash -c "roslaunch txrx_st15 txrx_st15.launch;exec bash"

echo "txrx_st15.launch successfully started"

#cat /dev/txrx_st15 
#从串口读取要执行那条路径

stty -F /dev/st15 raw speed 115200

cat /dev/st15 | while read LINE
do
	#判断包头包尾
	if [[ $LINE == *START* ]]; then
		# 截取包头之后的数据
		data=${LINE#*START}
		# 判断是否包含包尾"END"
		if [[ $data == *END* ]]; then
			# 截取包头和包尾之间的有效数据
			valid_data=${data%%END*}
			# 进行进一步处理，例如分割数据并提取特定字段
			IFS=' ' read -r -a data_array <<< "$valid_data"

			# 获取想要的数据，例如第三个和第五个数据
			third_data=${data_array[2]}
			
			case $third_data in
			    1)
				gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory1.launch;exec bash"
				window_id=$(xdotool getwindowfocus)
				sleep 10s
				break
				;;
			    2)
				gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory2.launch;exec bash"
				window_id=$(xdotool getwindowfocus)
				sleep 10s
				break
				;;
			    3)
				gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory3.launch;exec bash"
				window_id=$(xdotool getwindowfocus)
				sleep 10s
				break	
				;;
			    *)
				echo "Invalid data, cannot execute any launch file"
				break
				;;
			esac

		fi
	fi
done


gnome-terminal -- bash -c " roslaunch pure_persuit pure_persuit.launch;exec bash"
window_id1=$(xdotool getwindowfocus)
sleep 10s
echo "forwardpure_persuit.launch successfully started"				

#返回路径发布
cat /dev/st15 | while read LINE
do
	#判断包头包尾
	if [[ $LINE == *START* ]]; then
		# 截取包头之后的数据
		data=${LINE#*START}
		# 判断是否包含包尾"END"
		if [[ $data == *END* ]]; then
			# 截取包头和包尾之间的有效数据
			valid_data=${data%%END*}
			# 进行进一步处理，例如分割数据并提取特定字段
			IFS=' ' read -r -a data_array <<< "$valid_data"
			
			fifth_data = ${data_array[4]}

			case $fifth_data in
			    1)
				xdotool windowactivate --sync $window_id key Alt+F4
				xdotool windowactivate --sync $window_id1 key Alt+F4
				gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory1.launch;exec bash"
				break
				sleep 10s
				;;
			    2)
				xdotool windowactivate --sync $window_id key Alt+F4
				xdotool windowactivate --sync $window_id1 key Alt+F4
				gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory2.launch;exec bash"
				window_id=$(xdotool getwindowfocus)
				break
				sleep 10s
				;;
			    3)
				xdotool windowactivate --sync $window_id key Alt+F4
				xdotool windowactivate --sync $window_id1 key Alt+F4
				gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory3.launch;exec bash"
				window_id=$(xdotool getwindowfocus)
				break
				sleep 10s
				;;
			    *)
				echo "Invalid data, cannot execute any launch file"
				;;
			esac

		fi
	fi
done
gnome-terminal -- bash -c "roslaunch pure_persuit pure_persuit.launch;exec bash"
sleep 10s
echo "forwardpure_persuit.launch successfully started"		

: '
while true
do

	# 读取串口数据
	serial_data=$(cat /dev/st15)
	# 提取有效数据
	start_marker="START"
	end_marker="END"

	# 查找包头和包尾位置
	start_pos=$(echo "$serial_data" | grep -b -o "$start_marker" | cut -d: -f1)
	end_pos=$(echo "$serial_data" | grep -b -o "$end_marker" | cut -d: -f1)

	# 提取有效数据部分
	valid_data=$(echo "${serial_data:$start_pos+$#start_marker:$end_pos-$start_pos-$#start_marker}")

	# 将有效数据按空格分割成数组
	IFS=' ' read -r -a data_array <<< "$valid_data"

	# 获取数组第三位数据
	third_data=${data_array[2]}
	fifth_data = ${data_array[4]}

# 根据第三位数据执行相应的launch文件
case $third_data in
    1)
	gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory1.launch;exec bash"
	sleep 10s
        ;;
    2)
	gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory2.launch;exec bash"
	sleep 10s
        ;;
    3)
	gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory3.launch;exec bash"
	sleep 10s
        ;;
    *)
        echo "Invalid data, cannot execute any launch file"
        ;;
esac

#gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory.launch;exec bash"
#sleep 10s


gnome-terminal -- bash -c " roslaunch pure_persuit pure_persuit.launch;exec bash"
sleep 10s
echo "pure_persuit.launch successfully started"



fifth_data = ${data_array[4]}

case $fifth_data in
    1)
	gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory1.launch;exec bash"
	sleep 10s
        ;;
    2)
	gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory2.launch;exec bash"
	sleep 10s
        ;;
    3)
	gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory3.launch;exec bash"
	sleep 10s
        ;;
    *)
        echo "Invalid data, cannot execute any launch file"
        ;;
esac

gnome-terminal -- bash -c " roslaunch pure_persuit pure_persuit.launch;exec bash"
sleep 10s
echo "pure_persuit.launch successfully started"
#pgrep -f"roslaunch .*pure_persuit Forward_trajectory.launch"|xargs kill
#pgrep -f"roslaunch .*pure_persuit pure_persuit.launch"|xargs kill
#sleep 10s

#gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory.launch;exec bash" 
#sleep 10s

#gnome-terminal -- bash -c " roslaunch pure_persuit pure_persuit.launch"
#sleep 10s
'

