1、目前问题
	binding关系丢失
	管理员账号失去administrator权限
2、排查过程
	该问题处理过多次，无特殊规律，且当时无应用发布，重启。仔细检查几个应用代码，可能有不太规范的地方，但没有问题。
	
```	
	https://github.com/rabbitmq/rabbitmq-event-exchange
	https://github.com/rabbitmq/rabbitmq-event-exchange/blob/master/src/rabbit_exchange_type_event.erl 79行
```
	
``` 
3.7.14 可以把操作用户记录下来
binding.created
{destination_kind=queue, vhost=/, timestamp_in_ms=1556962165138, source_kind=exchange, arguments=[], destination_name=sdfsdf, routing_key=, user_who_performed_action=admin, source_name=welab.event}
```
	
```
3.6.5
binding.created
{destination_kind=queue, timestamp_in_ms=1557019289707, vhost=/, source_kind=exchange, destination_name=welab.event.test.queue, arguments=[], routing_key=, source_name=welab.event.exchange}
binding.deleted
{destination_kind=queue, timestamp_in_ms=1557019373249, vhost=/, source_kind=exchange, destination_name=welab.event.test.queue, arguments=[], routing_key=, source_name=welab.event.exchange}
```

3、解决方案
	admin账号由运维管理，不同项目组将使用普通账号，只有queue、exchange和binding关系创建权限，不具体控制台访问权限，有特别需求可以提出来
	性能测试通过后开启rabbitmq-event-exchange插件
4、规划
	welab.event.exchange废弃
	消息跟踪