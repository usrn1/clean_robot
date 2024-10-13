#！/bin/bash

echo "处理轨迹："
now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "copy_file.launch" -x bash -c "roslaunch serial_driver copy_file.launch"
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开copy_file.launch，时间为："$((end_time-start_time))"s"
sleep 4s
now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "serialFile_parse.launch" -x bash -c "roslaunch serial_driver serialFile_parse.launch"	
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开serialFile_parse.launch，时间为："$((end_time-start_time))"s"
sleep 3s
