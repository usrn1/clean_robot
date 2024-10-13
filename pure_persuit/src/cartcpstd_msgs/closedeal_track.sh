#！/bin/bash
ProcNumbera=$(ps -ef |grep -w "copy_file" |wc -l)
ProcNumberb=$(ps -ef |grep -w "serialFile_parse" |wc -l)

if [ ${ProcNumbera} -le 1 ];
	then if [ ${ProcNumberb} -le 1 ];
		then echo "0"
	else 
		echo "1"
	fi
else  
	echo "1"
fi
if [ ${ProcNumbera} -le 1 ];
then 
	echo "copy_file进程已关闭"
else
	IDs=`ps -ef | grep "copy_file" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
fi

if [ ${ProcNumberb} -le 1 ];
then 
	echo "serialFile_parse进程已关闭"
else
	IDs=`ps -ef | grep "serialFile_parse" | awk '{print $2}'`
	for id in $IDs
	do
		kill -9 $id
	done
fi
#rosnode kill bache2_serial_TXRX
#rosnode kill bache2copyremove_file
#rosnode kill bache2serialFile_parse


