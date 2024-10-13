#！/bin/bash
#start


{
echo 123456| sudo -S  sh -c "echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts"

}&
{
gnome-terminal -t "netstat" -x bash -c "netstat -g;exec bash"
}&

#sleep 1s
{
gnome-terminal -t "master_discovery" -x bash -c "rosrun master_discovery_fkie master_discovery _mcast_group:=224.0.0.251;exec bash"
}&
#sleep 1s
{
gnome-terminal -t "master_sync" -x bash -c "rosrun master_sync_fkie master_sync ;exec bash"
}&
#end

