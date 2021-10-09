
#### mysql环境搭建

```
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Middleware2019 -d mysql:5.7

docker exec -i mysql /bin/bash << DOCKER
cat >> /etc/mysql/my.cnf << EOF
[mysqld]
server-id=100  
log-bin=mysql-bin
binlog_format=row
binlog_row_image=full
expire_logs_days=10
gtid_mode=ON
enforce_gtid_consistency=ON
EOF
mysql -uroot -pMiddleware2019 mysql << EOF
CREATE USER 'debezium'@'%' IDENTIFIED BY '123456';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium'@'%';
EOF
DOCKER

docker restart mysql
```

创建测试表

```
CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE IF NOT EXISTS users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(20) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

delimiter ;;
 create procedure cud()
 begin
   declare i int;
   set i=1;
   while(i<=5)do
 	INSERT INTO users (name, password) VALUES (i, i);
     set i=i+1;
   end while;
   set i=1;
   while(i<=5)do
 	update users set password='reset' where name=i;
     set i=i+1;
   end while;
   set i=1;
   while(i<=5)do
 	delete from users where name=i;
     set i=i+1;
   end while; 
 end;;
delimiter ;
call cud();

```

#### 组件配置

一、启动docker容器

```
export IPADDR=$(ifconfig eth0 | grep -oP '\d.+(?=  (Bcast:|netmask))')
docker run -d --name connect1 -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=_connect_configs -e OFFSET_STORAGE_TOPIC=_connect_offsets -e BOOTSTRAP_SERVERS=${IPADDR}:9092 -v /data/logs/connect:/kafka/logs debezium/connect:0.9
```

二、 创建任务
#提交一个mysql connector任务

```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '
{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.hostname": "10.2.0.13", 
    "database.port": "3306", 
    "database.user": "root",
    "database.password": "Middleware2019",
    "database.server.id": "184054",
    "database.server.name": "document",
    "database.whitelist": "auto",
    "database.history.kafka.bootstrap.servers": "10.2.0.13:9092",
    "database.history.kafka.topic": "dbhistory.auto",
    "include.schema.changes": "true" 
  }
}
'
```

三、指定bin日志拉取

组件使用mysql-binlog-connector-java-0.13.0.jar原生的api如下，可以指定任务位置拉取日志
// 只允许从正常的位点开始读取
client.setBinlogFilename("mysql-bin.000002");
client.setBinlogPosition(672826082);

根据以下原理在测试环境进行验证，新建个connector任务，会拉取测试表5条记录，bin位置至672828513(第9个offset)，然后手工发送将第5个offset消息至_connect_offsets topic，在对应的数据topic里面又新看到5条消息，第11个off中位置又回到672828513。证实可以重复拉取消息。

注意：_connect_offsets第5个offset与第10个offset消息一致，第9个offset与第11个offset消息一致.

```
_connect_offsets partition = 5, offset = 6
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"file":"mysql-bin.000002","pos":672827416,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164905"}
_connect_offsets partition = 5, offset = 7
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"ts_sec":1567681437,"file":"mysql-bin.000002","pos":672827738,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164906","row":1,"server_id":100,"event":2}
_connect_offsets partition = 5, offset = 8
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"ts_sec":1567681776,"file":"mysql-bin.000002","pos":672828250,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164908","row":1,"server_id":100,"event":2}
_connect_offsets partition = 5, offset = 9
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"ts_sec":1567681864,"file":"mysql-bin.000002","pos":672828513,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164909","row":1,"server_id":100,"event":2}
_connect_offsets partition = 5, offset = 10
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"file":"mysql-bin.000002","pos":672827416,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164905"}
_connect_offsets partition = 5, offset = 11
headers = RecordHeaders(headers = [], isReadOnly = false)
key = ["inventory-connector",{"server":"document"}]
value = {"ts_sec":1567681864,"file":"mysql-bin.000002","pos":672828513,"gtids":"2122b87b-9282-11e9-99c5-0242ac110002:1-164909","row":1,"server_id":100,"event":2}
```
注意：数据topic前五条的gtid与后五条一致

```
"payload":{"before":null,"after":{"id":1,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681397,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164906","file":"mysql-bin.000002","pos":672827600,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567681397848}}
"payload":{"before":null,"after":{"id":2,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681437,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164907","file":"mysql-bin.000002","pos":672827857,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567681437525}}
"payload":{"before":null,"after":{"id":3,"name":null},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681775,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164908","file":"mysql-bin.000002","pos":672828114,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567681775480}}
"payload":{"before":{"id":3,"name":null},"after":{"id":3,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681776,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164909","file":"mysql-bin.000002","pos":672828369,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"u","ts_ms":1567681776599}}
"payload":{"before":null,"after":{"id":4,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681864,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164910","file":"mysql-bin.000002","pos":672828632,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567681864264}}
"payload":{"before":null,"after":{"id":1,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681397,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164906","file":"mysql-bin.000002","pos":672827600,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567730895028}}
"payload":{"before":null,"after":{"id":2,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681437,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164907","file":"mysql-bin.000002","pos":672827857,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567730895032}}
"payload":{"before":null,"after":{"id":3,"name":null},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681775,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164908","file":"mysql-bin.000002","pos":672828114,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567730895033}}
"payload":{"before":{"id":3,"name":null},"after":{"id":3,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681776,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164909","file":"mysql-bin.000002","pos":672828369,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"u","ts_ms":1567730895035}}
"payload":{"before":null,"after":{"id":4,"name":"s"},"source":{"version":"0.8.3.Final","name":"document","server_id":100,"ts_sec":1567681864,"gtid":"2122b87b-9282-11e9-99c5-0242ac110002:164910","file":"mysql-bin.000002","pos":672828632,"row":0,"snapshot":false,"thread":14454,"db":"auto","table":"a","query":null},"op":"c","ts_ms":1567730895035}}
```
