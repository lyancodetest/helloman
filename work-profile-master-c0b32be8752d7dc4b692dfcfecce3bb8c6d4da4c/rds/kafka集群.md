## kafka集群搭建

#### zookeeper And kafka

```
export IPADDR=$(ifconfig eth0 | grep -oP '\d.+(?=  (Bcast:|netmask))')
docker run -d --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 debezium/zookeeper:0.8
docker run -d --name kafka1 -p 9092:9092 -e ADVERTISED_HOST_NAME=${IPADDR} -e ADVERTISED_PORT=9092 -e BROKER_ID=1 -e ZOOKEEPER_CONNECT=${IPADDR}:2181 debezium/kafka:0.8
docker run -d --name kafka2 -p 9093:9092 -e ADVERTISED_HOST_NAME=${IPADDR} -e ADVERTISED_PORT=9093 -e BROKER_ID=2 -e ZOOKEEPER_CONNECT=${IPADDR}:2181 debezium/kafka:0.8
docker run -d --name kafka3 -p 9094:9092 -e ADVERTISED_HOST_NAME=${IPADDR} -e ADVERTISED_PORT=9094 -e BROKER_ID=3 -e ZOOKEEPER_CONNECT=${IPADDR}:2181 debezium/kafka:0.8
```

#### Using

```
docker run -d --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=_connect_configs -e OFFSET_STORAGE_TOPIC=_connect_offsets -e BOOTSTRAP_SERVERS=${IPADDR}:9092,${IPADDR}:9093,${IPADDR}:9094 debezium/connect:0.8
bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --describe --topic xxx.public.users
```

