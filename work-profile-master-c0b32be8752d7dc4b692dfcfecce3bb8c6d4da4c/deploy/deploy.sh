#!/bin/bash
set -e
ws=`cd $(dirname $0);pwd -P`
rm -rf $ws/log.txt
log=$ws/log.txt
sql=$ws/mysql/sql
source $ws/config.txt
#kafkaUrl=192.168.36.91:9092
#hostList="--add-host namenode.kuangheng.com:192.168.36.91 --add-host datanode1.kuangheng.com:192.168.36.92 --add-host datanode2.kuangheng.com:192.168.36.93 "
#repSqlUrl=101.254.185.134:80
echo "正在运行脚本大概需要1-2分钟，请耐心等待...."
# 清除所有运行的容器和镜像
function clear(){
echo "docker rm all container start" >> $log
cList=$(docker ps -a -q) >>$log
if [ "$cList" = "" ]
then
  echo "docker container on run!">>$log
else  
  for container in $cList;
  do
   docker rm -f $container >>$log
  done
fi
echo "docker rm all images start" >>$log
iList=$(docker image ls -a -q)>>$log
if [ "$iList" = "" ]
then
  echo "docker images no run !">>$log
else
  for img in $iList;
  do
   docker image rm -f $img>>$log
  done
fi
}
#clear
#sh $ws/rollback.sh
# 加载镜像文件到本地docker
function loadImage(){
echo "load images start" >> $log
docker load -i $ws/images/centos7-jdk.tar >>$log

docker load -i $ws/images/connect.tar >>$log

docker load -i $ws/images/mysql.tar >>$log

docker load -i $ws/images/nginx.tar >>$log

docker load -i $ws/images/redis-cluster.tar >>$log
echo "load images end" >> $log
}
loadImage
# 创建docker中间件容器
function createMidContainer(){
echo "create middleware container start">>$log
docker run -d -p $dbPort:$dbPort --name mysql -e MYSQL_ROOT_PASSWORD=123456 -v $ws/mysql/conf/my.cnf:/etc/mysql/my.cnf mysql:5.7  >>$log

docker run -d -p $nginxPort:$nginxPort --name nginx -v $ws/nginx/www:/www -v $ws/nginx/config/nginx.conf:/etc/nginx/nginx.conf nginx >>$log

docker run -d -p 7083:8083 --name connect ${hostList} -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=_connect_configs -e OFFSET_STORAGE_TOPIC=_connect_offsets -e BOOTSTRAP_SERVERS=$kafkaUrl -e HOST_NAME=0.0.0.0 debezium/connect:0.9 >>$log

docker run -d --name redis-cluster -p 8001-8003:8001-8003  -v /data/database/redis_cluster:/data/redis_cluster  -e REDIS_PASS="devappwsx" -e REDIS_PORT="8001" -e SERVICE_PORT=8001 -e REDIS_CLUSTER_NODES=3 ali-dev.registry.wolaidai.co/base/redis-3.2.13-cluster:1.0 --auth --max-memory=1gb >>$log
echo "create middleware container end">>$log
}
createMidContainer
# 初始化脚本
function initSql(){
echo "init sql start">>$log
docker cp ${sql}/welab_skyeye_ddl.sql mysql:/ >>$log
docker cp ${sql}/welab_skyeye_init.sql mysql:/ >>$log
docker cp ${sql}/welab_authority_ddl.sql mysql:/ >>$log
sed -i "s/https:\/\/saas-dev.wolaidai.com/http:\/\/$repSqlUrl/g" ${sql}/welab_authority_init.sql
docker cp ${sql}/welab_authority_init.sql mysql:/ >>$log
sleep 20
docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_authority_ddl.sql' >>$log
docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_authority_init.sql' >>$log
docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_skyeye_ddl.sql' >>$log
docker exec -i mysql /bin/bash -c 'mysql -uroot -p123456 < /welab_skyeye_init.sql' >>$log
echo "init sql end">>$log
}
initSql

# 创建后台服务docker容器
function createBackContainer(){ 
echo "create backgroup container start">>$log
docker run -d --name simple-stub -p 5001:5001  -v $ws/images/welab-stub-1.0-SNAPSHOT.jar:/opt/welab $hostList  centos7-jdk java -jar /opt/welab/welab-stub-1.0-SNAPSHOT.jar >>$log

docker run -d --name authority -p $((serverPort+1)):$((serverPort+1)) -p $((managePort+1)):$((managePort+1)) -p $((dubboPort+1)):$((dubboPort+1)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-authority/welab-authority-"$version".jar >>$log
sleep 30
docker run -d --name databus -p $((serverPort+2)):$((serverPort+2)) -p $((managePort+2)):$((managePort+2)) -p $((dubboPort+2)):$((dubboPort+2)) -v $ws/jar:/opt/welab  $hostList  centos7-jdk java $apolloConfig  -jar /opt/welab/welab-skyscanner-databus/welab-skyscanner-databus-"$version".jar >>$log

docker run -d --name dataworks -p $((serverPort+3)):$((serverPort+3)) -p $((managePort+3)):$((managePort+3)) -p $((dubboPort+3)):$((dubboPort+3)) -v $ws/jar:/opt/welab  $hostList centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-dataworks/welab-skyscanner-dataworks-"$version".jar >>$log

docker run -d --name matsu -p $((serverPort+4)):$((serverPort+4)) -p $((managePort+4)):$((managePort+4)) -p $((dubboPort+4)):$((dubboPort+4)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-matsu/welab-skyscanner-matsu-"$version".jar >>$log

docker run -d --name meteor -p $((serverPort+5)):$((serverPort+5)) -p $((managePort+5)):$((managePort+5)) -p $((dubboPort+5)):$((dubboPort+5)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-meteor/welab-skyscanner-meteor-"$version".jar >>$log

docker run -d --name tenma -p $((serverPort+6)):$((serverPort+6)) -p $((managePort+6)):$((managePort+6)) -p $((dubboPort+6)):$((dubboPort+6)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-tenma/welab-skyscanner-tenma-"$version".jar >>$log

docker run -d --name poseidon -p $((serverPort+7)):$((serverPort+7)) -p $((managePort+7)):$((managePort+7)) -p $((dubboPort+7)):$((dubboPort+7)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-poseidon/welab-skyscanner-poseidon-"$version".jar >>$log

docker run -d --name dataops -p $((serverPort+8)):$((serverPort+8)) -p $((managePort+8)):$((managePort+8)) -p $((dubboPort+8)):$((dubboPort+8)) -v $ws/jar:/opt/welab $hostList  centos7-jdk java $apolloConfig -jar /opt/welab/welab-skyscanner-dataops/welab-skyscanner-dataops-"$version".jar >>$log                                                                                                                                   
echo "create backgroup container end">>$log
}
#createBackContainer
echo "脚本已运行结束!"
