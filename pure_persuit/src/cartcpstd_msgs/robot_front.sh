#！/bin/bash

gnome-terminal -t "serial_TXRX.launch" -x bash -c "roslaunch serial_driver serial_TXRX.launch"

gnome-terminal -t "tf.launch" -x bash -c "roslaunch waypoint_updater tf.launch"
sleep 1s
gnome-terminal -t "static_tf.launch" -x bash -c "roslaunch waypoint_updater static_tf.launch"
sleep 1s
#gnome-terminal -t "robot_front.launch" -x bash -c "roslaunch muilt_formation robot_front.launch;exec bash"



