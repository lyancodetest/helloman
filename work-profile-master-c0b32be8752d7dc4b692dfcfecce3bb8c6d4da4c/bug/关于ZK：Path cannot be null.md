
## 问题
生产日志如下：
```
[ERROR] [aif-member] 2021-01-22 01:45:47.180 [main-EventThread] [] [] [] org.apache.curator.framework.imps.CuratorFrameworkImpl - Watcher exception
java.lang.IllegalArgumentException: Path cannot be null
	at org.apache.curator.utils.PathUtils.validatePath(PathUtils.java:48)
	at org.apache.curator.utils.PathUtils.validatePath(PathUtils.java:37)
	at org.apache.curator.utils.ZKPaths.fixForNamespace(ZKPaths.java:105)
	at org.apache.curator.framework.imps.NamespaceImpl.fixForNamespace(NamespaceImpl.java:104)
	at org.apache.curator.framework.imps.CuratorFrameworkImpl.fixForNamespace(CuratorFrameworkImpl.java:594)
	at org.apache.curator.framework.imps.GetChildrenBuilderImpl.forPath(GetChildrenBuilderImpl.java:182)
	at org.apache.curator.framework.imps.GetChildrenBuilderImpl.forPath(GetChildrenBuilderImpl.java:38)
	at com.alibaba.dubbo.remoting.zookeeper.curator.CuratorZookeeperClient$CuratorWatcherImpl.process(CuratorZookeeperClient.java:119)
	at org.apache.curator.framework.imps.NamespaceWatcher.process(NamespaceWatcher.java:68)
	at org.apache.zookeeper.ClientCnxn$EventThread.processEvent(ClientCnxn.java:519)
	at org.apache.zookeeper.ClientCnxn$EventThread.run(ClientCnxn.java:495)
```

这是由于客户端连接/断开产生的事件，这里path会为null，在目前公司使用的dubbox(2.8.4)中未做判断，底层会报出"java.lang.IllegalArgumentException: Path cannot be null"
异常，深入研究可以关注下`org.apache.curator.framework.imps.GetChildrenBuilderImpl#forPath`方法，不影响服务正常使用，暂时先忽略。新版本dubbo在listener会对事件进行判断，根据类型过滤该事件。

dubbox版本：com.alibaba.dubbo.remoting.zookeeper.curator.CuratorZookeeperClient.CuratorWatcherImpl
```
public void process(WatchedEvent event) throws Exception {
    if (listener != null) {
        listener.childChanged(event.getPath(), client.getChildren()
                .usingWatcher(this).forPath(event.getPath()));
    }
}
```

dubbo官方最新版本：org.apache.dubbo.remoting.zookeeper.curator.CuratorZookeeperClient.CuratorWatcherImpl
```
@Override
public void process(WatchedEvent event) throws Exception {
    // if client connect or disconnect to server, zookeeper will queue
    // watched event(Watcher.Event.EventType.None, .., path = null).
    if (event.getType() == Watcher.Event.EventType.None) {
        return;
    }

    if (childListener != null) {
        childListener.childChanged(path, client.getChildren().usingWatcher(this).forPath(path));
    }
}
```
## 重现

在本地环境测试中，如果关闭zk server也会发生此错误。在集群环境中，如果集群中发生重新选举，也会监听到SUSPENDED/RECONNECTED事件，
实际测试中通过kill lerder节点来实现的。
```
WatchedEvent state:Disconnected type:None path:null
13:40:45.225 [Thread-1-EventThread] INFO org.apache.curator.framework.state.ConnectionStateManager - State change: SUSPENDED
java.lang.IllegalArgumentException: Path cannot be null
	at org.apache.curator.utils.PathUtils.validatePath(PathUtils.java:48)
	at org.apache.curator.utils.PathUtils.validatePath(PathUtils.java:37)
	at org.apache.curator.utils.ZKPaths.fixForNamespace(ZKPaths.java:105)
	at org.apache.curator.framework.imps.NamespaceImpl.fixForNamespace(NamespaceImpl.java:104)
	at org.apache.curator.framework.imps.CuratorFrameworkImpl.fixForNamespace(CuratorFrameworkImpl.java:594)
	at org.apache.curator.framework.imps.GetChildrenBuilderImpl.forPath(GetChildrenBuilderImpl.java:198)
	at org.apache.curator.framework.imps.GetChildrenBuilderImpl.forPath(GetChildrenBuilderImpl.java:40)
	at com.neeuq.ZkEventTest$2.process(ZkEventTest.java:48)
	at org.apache.curator.framework.imps.NamespaceWatcher.process(NamespaceWatcher.java:62)
	at org.apache.zookeeper.ClientCnxn$EventThread.processEvent(ClientCnxn.java:530)
	at org.apache.zookeeper.ClientCnxn$EventThread.run(ClientCnxn.java:505)
```

## dubbo相关issue
1. https://github.com/apache/dubbo/issues/870
2. https://github.com/apache/dubbo/issues/4113