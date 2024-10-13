#！/bin/bash
now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "serial_TXRX.launch" -x bash -c "roslaunch serial_driver serial_TXRX.launch"
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开serial_TXRX.launch，时间为："$((end_time-start_time))"s"
sleep 1s

now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "waypoint_loader_invert.launch" -x bash -c "roslaunch waypoint_loader waypoint_loader_invert.launch"
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开waypoint_loader_invert.launch，时间为："$((end_time-start_time))"s"

sleep 1s

now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "waypoint_updater.launch" -x bash -c "roslaunch waypoint_updater waypoint_updater.launch"
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开waypoint_updater.launch，时间为："$((end_time-start_time))"s"


now=`date +'%Y-%m-%d %H:%M:%S'`
start_time=$(date --date="$now" +%s);
gnome-terminal -t "pure_persuit.launch" -x bash -c "roslaunch pure_persuit pure_persuit.launch"
now=`date +'%Y-%m-%d %H:%M:%S'`
end_time=$(date --date="$now" +%s);
echo "打开pure_persuit.launch，时间为："$((end_time-start_time))"s"



