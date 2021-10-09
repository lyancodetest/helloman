#!/bin/bash
tHosts="10.2.0.212 10.2.0.213"
tPorts="9092 2181 9092 21050"
ports="80 7083 3306 8001 8002 8003 8070 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 9092 9093 9094 9095 9096 9098 9099 20881 20882 20883 20884 20885 20886 20887 20888 20889"
function checkMachineConfig(){
echo "check machine config..."    
s1=$(cat /etc/redhat-release|grep CentOS|wc -l)
n1=$(cat /etc/redhat-release|awk '{print $4}'|awk -F. '{print $1}')
n2=$(cat /etc/redhat-release|awk '{print $4}'|awk -F. '{print $2}')
c1=$(cat /proc/cpuinfo|grep processor|wc -l)
m1=$(cat /proc/meminfo |grep MemTotal|awk -F: '{print $2}'|awk '{print $1}')
m=$(($m1/1024/1024)) 
if [ $s1 -ge 1 -a  $n1 -eq 7 -a  $n2 -ge 2 -a $c1 -ge 4 -a $m -ge 30 ]
then
echo "system is centos 7.2+,cpu is 4 processor+,memory is 32GB+"
else
echo "机器配置未达到最低标准,推荐配置CPU:4核+，内存:32G+),"
fi
}
checkMachineConfig

function checkPorts(){
  echo "check machine ports ..."
  failPorts=()    
  pid=""
  i=0
  for port in $ports;
  do
   pid=$(netstat -lnp | grep $port | awk '{print $7}' | awk -F '/' '{print $1}')   
#echo "port:$port,pid:$pid"
   if [ "$pid" != "" ]
       then
        failPorts[$i]=$port 
   fi
   i=`expr $i+1`
  done
  if [ "${failPorts[length]}"  > 0 ]
    then
       echo "检查${failPorts[*]} 端口被占,请处理后,才可部署"
    else
       echo "机器端口检查正常"
  fi         
}
checkPorts

function checkNetworks(){
  echo "check networks..."  
  failNetHost=()
  failNetPort=() 
  i=0
  j=0
  for host in $tHosts;
  do
   ping=`ping -c 3 $host|awk 'NR==7 {print $4}'`
   if [[ $ping -eq 0 ]]
    then
      failNetHost[$i]=$host
      i=`expr $i+1`
    else
      for port in $tPorts:
        do
          result=`echo -e "\n" | telnet $host $port 2>/dev/null | grep Connected | wc -l`
          if [ $result -eq 1 ]; 
          then
            echo "Network $host:$port is Open."
          else
            failNetPort[$j]="$host:$port"
            j=`expr $j+1`    
          fi
        done  
   fi
  done

  if [ "${failNetHost[length]}" > 0 ]
     then
       echo "检查外部IP:${failNetHost[*]},网络不通,请仔细检查" 
     else
       echo "检查外部IP网络正常"
  fi

  if [ "${failNetPort[length]}" > 0 ]
   then
    echo "检查外部端口:${failNetPort[*]},网络不通,请仔细检查" 
  fi
}
checkNetworks

function checkSoft(){
  echo "check soft install..."
  docker -v
  if [ $? -eq  0 ]; then
    echo "检查到Docker已安装成功!"
    apolloDb=`docker inspect --format '{{.State.Running}}' apollo-db`    
    apolloDbdata=`docker inspect --format '{{.State.Running}}' apollo-dbdata`
    apolloQuickStart=`docker inspect --format '{{.State.Running}}' apollo-quick-start`
    if [ "$apolloDb" = "true" -a "$apolloDbdata" = "true" -a "$apolloQuickStart" = "true" ];  
      then
        echo "apollo 已安装成功!"
      else
        echo "apollo 未安装成功,请查看apollo-db,apollo-dadata和apollo-quick-start docker服务是否启动正常."  
    fi
  else
    echo "当前机器未安装docker环境,请依照提供的docker镜像文件进行安装...."
  fi
}
checkSoft

