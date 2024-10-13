#include"socket.h"

class  CarStartServuceClient{
    public:
    ros::Subscriber subscriber_;
    //获取机器人当前运行状态
    ros::Subscriber subscriber_getRobotStatus;
    ros::NodeHandle* node;
    //TODO【重启订阅者的核心代码】 qt中的循环执行函数，每300mms执行一次
    void onUpdate();
    //=================获取 rosnode list 终端的数据===================
    //去掉所有空格及换行符
    std::string get_string(std::string res);
    //获取终端返回值
    std::string getLastestGitInfo(char* cmd,std::vector<std::string> &cmdString,std::map<std::string, std::string> &nodeNme);
    void split_data(std::string pattern,std::string str,std::vector<std::string> &result,std::map<std::string, std::string> &nodeNme);  
    //bool ifFindRostopic(string  cmdStr,string topicStr);
    //字典数据
    std::map<std::string, std::string> nodeNme;
    //启动/停止 机器人 与ui交互 ui与定时器两个订阅
    int disinfect_ui_node_int=1;
    //获取机器人当前运行状态
    int slamteccarUiControllerNode_int=1;
    
    void (*pfVel)(const nav_msgs::Odometry::ConstPtr&);
    void (*pfPose)(const styx_msgs::Position::ConstPtr&);
    CarStartServuceClient(ros::NodeHandle *n,ros::Subscriber s1,ros::Subscriber  s2, void (*p1)(const nav_msgs::Odometry::ConstPtr&),
                                                                                                void (*p2)(const styx_msgs::Position::ConstPtr&));
    //void initWidgets();
    //void bindSignal();
    void initRosCommunication();
    std::string descr=getenv("CAR_TYPE");
    
};

//构造函数
CarStartServuceClient::CarStartServuceClient(ros::NodeHandle *n,ros::Subscriber s1,ros::Subscriber  s2,
                                                                                                void (*p1)(const nav_msgs::Odometry::ConstPtr&),
                                                                                                void (*p2)(const styx_msgs::Position::ConstPtr&)):
                                                                                                node(n),subscriber_(s1), subscriber_getRobotStatus(s2),pfVel(p1),pfPose(p2) {
        //initWidgets();
        //bindSignal();
        //ros通讯
        initRosCommunication();
}
 
 bool ifFindRostopic(string  cmdStr,string topicStr){
        int j = 0;
        //cout << cmdStr <<  cmdStr.size()<<"\n"<<  topicStr << "       " << topicStr.size() <<"      ";
            for(int i = 0 ; i < cmdStr.size()&&j<topicStr.size(); i++)
        {
            //cout << cmdStr[i] << "   " <<  topicStr[j] <<endl;
                if(cmdStr[i] == topicStr[j])
                {
                    j ++ ;
                     if(j == topicStr.size())
                    {
                        cout << j <<endl;
                         return true;
                     }
                }
                else{
                    j = 0;
                }
        }
         cout << j << endl;  
         return false;          
        }
        
       
 
//ros通讯
void CarStartServuceClient::initRosCommunication() {
    /*-------------------------- 接收小车pose --------------------------*/
    //topic名字
    string topicName_odom = descr+"/odom";
}
 
/*void CarStartServuceClient::initWidgets() {
     //循环执行
    updateTimer = new QTimer(this);
    updateTimer->setInterval(300);
    updateTimer->start();
}*/
 
//
/*void CarStartServuceClient::bindSignal() {
    connect(updateTimer, &QTimer::timeout, this, &CarStartServuceClient::onUpdate);
}*/

//TODO【重启订阅者的核心代码】 qt中的循环执行函数，每300mms执行一次
void CarStartServuceClient::onUpdate() {
 
    //=================获取终端的数据===== 判断note节点是否断开重新链接==============
    vector<std::string> cmdString;//cmdString这个虽然写着带但是没用到,主要用到的是字典nodeNme数据来储存rosnode list 获取到的值
    nodeNme.clear();
    //获取话题列表
    char* cmd = "rosnode list < /dev/null 2>&1";
    std::string result=getLastestGitInfo(cmd,cmdString,nodeNme);

    //在result中查询是否有对应的字符串消息
    bool ifFind = ifFindRostopic(result,"/maincar_serial_TXRX");
    //cout <<"/maincar_serial_TXRX:    " << ifFind << endl;
    
    //判断字典nodeNme中是否存在 /disinfect_ui_node 节点，存在且disinfect_ui_node_int==1 就重启subscriber
    if( ifFind &&disinfect_ui_node_int==1){
        subscriber_.shutdown();
        //启动/停止 机器人 与ui交互 ui与定时器两个订阅
        subscriber_ = node->subscribe<nav_msgs::Odometry>(descr+"/odom", 100, pfVel );
        disinfect_ui_node_int=0;
        //std::cout << disinfect_ui_node_int << std::endl;
    }else if(!ifFind){
        disinfect_ui_node_int=1;
        //std::cout << disinfect_ui_node_int << std::endl;
    }
    //判断字典nodeNmget_stringe中是否存在 /slamteccarUiControllerNode 节点，存在且disinfect_ui_node_int==1 就重启subscriber
   
    if(ifFind&&slamteccarUiControllerNode_int==1){
        subscriber_getRobotStatus.shutdown();
        //获取机器人当前运行状态
        subscriber_getRobotStatus = node->subscribe<styx_msgs::Position>(descr+"/position", 100,  pfPose);
        slamteccarUiControllerNode_int=0;
    }else if(!ifFind){
        slamteccarUiControllerNode_int=1;
    }
}
 
//=================获取 rosnode list 终端的数据===================
void CarStartServuceClient::split_data(std::string pattern,std::string str,std::vector<std::string> &result,std::map<std::string, std::string> &nodeNme)
{
    try {
 
        std::string::size_type pos;
        //std::vector<std::string> result;
        pattern+=str; //扩展字符串以方便操作
        int  size=pattern.size();
 
        for ( int  i=0; i<size; i++)
        {
            pos=pattern.find(str,i);
            if (pos<size)
            {
                std::string s=pattern.substr(i,pos-i);
                result.push_back(s);
                // 构建map，key = 文件名， value = pose
                nodeNme[s] = s;
                i=pos+str.size()-1;
            }
        }
 
 
    }catch (std::exception e){
        //qDebug() << "CarStartServuceClient::split 抛出异常！";
    }
 
}
 
 
//去掉所有空格及换行符
std::string CarStartServuceClient::get_string(std::string res){
    //删除换行符
    int r = res.find('\n');
    while (r != string::npos)
    {
        if (r != string::npos)
        {
            res.replace(r, 1, "");
            r = res.find('\n');
        }
    }
 
//删除所有空格
//res.erase(std::remove_if(res.begin(), res.end(), (int)std::isspace), res.end());
 
    return res;
 
}
 
//获取终端返回值
std::string CarStartServuceClient::getLastestGitInfo(char* cmd,std::vector<std::string> &cmdString,std::map<std::string, std::string> &nodeNme) {
    // const char* cmd = "git log < /dev/null 2>&1 | grep \"Date:\" | head -n1";  //git log < /dev/null 2>&1 | grep "Date:" | head -n1
    // char* cmd = "rosnode list < /dev/null 2>&1";  //git log < /dev/null 2>&1 | grep "Date:" | head -n1
    std::array<char, 128> buffer;
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
    if (!pipe) {
        throw std::runtime_error("popen() failed!");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    if(!result.empty()){
        result =get_string(result);
      //  std::cout<<result;
        //切割
        //  split_data("/",result,cmdString);
        split_data(result,"\n",cmdString,nodeNme);
        //  cmdString.push_back(result);
        return result.substr(0, 10000) ;
    }
    else{
        return "vslam";
    }
}
