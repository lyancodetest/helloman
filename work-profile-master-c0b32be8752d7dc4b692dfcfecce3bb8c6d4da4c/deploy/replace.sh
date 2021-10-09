#!/bin/bash
set e
ws=`cd $(dirname $0);pwd -P`
bDir=$ws/backup
jDir=$ws/jar
fDir=$ws/nginx/www/dataface
ls_date=`date +%Y%m%d`
if [! -x "$ls_date"];
 then
  mkdir "$bDir/$ls_date"
 else
  rm -rf $bDir/$ls_date/*
fi
bPath=$bDir/$ls_date
cp -rf $jDir/* $bPath/
rm -rf $jDir/*
cd $jDir/
curl -O http://120.78.247.193:88/k8s/tmp/qingluan_back.tar.gz
tar xvf qingluan_back.tar.gz
rm -rf qingluan_back.tar.gz

cp -rf $fDir/ $bPath/
rm -rf $fDir/*
cd $fDir/
curl -O http://120.78.247.193:88/k8s/tmp/qingluan_front.tar.gz
tar xvf qingluan_front.tar.gz
rm -rf qingluan_front.tar.gz
