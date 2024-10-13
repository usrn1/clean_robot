#！/bin/bash

gnome-terminal -t "base_controller.launch" -x bash -c "roslaunch serial_driver haitun_base.launch;exec bash"
#gnome-terminal -t "serial_TXRX.launch" -x bash -c "roslaunch serial_driver serial_TXRX.launch;exec bash"
