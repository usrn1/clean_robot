#！/bin/bash

gnome-terminal -t "serial_TXRX.launch" -x bash -c "roslaunch serial_driver serial_TXRX.launch"
sleep 2s

gnome-terminal -t "waypoint_loader.launch" -x bash -c "roslaunch waypoint_loader waypoint_loader.launch"
sleep 2s


gnome-terminal -t "waypoint_updater.launch" -x bash -c "roslaunch waypoint_updater waypoint_updater.launch"
sleep 1s
gnome-terminal -t "pure_persuit.launch" -x bash -c "roslaunch pure_persuit pure_persuit.launch"
sleep 1s
