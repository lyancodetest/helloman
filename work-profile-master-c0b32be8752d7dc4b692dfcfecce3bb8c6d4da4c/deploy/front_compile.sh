#!/bin/bash
set -e
root=/data1/dick/qingluan/toB
ls_date=`date +%Y%m%d`
if [! -x "$ls_date"];
 then
    mkdir "$root/$ls_date"
 else
    rm -rf $root/$ls_date/front/*
fi
ws=$root/$ls_date/front
rm -rf $ws/*
mkdir -p $ws/dataface
mkdir -p $ws/target
log=$ws/log.txt
list="qingluan-web poseidon-web developer-web"
#list="poseidon-web"
cd $ws/dataface
for project in $list;
do
  folder=${project##*/}
  git="git@git.wolaidai.com:WelabCo/Architecture/"$project".git"
  echo $git
  git clone -b production --single-branch $git
  cd $folder
  npm cache clean -f
if [ "$project" = "developer-web" ]
 then 
   npm install @welab/arch-http @welab/arch-util --registry=http://npm.wolaidai.com:8080
 else
   echo "执行$project"
fi

if [ "$project" = "qingluan-web" ]
 then
   rm -rf $ws/dataface/qingluan-web/package-lock.json
else
  echo "==="
# npm install git+https://dick.liao:Ab147258@git.wolaidai.com/dataface/arch-util.git
#  npm install @welab/arch-http @welab/arch-util --registry=http://npm.wolaidai.com:8080
fi 

  npm install 
  npm run build:production:sea
#  npm run build:uat
  cp -r dist/dataface/* $ws/target/ 
  cd $ws/dataface
done
# compress file
cd $ws/target
tar -zcf qingluan_front.tar.gz *
#sudo -u yunwei sshpass -p Welab#2019 scp qingluan_front.tar.gz 10.0.0.4:/data/welab-paas/k8s/tmp/
