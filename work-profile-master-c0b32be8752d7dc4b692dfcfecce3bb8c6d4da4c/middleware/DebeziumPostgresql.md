
#### postgresql环境搭建

```
git clone https://github.com/debezium/docker-images.git
cd docker-images/postgres/9.6
docker build -t debezium/postgresql:LATEST .
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=Middleware2019 -e POSTGRES_USER=postgres -e POSTGRES_DB=test debezium/postgresql:LATEST

```

创建测试表

```
CREATE TABLE users
 (
 id SERIAL primary key ,
 name character varying,
 password character varying
 );

create or replace function cud() returns void as $$
DECLARE i INTEGER ;
begin
		truncate table users;
		FOR i IN 1..5 LOOP
			INSERT INTO users (name, password) VALUES (i, i);
		end loop;
		FOR i IN 1..5 LOOP
			update users set password='reset' where name=CAST (i AS text);
		end loop;
		FOR i IN 1..5 LOOP
			delete from users where name=CAST (i AS text);
		end loop;
end;
$$ language plpgsql;

select cud();
```

#### 组件配置

一、启动docker容器

```
export IPADDR=$(ifconfig eth0 | grep -oP '\d.+(?=  (Bcast:|netmask))')
docker run -d --name connect1 -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=_connect_configs -e OFFSET_STORAGE_TOPIC=_connect_offsets -e BOOTSTRAP_SERVERS=${IPADDR}:9092 -v /data/logs/connect:/kafka/logs debezium/connect:0.9
```

二、 创建任务
#提交一个postgresql connector任务 TODO

```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '
{
  "name": "connector-pg-document",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "database.hostname": "10.2.0.13", 
    "database.port": "5432", 
    "database.user": "postgres",
    "database.password": "Middleware2019",
    "database.dbname":"test",
    "database.server.name":"jrocket",
    "snapshot.mode":"never"
  }
}
'
