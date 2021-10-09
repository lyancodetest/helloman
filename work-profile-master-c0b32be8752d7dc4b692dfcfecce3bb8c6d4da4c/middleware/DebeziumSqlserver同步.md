
#### sqlserver环境搭建

```
docker run -it -d --name sqlserver -p 1433:1433 -e ACCEPT_EULA=Y -e MSSQL_PID=Standard -e SA_PASSWORD=Middleware2020 -e MSSQL_AGENT_ENABLED=true  microsoft/mssql-server-linux:2017-CU9-GDR2
```

#### 创建测试表

```
CREATE TABLE customers (
  id INTEGER IDENTITY(1001,1) NOT NULL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);
```

#### 开启CDC

```sqlserver
CREATE DATABASE test_db;
-- 启用数据库cdc
USE test_db;
GO
EXEC sys.sp_cdc_enable_db;
-- 查看哪些数据库启用了CDC功能
select * from sys.databases where is_cdc_enabled = 1;
-- 查看表是否启用了CDC
select name, is_tracked_by_cdc from sys.tables where object_id = OBJECT_ID('dbo.customers');
-- 启用表cdc，例如表名为”dbo.customers”
EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'customers', @role_name = null;
-- 根据系统表批量生成表
select 'EXEC sys.sp_cdc_enable_table @source_schema = ''dbo'', @source_name = '''+name+''', @role_name = null;'
from sysobjects where xtype='U' and category ='0';
```


#### 组件配置

一、启动docker容器

```
export IPADDR=$(ifconfig eth0 | grep -oP '\d.+(?=  (Bcast:|netmask))')
docker run -d --name connect1 -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=_connect_configs -e OFFSET_STORAGE_TOPIC=_connect_offsets -e BOOTSTRAP_SERVERS=${IPADDR}:9092 -v /data/logs/connect:/kafka/logs debezium/connect:1.0
```

二、 创建任务
```
快照任务
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:18083/connectors/ -d '
{
  "name": "sqlserver_connector_060302",
  "config": {
    "connector.class": "io.debezium.connector.sqlserver.SqlServerConnector",
    "database.hostname": "10.3.0.252",
    "database.port": "50664",
    "database.user": "sa",
    "database.password": "Middleware2020",
    "database.dbname": "test_db",
    "database.server.name": "testdb_060302",
    "table.whitelist": "dbo.customers",
    "database.history.kafka.bootstrap.servers": "10.2.0.15:19092,10.2.0.15:19093,10.2.0.15:19094",
    "database.history.kafka.topic": "dbhistory.testdb_060302",
	"snapshot.mode":"initial"
  }
}'
增量任务
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:18083/connectors/ -d '
{
  "name": "sqlserver_connector_incr_060302",
  "config": {
    "connector.class": "io.debezium.connector.sqlserver.SqlServerConnector",
    "database.hostname": "10.3.0.252",
    "database.port": "50664",
    "database.user": "sa",
    "database.password": "Middleware2020",
    "database.dbname": "test_db",
    "database.server.name": "testdb_060302",
    "table.whitelist": "dbo.customers",
    "database.history.kafka.bootstrap.servers": "10.2.0.15:19092,10.2.0.15:19093,10.2.0.15:19094",
    "database.history.kafka.topic": "dbhistory.testdb_060302",
	"snapshot.mode":"schema_only"
  }
}'
```

