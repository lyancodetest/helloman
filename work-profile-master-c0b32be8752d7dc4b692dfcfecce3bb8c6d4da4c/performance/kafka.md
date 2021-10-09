## 阿里云线上环境参数
kafka是单分区，双副本

## 下载kafka版本

```
wget http://mirrors.shuosc.org/apache/kafka/2.0.0/kafka_2.12-2.0.0.tgz
```

## TOPIC详情

```
bin/kafka-topics.sh --create --zookeeper 172.20.80.17:2181,172.20.80.18:2181,172.20.80.19:2181 --partitions 1 --replication-factor 2 --topic test_perform
bin/kafka-topics.sh --describe --zookeeper 172.20.80.17:2181,172.20.80.18:2181,172.20.80.19:2181 --topic test_perform
```

结果：

```
Topic:test_perform	PartitionCount:1	ReplicationFactor:2	Configs:
	Topic: test_perform	Partition: 0	Leader: 1	Replicas: 1,3	Isr: 1,3
```

## 生产
```
bin/kafka-producer-perf-test.sh --topic test_perform --num-records 1000000 --record-size 1000 --throughput 200000 --producer-props bootstrap.servers=172.20.80.17:9092,172.20.80.18:9092,172.20.80.19:9092
```

总共需要发送的消息数1000000，每个记录的1000字节数，每秒钟发送的记录数200000，结果如下：

```
309649 records sent, 61929.8 records/sec (59.06 MB/sec), 455.6 ms avg latency, 663.0 max latency.
413440 records sent, 82688.0 records/sec (78.86 MB/sec), 399.2 ms avg latency, 495.0 max latency.
1000000 records sent, 78560.766753 records/sec (74.92 MB/sec), 395.82 ms avg latency, 663.00 ms max latency, 392 ms 50th, 528 ms 95th, 630 ms 99th, 650 ms 99.9th.
```

## 消费
```
bin/kafka-consumer-perf-test.sh --threads 1 --broker-list 172.20.80.17:9092,172.20.80.18:9092,172.20.80.19:9092 --topic test_perform --fetch-size 1048576 --messages 1000000
```

 总共要消费的消息数1000000，单线程消息，结果如下：
 
```
start.time, end.time, data.consumed.in.MB, MB.sec, data.consumed.in.nMsg, nMsg.sec, rebalance.time.ms, fetch.time.ms, fetch.MB.sec, fetch.nMsg.sec
2018-10-11 16:51:50:174, 2018-10-11 16:52:01:468, 953.6743, 84.4408, 1000000, 88542.5890, 3278, 8016, 118.9713, 124750.4990
```

