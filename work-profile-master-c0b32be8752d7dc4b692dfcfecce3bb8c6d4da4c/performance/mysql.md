##Mysql压测
>这里使用mysql官方推荐的压测工具：sysbench
####1.安装sysbench
（这里是rhel的命令，其他命令可参考https://github.com/akopytov/sysbench/blob/master/README.md）
```
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash 
sudo yum -y install sysbench
```

验证安装成功：
```
sysbench --version
```


####2.安装mysql
```
docker pull mysql:5.6
```

####3.启动docker mysql
```
docker run --name self-define-name -p 3333:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6
```
查看是否启动成功：
````
docker logs self-define-name
````


####4.在mysql上创建db：sbtest
这里使用sysbench默认带的lua脚本，使用的是这个库，也可以自己定义脚本(空库就可以，表会在prepare环节创建并初始化数据)


####5.执行命令
分三步 prepare、run、clean （clean表不会清空完，建议最后再来一步drop database）
````
 sysbench /usr/share/sysbench/tests/include/oltp_legacy/oltp.lua --mysql-host=poseidon-dev.wolaidai.com --mysql-port=33060 --mysql-user=mysql102125965122 --mysql-password=01790464411 --oltp-test-mode=complex --oltp-tables-count=10 --oltp-table-size=100000 --threads=10 --time=120 --report-interval=10 prepare


 sysbench /usr/share/sysbench/tests/include/oltp_legacy/oltp.lua --mysql-host=poseidon-dev.wolaidai.com --mysql-port=33060 --mysql-user=mysql102125965122 --mysql-password=01790464411 --oltp-test-mode=complex --oltp-tables-count=10 --oltp-table-size=100000 --threads=10 --time=120 --report-interval=10 run >> /home/welab/mysysbench.log	


 sysbench /usr/share/sysbench/tests/include/oltp_legacy/oltp.lua --mysql-host=poseidon-dev.wolaidai.com --mysql-port=33060 --mysql-user=mysql102125965122 --mysql-password=01790464411 cleanup
```` 
 ####6.查看结果
 ````
 cat /home/welab/mysysbench.log
 ````