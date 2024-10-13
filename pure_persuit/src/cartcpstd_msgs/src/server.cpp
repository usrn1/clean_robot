//#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include<iostream>
 using namespace  std;
void error_handling(char *message);
 
int main(int argc, char *argv[])
{
    int serv_sock;
    int clnt_sock;
    int str_len, i;
 
    struct sockaddr_in serv_addr;
    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_sz;
 

    char msg2[]={'A','A',(char)0xc0,(char)0xa8,(char)0x0A,(char)0x21,(char)0x17,
    (char)0x05,(char)0x7F,(char)0x00,(char)0x01,(char)0x00,
    (char)0x01,
    (char)0x00,(char)0x00,(char)0x00,(char)0x05,(char)0x01,
    (char)0x00,(char)0x00,(char)0x00,(char)0x02,
    (char)0x00,(char)0x00,(char)0x00,(char)0x03,
    (char)0x00,(char)0x00,(char)0x00,(char)0x08,
    };

   
 


    //char *str_arr[]={msg1, msg2, msg3,msg4,msg5,msg6,msg7,msg8,msg9};    //指针数组指向三个字符串
    char read_buf[100] = {0};
    
    if(argc!=2){
        printf("Usage: %s <port>\n", argv[0]);
        exit(1);
    }
    
    serv_sock=socket(PF_INET, SOCK_STREAM, 0);
    if(serv_sock == -1)
        error_handling("socket() error");
    
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family=AF_INET;
    serv_addr.sin_addr.s_addr=htonl(INADDR_ANY);
    serv_addr.sin_port=htons(atoi(argv[1]));
    
    if(bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr))==-1)
        error_handling("bind() error"); 
    
    if(listen(serv_sock, 5)==-1)
        error_handling("listen() error");
    
    clnt_addr_sz=sizeof(clnt_addr);  
    clnt_sock=accept(serv_sock, (struct sockaddr*)&clnt_addr,&clnt_addr_sz);
    if(clnt_sock==-1)
        error_handling("accept() error");  
    

     i = 1;
    while(1)
    {  
            str_len = 30;
            send(clnt_sock,msg2,str_len,0);
            sleep(2);
       
        i ++;
 /*       str_len=strlen(str_arr[i%3])+1;              //字符串长度+1是包含了字符串结束符'\0'
        cout << str_len <<endl;
        str_len = 17;
        send(clnt_sock,str_arr[i%3],str_len,0);
//        write(clnt_sock, (char*)(&str_len), 4);    //发送字符串长度的整型数信息
 //       write(clnt_sock, str_arr[i], str_len);     //发送字符串信息
          for(int j = 0 ; j < str_len ; j ++)
                    cout << (int)str_arr[i%3][j];
                cout <<endl;
        sleep(5);*/ 
        i++;

    }
    close(clnt_sock);
    close(serv_sock);
    return 0;
}
 
void error_handling(char *message)
{
    fputs(message, stderr);
    fputc('\n', stderr);
    exit(1);
}
