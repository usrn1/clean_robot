#sudo ip link set can0 type can bitrate 500000
#sudo ip link set can0 up

#stty -F /dev/txrx_st15 115200 cs8 -cstopb -parenb  
#while ture; do
#	#读取串口数据
#	IFS =,read -ra data< /dev/txrx_st15
#	if["${data[2]}"= "1"];then
#		roslaunch pure_persuit Forward_trajectory1.launch
#	elif["${data[2]}"= "2"];then
#		roslaunch pure_persuit Forward_trajectory2.launch
#	elif["${data[2]}"= "3"];then
#		roslaunch pure_persuit Forward_trajectory3.launch
#	else
#		echo"unknow command:${data[2]}"
#	fi
#done
source /opt/ros/melodic/setup.bash 
source /home/liang/cl_rootws/cl_control_m2/devel/setup.bash
source /home/liang/cl_rootws/pure_persuit/devel/setup.bash

gnome-terminal -- bash -c "roslaunch pure_persuit Forward_trajectory.launch;exec bash";

sleep 10s
window_id=$(xdotool getactivewindow)




gnome-terminal -- bash -c " roslaunch pure_persuit pure_persuit.launch;exec bash"

sleep 10s
window_id1=$(xdotool getactivewindow)
# 获取当前焦点窗口的窗口ID
#window_id=$(xdotool getwindowfocus)

# 切换到特定终端窗口并关闭
#window_id=$(xdotool search --onlyvisible --class Terminal | head -n 2)
#xdotool windowactivate --sync $window_id key Alt+F4
xdotool windowactivate --sync $window_id key Alt+F4
xdotool windowactivate --sync $window_id1 key Alt+F4


gnome-terminal -- bash -c "roslaunch pure_persuit Reverse_trajectory.launch;exec bash"
sleep 10s

exit
