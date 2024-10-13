#！/bin/bash
ProcNumber=$(ps -ef |grep -w "serial_TXRX.launch" |wc -l)
if [ ${ProcNumber} -le 1 ];
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
#rosnode kill bache2_serial_TXRX


