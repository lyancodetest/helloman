#!/bin/bash
#Author:Rafa.jiang
#Date:2019.05.16
#Description:本脚实现自动将PG实例导出的表结构定义脚本转换成MySQL语法的DDL脚本

#本脚本在PG实例的本机postgres用户执行
if [ "$USER" != "postgres" ];then
  echo "This script must run as postgres user,will exit......"
  exit 100
fi

#检查PG主机（ubuntu系统）是否安装了expect包
expect_installed=`dpkg -l |grep -i expect |wc -l`
if [ ${expect_installed} -eq 0 ];then
echo "expect not install,install it as dbadmin......"
su - dbadmin -c "sudo apt-get -y install expect"
fi



PSQL=$(which psql)
PGDUMP=$(which pg_dump)
dbname=`echo $1|tr [A-Z] [a-z]`
tabname=`echo $2 |tr [A-Z] [a-z]`

if [ ! -d /data/database/postgresql/pg2mysql ];then
   mkdir -p  /data/database/postgresql/pg2mysql
fi

DUMPDIR="/data/database/postgresql/pg2mysql"

get_pg_ddl(){
$PGDUMP $dbname -s -t $tabname >"$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql
}

get_mysql_ddl(){
#生成MySQL语法的建表语句
sed -n '/^CREATE TABLE/,/);/p' "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql |sed '0,/id integer/s/id integer/id bigint unsigned  auto_increment primary key/' |sed 's/integer/bigint/g;s/character(/char(/g;s/character varying/varchar/g;s/timestamp without time zone/timestamp(6)/g;s/::varchar/ /g;s/);/)engine=Innodb;/g'|sed '0,/now()/s/now()/CURRENT_TIMESTAMP(6)/;0,/now()/s/now()/CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)/' >"$DUMPDIR"/"$dbname"_"$tabname"_formysql.sql
#生成MySQL语法的添加字段comment语句
grep '^COMMENT ON COLUMN' "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql |sed 's/.*\.//g;s/IS.*//g'|while read col;do coltype=`grep -w "$col" "$DUMPDIR"/"$dbname"_"$tabname"_formysql.sql |awk '{print $2}'|sed 's/,//g'`;grep "^COMMENT ON COLUMN.*\.$col" "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql |sed 's/COMMENT ON COLUMN/alter table/g;s/\./ modify column /g;s/IS/'"$coltype"' comment/g' >>"$DUMPDIR"/comment_"$dbname"_"$tabname"_formysql.sql;done
#生产MySQL语法的添加表comment语句
grep '^COMMENT ON TABLE' "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql |sed 's/.*'"$tabname"'/alter table '"$tabname"' /g;s/IS/comment/g' >>"$DUMPDIR"/comment_"$dbname"_"$tabname"_formysql.sql
#生成创建MySQL语法的建索引语句
egrep '^CREATE INDEX|CREATE UNIQUE INDEX' "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql|grep "USING btree" |sed 's/[[:space:]]USING btree[[:space:]]//g' >"$DUMPDIR"/index_"$dbname"_"$tabname"_formysql.sql
#生成对表授权的语句
egrep '^REVOKE|^GRANT' "$DUMPDIR"/"$dbname"_"$tabname"_forpg.sql |grep -v SEQUENCE >"$DUMPDIR"/grant_"$dbname"_"$tabname"_formysql.sql
}

dump_pg_data(){
#将表数据以csv格式导出到$DUMPDIR路径下
nohup $PSQL -d $dbname -c "copy $tabname to '"$DUMPDIR"/"$dbname"_"$tabname".csv' with csv" &
}

copy_dump(){
#将$DUMPDIR路径下导出的文件拷贝到172.20.40.62这台机主机的/data/pg2mysql下
./copy.sh 
}



get_pg_ddl
get_mysql_ddl
dump_pg_data
copy_dump
