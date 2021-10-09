#!/bin/bash
set -e
ws=`cd $(dirname $0);pwd -P`
rm -rf $ws/log.txt
log=$ws/log.txt
sql=$ws/mysql/sql/upgrade/
version=3.0.0-RELEASE
source $ws/config.txt
#nginxPort=80
#redisPort=8001
#serverPort=8081
#managePort=9091
#dubboPort=20881
#localUrl=10.2.0.34
#kafkaUrl=192.168.36.91:9092
#hostList="--add-host namenode.kuangheng.com:192.168.36.91 --add-host datanode1.kuangheng.com:192.168.36.92 --add-host datanode2.kuangheng.com:192.168.36.93 "
curDate=`date +%Y%m%d`
echo "开始进行版本升级大概需要1-2分钟，请耐心等待...."
# 清除所有运行的容器和镜像
function clear1(){
  echo "docker rm container start" >> $log
  dbusFlag=`docker inspect --format '{{.State.Running}}' databus`    
  if [ $dbusFlag = "true" ];
  then
     docker rm -f databus
  fi
  dbworksFlag=`docker inspect --format '{{.State.Running}}' dataworks`
  if [ $dbworksFlag = "true" ];
  then
    docker rm -f dataworks
  fi
  matsuFlag=`docker inspect --format '{{.State.Running}}' matsu`
  if [ $matsuFlag = "true" ];
  then
    docker rm -f matsu
  fi
  meteorFlag=`docker inspect --format '{{.State.Running}}' meteor`
  if [ $meteorFlag = "true" ];
  then
    docker rm -f meteor
  fi
  tenmaFlag=`docker inspect --format '{{.State.Running}}' tenma`
  if [ $tenmaFlag = "true" ];
  then
    docker rm -f tenma
  fi
  poseidonFlag=`docker inspect --format '{{.State.Running}}' poseidon`
  if [ $poseidonFlag = "true" ];
  then
    docker rm -f poseidon
  fi
  dataopsFlag=`docker inspect --format '{{.State.Running}}' dataops`
  if [ $dataopsFlag = "true" ];
  then
    docker rm -f dataops
  fi
  authorityFlag=`docker inspect --format '{{.State.Running}}' authority`
  if [ $authority = "true" ];
  then 
    docker rm -f authority
  fi
  nginxFlag=`docker inspect --format '{{.State.Running}}'`
  if [ $nginxFlag = "true" ];
  then
    docker rm -f nginx
  fi  
  echo "docker rm container end" >>$log 
}
function clear(){
 echo "docker rm container start" >> $log
 docker rm -f databus
 docker rm -f dataworks
 docker rm -f matsu
 docker rm -f meteor
 docker rm -f tenma
 docker rm -f poseidon
 docker rm -f dataops
 docker rm -f authority
 docker rm -f nginx
 echo "docker rm container end" >>$log 
}

clear


# 创建docker中间件容器
function createMidContainer(){
echo "create middleware container start">>$log
docker run -d -p $nginxPort:$nginxPort --name nginx -v $ws/nginx/www:/www -v $ws/nginx/config/nginx.conf:/etc/nginx/nginx.conf nginx >>$log
echo "create middleware container end">>$log
}
createMidContainer
# 初始化脚本
function initSql(){
echo "init sql start">>$log
docker cp ${sql}/welab_authority_$curDate.sql mysql:/ >>$log
docker cp ${sql}/welab_skyeye_$curDate.sql mysql:/ >>$log
sleep 20
#docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_authority_20191206.sql' >>$log
docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_skyeye_20191206.sql' >>$log
echo "init sql end">>$log
}
#initSql

# 创建后台服务docker容器
function createBackContainer(){ 
echo "create backgroup container start">>$log

docker run -d --name authority -p $((serverPort+1)):$((serverPort+1)) -p $((managePort+1)):$((managePort+1)) -p $((dubboPort+1)):$((dubboPort+1)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-authority/welab-authority-"$version".jar >>$log

sleep 60
 
docker run -d --name poseidon -p $((serverPort+7)):$((serverPort+7)) -p $((managePort+7)):$((managePort+7)) -p $((dubboPort+7)):$((dubboPort+7)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-poseidon/welab-skyscanner-poseidon-"$version".jar >>$log
                                                                                                                                    
docker run -d --name dataworks -p $((serverPort+3)):$((serverPort+3)) -p $((managePort+3)):$((managePort+3)) -p $((dubboPort+3)):$((dubboPort+3)) -v $ws/jar:/opt/welab  $hostList centos7-jdk java $apolloConfig  -jar /opt/welab/welab-skyscanner-dataworks/welab-skyscanner-dataworks-"$version".jar >>$log

docker run -d --name matsu -p $((serverPort+4)):$((serverPort+4)) -p $((managePort+4)):$((managePort+4)) -p $((dubboPort+4)):$((dubboPort+4)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-matsu/welab-skyscanner-matsu-"$version".jar >>$log

sleep 30

docker run -d --name tenma -p $((serverPort+6)):$((serverPort+6)) -p $((managePort+6)):$((managePort+6)) -p $((dubboPort+6)):$((dubboPort+6)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-tenma/welab-skyscanner-tenma-"$version".jar >>$log

docker run -d --name dataops -p $((serverPort+8)):$((serverPort+8)) -p $((managePort+8)):$((managePort+8)) -p $((dubboPort+8)):$((dubboPort+8)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-dataops/welab-skyscanner-dataops-"$version".jar >>$log

sleep 30
docker run -d --name databus -p $((serverPort+2)):$((serverPort+2)) -p $((managePort+2)):$((managePort+2)) -p $((dubboPort+2)):$((dubboPort+2)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig  -jar /opt/welab/welab-skyscanner-databus/welab-skyscanner-databus-"$version".jar >>$log

docker run -d --name meteor -p $((serverPort+5)):$((serverPort+5)) -p $((managePort+5)):$((managePort+5)) -p $((dubboPort+5)):$((dubboPort+5)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-meteor/welab-skyscanner-meteor-"$version".jar >>$log

echo "create backgroup container end">>$log
}
createBackContainer
echo "升级脚本已运行结束!"
