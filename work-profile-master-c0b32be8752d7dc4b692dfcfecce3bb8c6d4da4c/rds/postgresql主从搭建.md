# postgresql主从搭建

## 一、下载pg docker镜像

    docker pull postgres:9.6

## 二、运行容器

在宿主机下面创建/opt/data/postgresql目录，并创建master、slave1和slave2作为pg的数据目录，脚本如下：

    mkdir -p /opt/data/postgresql
    cd /opt/data/postgresql
    rm -rf /opt/data/postgresql/*
    mkdir master slave1 slave2

依次创建一主两从容器：

    docker run -d --name postgres-master -p 5432:5432 -e POSTGRES_PASSWORD=Middleware2019 -e POSTGRES_USER=postgres -e POSTGRES_DB=test -v /opt/data/postgresql/master:/var/lib/postgresql/data postgres:9.6
    docker run -d --name postgres-slave1 -p 5433:5432 -e POSTGRES_PASSWORD=Middleware2019 -e POSTGRES_USER=postgres -e POSTGRES_DB=test -v /opt/data/postgresql/slave1:/var/lib/postgresql/data postgres:9.6
    docker run -d --name postgres-slave2 -p 5434:5432 -e POSTGRES_PASSWORD=Middleware2019 -e POSTGRES_USER=postgres -e POSTGRES_DB=test -v /opt/data/postgresql/slave2:/var/lib/postgresql/data postgres:9.6

完成后docker ps可以看到三个运行中的容器，可以使用pg客户端访问宿主机的5432、5433、5434分别对应主节点和从节点  
![](img/pg_docker_ps.png)

## 三、主库上创建角色

使用docker命令进行主库容器，并创建一个具体复制角色的用户replica
    
	docker exec -i postgres-master /bin/bash << DOCKER
	psql -h 127.0.0.1 -p 5432 -U postgres  << EOF
	CREATE ROLE replica login replication encrypted password 'Middleware2019';
	EOF
	DOCKER
    
注psql还可以使用url形式访问“psql postgresql://replica:Middleware2019@127.0.0.1:5432/test”

## 四、主库配置文件

在宿主机上进入主库配置文件目录(/opt/data/postgresql/master)：
	
	cd /opt/data/postgresql/master

修改postgresql.conf文件以下键值：  

wal\_level = hot_standby  
max\_wal\_senders = 10  
wal\_keep\_segments = 32  
wal\_sender\_timeout = 60s  
	
	sed -i 's/#wal_level = minimal/wal_level = hot_standby/g' postgresql.conf
	sed -i 's/#max_wal_senders = 0/max_wal_senders = 2/g' postgresql.conf
	sed -i 's/#wal_keep_segments = 0/wal_keep_segments = 32/g' postgresql.conf
	sed -i 's/#wal_sender_timeout = 60s/wal_sender_timeout = 60s/g' postgresql.conf

修改pg_hba.conf文件，指定replica登录网络，其中172.17.0.1是指docker0网桥的ip:  
	
	cat >> pg_hba.conf << EOF 
	host   replication  replica   all   trust
	EOF
	
完成后使用重启容器让配置生效:  

	docker restart postgres-master

## 五、从库配置文件

先停止两个从库容器:  

	docker stop postgres-slave1
	docker stop postgres-slave2

(1)方法一：直接将主库数据文件拷到从库上:  
	
	cd /opt/data/postgresql/slave1
	rm -rf /opt/data/postgresql/slave1/*
	cp -rf /opt/data/postgresql/master/* /opt/data/postgresql/slave1

(2)方法二：进入从节点容器中执行pg_basebackup命令进行数据文件拷贝(此过程需要容器是运行中的，所以比较麻烦):  

	mkdir -p /data/postgres
	pg_basebackup -F p --progress -D /data/postgres -h 10.2.0.13 -p 5432 -U replica --password
	rm -rf /var/lib/postgresql/data/*
	cp -rf /data/postgres/* /var/lib/postgresql/data/


在slave1目录下面创建recovery.conf文件，host值为宿主机ip:  

	cat > recovery.conf << EOF 
	standby_mode = on
	primary_conninfo = 'host=10.2.0.13 port=5432 user=replica password=replica'
	recovery_target_timeline = 'latest'
	trigger_file = '/var/lib/postgresql/data/trigger_activestb'
	EOF

修改postgresql.conf文件，其中hot_standby是从库开启查询时使用：

	cat > postgresql.conf << EOF 
	listen_addresses = '*'
	port = 5432
	wal_level = minimal
	max_wal_senders = 0
	wal_keep_segments = 0
	max_connections = 1000
	synchronous_commit = off
	synchronous_standby_names = ''
	hot_standby = on
	max_standby_streaming_delay = 30
	wal_receiver_status_interval = 1s
	hot_standby_feedback = on
	EOF

将slave1配置文件拷贝至slave2数据目录中：

	rm -rf /opt/data/postgresql/slave2/*
	cp -rf /opt/data/postgresql/slave1/* /opt/data/postgresql/slave2

完成后启动：

	docker start postgres-slave1
	docker start postgres-slave2
	
## 六、主从测试

(1)查看从库启动日志会看到进入“standby mode”模式

	docker logs postgres-slave1

![](img/pg_slave_log.png)	

(2)使用客户端或命令行进行pg主节点，创建表并新增数据，两个从节点都能看到该数据
	
	
