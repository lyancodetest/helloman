#!/bin/bash
set -e
root=/data1/dick/qingluan/toB/
ls_date=`date +%Y%m%d`
if [! -x "$ls_date"];
 then
   mkdir "$root/$ls_date"
 else
   rm -rf $root/$ls_date/background/*
fi
ws="$root/$ls_date/background"
rm -rf $ws/src/*
rm -rf $ws/target/*
rm -rf docker.txt
mkdir -p $ws/src
mkdir -p $ws/target
docker=$ws/docker.txt
list="saas/welab-authority Architecture/welab-skyscanner-databus Architecture/welab-skyscanner-dataworks Architecture/welab-skyscanner-matsu Architecture/welab-skyscanner-meteor Architecture/welab-skyscanner-tenma  Architecture/welab-skyscanner-poseidon  Architecture/welab-skyscanner-dataops"
#list="Architecture/welab-skyscanner-meteor"
cd $ws/src
serverPort=8081
managePort=9091
dubboPort=20881
addvalue=0
localUrl=10.8.221.69
dbLinkUrl=10.8.221.69:3306
dbUser=root
dbPwd=123456
redisAdr=10.8.221.69:8001,10.8.221.69:8002,10.8.221.69:8003
zkUrl=10.8.221.69:2181
hadoopUrl=10.8.221.69:9092,10.8.221.61:9092,10.8.220.143:9092
connectUrl=10.8.221.69:7083
kuduIp=10.8.221.69
zkQm=10.8.221.69,10.8.221.69,10.8.221.69
impalaUrl=10.8.221.69:21050,10.8.221.61:21050,10.8.220.143:21050
privacyUrl=10.8.221.69:5001
jarVersion=3.0.0-RELEASE
for project in $list;
do
  addvalue=$((addvalue+1))
  folder=${project##*/}
  git="git@git.wolaidai.com:WelabCo/"$project".git"
  echo $git
  git clone -b production --single-branch $git
  cd $folder
  # replace properties
  prop=`find ./ | grep resources/server.properties`
  
  sed -i "s/jdbc:mysql:\/\/10.1.0.120:3306\/welab_authority/jdbc:mysql:\/\/${dbLinkUrl}\/welab_authority/g" $prop
  sed -i "s/jdbc:mysql:\/\/10.1.0.23:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
  sed -i "s/jdbc:mysql:\/\/10.1.0.122:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
  sed -i "s/jdbc:mysql:\/\/10.1.0.120:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
  sed -i "s/jdbc.username=.\+/jdbc.username=${dbUser}/g" $prop
  sed -i "s/jdbc.qingluan.username=.\+/jdbc.qingluan.username=${dbUser}/g" $prop
  sed -i "s/jdbc.password=.\+/jdbc.password=${dbPwd}/g" $prop
  sed -i "s/jdbc.qingluan.password=.\+/jdbc.qingluan.password=${dbPwd}/g" $prop


  sed -i "s/druid.datasource.username=.\+/druid.datasource.username=${dbUser}/g" $prop
  sed -i "s/druid.datasource.password=.\+/druid.datasource.password=${dbPwd}/g" $prop

  sed -i "s/kafka.zookeeper.url=.\+/kafka.zookeeper.url=${zkUrl}/g" $prop
#  sed -i "s/^kafka.zookeeper.url=hadoop2:2181\/kafka1/kafka.zookeeper.url=${zkUrl}\/kafka/g" $prop
  sed -i "s/^zookeeper.url=.\+/zookeeper.url=${zkUrl}/g" $prop
  
  sed -i 's/user.token.interceptor=.\+/user.token.interceptor=true/g' $prop
  sed -i "s/user.url.interceptor=.\+/user.url.interceptor=false/g" $prop

  sed -i "s/redis.address=.\+/redis.address=${redisAdr}/g" $prop
  
  sed -i "s/https:\/\/saas-dev.wolaidai.com/http:\/\/101.254.185.134/g" $prop

  sed -i "s/hadoop2:9092,hadoop3:9092,hadoop4:9092/${hadoopUrl}/g" $prop
  sed -i "s/http:\/\/10.2.0.15:8083\/connectors\//http:\/\/${connectUrl}\/connectors\//g" $prop
  sed -i "s/kafka.source.snapshot.topic.addr=.\+/kafka.source.snapshot.topic.addr=${hadoopUrl}/g" $prop
#  sed -i "s/kafka.connect.url=http:\/\/10.2.0.15:8083\/connectors\//kafka.connect.url=http:\/\/${connectUrl}\/connectors\//g" $prop
  sed -i "s/kafka.source.event.topic=http_event_new/kafka.source.event.topic=http_event/g" $prop
  sed -i "s/10.2.0.213:21050,10.2.0.214:21050,10.2.0.215:21050/${impalaUrl}/g" $prop
  sed -i "s/kudu.master=hadoop2/kudu.master=${kuduIp}/g" $prop
  sed -i "s/hbase.zookeeper.quorum=.\+/hbase.zookeeper.quorum=${zkQm}/g" $prop
  sed -i "s/d:\/tmp\/kafka-streams/\/tmp\/kafka-streams/g" $prop
  sed -i "s/kudu_test/kudu_analysis/g" $prop
  sed -i "s/welab.privacy.root.url=.\+/welab.privacy.root.url=http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/welab.privacy.sensitivity.url=.\+/welab.privacy.sensitivity.url=http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/http:\/\/japi-fat.wolaidai.com\/privacy\/api\/simple\/column-configs/http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/https:\/\/japi-fat.wolaidai.com\/privacy\/api\/v2\/config-info/http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/http:\/\/japi-dev.wolaidai.com\/privacy\/api\/simple\/column-configs/http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/https:\/\/japi-dev.wolaidai.com\/privacy\/api\/v2\/config-info/http:\/\/${privacyUrl}\/welab-stub\/success/g" $prop
  sed -i "s/localhost/${localUrl}/g" $prop
  sed -i "s/x.user.token.name=.\+/x.user.token.name=pro-saas-x-user-token/g" $prop
  sed -i "s/sa.url=.\+/sa.url=http:\/\/${privacyUrl}\/welab-stub\/sa/g" $prop
  # replace port
  prop=`find ./ | grep resources/application.properties`
  sed -i "s/server.port.\+/server.port=$((serverPort+addvalue))/g" $prop
  if [ "$project" = "saas/welab-authority" ]
    then
       sed -i "s/management.port.\+/management.port=$((managePort))/g" $prop
    else   
       sed -i "s/management.port.\+/management.port=$((managePort+addvalue))/g" $prop
  fi     
  prop=`find ./ | grep dubbo-provider.xml`
  sed -i "s/20880/$((dubboPort+addvalue))/g" $prop
  

  #天马特殊处理
  if [ "$project" = "Architecture/welab-skyscanner-tenma" ]
    then
      prop=`find ./|grep resources/alarm.properties`
      sed -i "s/alarm.kafka.servers=.\+/alarm.kafka.servers=${hadoopUrl}/g" $prop
      prop=`find ./|grep resources/zookeeper.properties`
      sed -i "s/zookeeper.url=.\+/zookeeper.url=${zkUrl}/g" $prop
      prop=`find ./|grep resources/dao/data_source.properties`
      sed -i "s/jdbc:mysql:\/\/10.1.0.23:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
      sed -i "s/jdbc:mysql:\/\/10.1.0.122:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
      sed -i "s/jdbc:mysql:\/\/10.1.0.120:3306/jdbc:mysql:\/\/${dbLinkUrl}/g" $prop
    else
      echo "执行$project"
  fi 
  sh assembly/scripts/install.sh
  mkdir $ws/target/$folder
  
  jar=`find target | grep jar`
  jar=${jar##*/}
  
  # rafactor springboot jar for remove welab-privacy
  cd target 
#  jar -xvf $jar
#  rm -rf $jar
#  find BOOT-INF/lib | grep welab-privacy | xargs rm -f
#  jar -cvf0m $jar ./META-INF/MANIFEST.MF ./
  ls | grep -v *jar | xargs rm -rf
  cp *.jar $ws/target/$folder
  
  echo "docker run -d --name $folder -p $((serverPort+addvalue)):$((serverPort+addvalue)) -p $((managePort+addvalue)):$((managePort+addvalue)) -p $((dubboPort+addvalue)):$((dubboPort+addvalue)) -v /root/welab/jar:/opt/welab --add-host 10.200.2.79:10.200.2.79 centos7-jdk java -jar /opt/welab/$folder/$jar" >> $docker 
  cd $ws/src
done
# compress file
cd $ws/target
mv welab-authority/welab-authority-*.jar welab-authority/welab-authority-${jarVersion}.jar
mv welab-skyscanner-databus/welab-skyscanner-databus-*.jar welab-skyscanner-databus/welab-skyscanner-databus-${jarVersion}.jar
mv welab-skyscanner-dataworks/welab-skyscanner-dataworks-*.jar welab-skyscanner-dataworks/welab-skyscanner-dataworks-${jarVersion}.jar
mv welab-skyscanner-matsu/welab-skyscanner-matsu-*.jar welab-skyscanner-matsu/welab-skyscanner-matsu-${jarVersion}.jar
mv welab-skyscanner-meteor/welab-skyscanner-meteor-*.jar welab-skyscanner-meteor/welab-skyscanner-meteor-${jarVersion}.jar
mv welab-skyscanner-tenma/welab-skyscanner-tenma-*.jar welab-skyscanner-tenma/welab-skyscanner-tenma-${jarVersion}.jar
mv welab-skyscanner-poseidon/welab-skyscanner-poseidon-*.jar welab-skyscanner-poseidon/welab-skyscanner-poseidon-${jarVersion}.jar
mv welab-skyscanner-dataops/welab-skyscanner-dataops-*.jar welab-skyscanner-dataops/welab-skyscanner-dataops-${jarVersion}.jar
tar -zcf qingluan_dg_back.tar.gz welab*
#sudo -u yunwei sshpass -p Welab#2019 scp qingluan_dg_back.tar.gz 10.0.0.4:/data/welab-paas/k8s/tmp/
