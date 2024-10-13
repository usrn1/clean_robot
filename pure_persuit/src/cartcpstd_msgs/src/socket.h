	#ifndef _SOCKET_H
	#define _SOCKET_H
	#include"ros/ros.h" 
    #include<unistd.h>
	#include<sys/socket.h>
	#include<sys/types.h>
	#include<arpa/inet.h>
	#include<netinet/in.h>
	#include<sys/select.h>
	#define SOCKET int
	#define INVALID_SOCKET  (SOCKET)(~0)
	#define SOCKET_ERROR            (-1)
    #include<iostream>
    #include<string.h>
    #include<stdio.h>
    #include<vector>
    #include<thread>
    #include "turtlesim/Pose.h"
   #include "geometry_msgs/Twist.h"
   #include"stdlib.h"
   #include"styx_msgs/CarState.h"
   #include"styx_msgs/Position.h"
   #include "tf/transform_datatypes.h"
   #include"styx_msgs/model.h"
  #include"styx_msgs/EStop.h"
   #include<nav_msgs/Odometry.h>
#include<std_msgs/Bool.h>
   #include"fstream"
    using namespace std;
 
   class EasyTcpClient
{
   public:
	    EasyTcpClient() :_sock(INVALID_SOCKET), _lastPos(0) {
		memset(_recvBuff, 0, sizeof(_recvBuff));
		memset(_recvMsgBuff, 0, sizeof(_recvMsgBuff));
	}
	virtual ~EasyTcpClient() {
		CloseSocket();
	}
public:
	//判断当前客户端是否在运行
	bool isRun() { return _sock != INVALID_SOCKET; }
	//初始化socket
	void InitSocket();
	//连接服务器
	int ConnectServer(const char* ip, unsigned int port);
	//关闭socket
	void CloseSocket();
	//处理网络消息
	bool Onrun(ros::NodeHandle nh,ros::Publisher pub);
	
	/*
		使用RecvData接收任何类型的数据，
		然后将消息的头部字段传递给OnNetMessage()函数中，让其响应不同类型的消息
	*/
	//接收数据
	int RecvData();
	//响应网络消息
 
    	SOCKET _sock;
     
private:

    #define RECV_BUFF_SIZE 10240
	  unsigned char _recvBuff[RECV_BUFF_SIZE];        //第一缓冲区(接收缓冲区)
	unsigned char _recvMsgBuff[RECV_BUFF_SIZE * 10];//第二缓冲区(消息缓冲区)
	int _lastPos;
};
 
 EasyTcpClient client;
unsigned char* recvbuff;

 void EasyTcpClient::InitSocket()
{
	//如果之前有连接了，关闭旧连接，开启新连接
	if (isRun())
	{
		std::cout << "<Socket=" << (int)_sock << ">：关闭旧连接，建立了新连接" << std::endl;
		CloseSocket();
	}
	_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (INVALID_SOCKET == _sock) {
		std::cout << "ERROR:建立socket失败!" << std::endl;
	}
	else {
		std::cout << "<Socket=" << (int)_sock << ">：建立socket成功!" << std::endl;
	}
}
 
int EasyTcpClient::ConnectServer(const char* ip, unsigned int port)
{
	if (!isRun())
	{
		InitSocket();
	}
 
	//声明要连接的服务端地址（注意，不同平台的服务端IP地址也不同）
	struct sockaddr_in _sin = {};

	_sin.sin_addr.s_addr = inet_addr(ip);
	_sin.sin_family = AF_INET;
	_sin.sin_port = htons(port);
 
	//连接服务端
	int ret = connect(_sock, (struct sockaddr*)&_sin, sizeof(_sin));
	if (SOCKET_ERROR == ret) {
		std::cout << "<Socket=" << (int)_sock << ">：连接服务端(" << ip << "," << port << ")失败!" << std::endl;
	}
	else {
		std::cout << "<Socket=" << (int)_sock << ">：连接服务端(" << ip << "," << port << ")成功!" << std::endl;
	}
	
	return ret;
}
 
void EasyTcpClient::CloseSocket()
{
	if (_sock != INVALID_SOCKET)
	{

		close(_sock);
		_sock = INVALID_SOCKET;
	}
}

bool EasyTcpClient::Onrun(ros::NodeHandle nh,ros::Publisher pub)
{
	if (isRun())
	{
		fd_set fdRead;
		FD_ZERO(&fdRead);
		FD_SET(_sock, &fdRead);
 
		struct timeval t = { 1,0 };
		int ret = select(_sock + 1, &fdRead, NULL, NULL, &t);
		if (ret < 0)
		{
			std::cout << "<Socket=" << _sock << ">：select出错！" << std::endl;
			return false;
		}
		if (FD_ISSET(_sock, &fdRead)) //如果服务端有数据发送过来，接收显示数据
		{
			FD_CLR(_sock, &fdRead);
			if (-1 == RecvData())
			{
				std::cout << "<Socket=" << _sock << ">：数据接收失败，或服务端已断开！" << std::endl;
				return false;
			}
		}
		return true;
	}
	return false;
}

int compare2arrar(unsigned char*a, unsigned char*b)
{
	if(sizeof(a)!=sizeof(b))
	{
		return -1;
	}			
	for(int i = 0 ; i < 4; )
	{
	
		if(a[i] == b[i])
			i ++;
		else
		{
			return -1;
		}		
	}
	return 0;
}
int EasyTcpClient::RecvData()
{	
	int _nLen = recv(_sock, _recvBuff, RECV_BUFF_SIZE, 0);
	if (_nLen < 0) {
		std::cout << "<Socket=" << _sock << ">：recv函数出错！" << std::endl;
		return -1;
	}
	else if (_nLen == 0) {
		std::cout << "<Socket=" << _sock << ">：接收数据失败，服务端已关闭!" << std::endl;
		return -1;
	}
    else 
    {
        recvbuff = _recvBuff;
         return 0;
    }
       
}


#endif
