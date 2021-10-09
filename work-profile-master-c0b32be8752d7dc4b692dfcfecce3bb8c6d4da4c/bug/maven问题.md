# 现象：线上发版时存在welab.version属性找不到

## 原因一
之前welab.version变量一直在com.welab:welab-parent这个pom中定义的：

	<groupId>com.welab</groupId>
	<artifactId>welab-parent</artifactId>
	<version>1.3.0-SNAPSHOT</version>

正常情况下该pom存在该值，类似如下：
	
	<properties>
		<poi.version>3.9</poi.version>
		<filters.base.path>src/filters</filters.base.path>
		<java.security.provider.bc.version>1.46</java.security.provider.bc.version>
		<welab.version>1.3.0-SNAPSHOT</welab.version><!-- add for replace -->
		<shiro.version>1.3.1</shiro.version>
	</properties>
	
但跟踪线上maven库的各快照版本，20170629快照是有这个变量，但是20180117快照不存在变量，而git最新代码也不存在该变量 ，估计是20180117那天使用git仓库代码重新发布过

## 原因二

以下是线上jenkins编译机器上的maven settings文件，规定snapshots类型jar包不从nexus仓库更新，**snapshots**目前一直使用本地缓存，所以会把版本库中pom错误问题给掩盖了

	<repositories>
		<repository>
			<id>public</id>
			<name>wolaidai nexus public repo</name>
			<url>http://172.20.40.60:8081/nexus/content/groups/public</url>
			<layout>default</layout>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
		<repository>
			<id>thirdparty</id>
			<name>wolaidai nexus third party repo</name>
			<url>http://172.20.40.60:8081/nexus/content/repositories/thirdparty</url>
			<layout>default</layout>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
	</repositories>

## 原因三

apply-gateway项目最近引入welab-event-springboot-starter，且存在welab-springboot-base--> welab-springboot-base --> welab-parent继承关系，所以会引入com.welab:welab-parent:1.3.0-SNAPSHOT依赖：
    
    <dependency>
        <groupId>com.welab</groupId>
        <artifactId>welab-event-springboot-starter</artifactId>
        <version>1.3.0-SNAPSHOT</version>
        <exclusions>
            <exclusion>
                <groupId>com.welab</groupId>
                <artifactId>welab-event</artifactId>
            </exclusion>
        </exclusions>
    </dependency>
	
    <parent>
        <groupId>com.welab</groupId>
        <artifactId>welab-springboot-base</artifactId>
        <version>1.3.0-SNAPSHOT</version><!-- add for replace -->
    </parent>
    
    <parent>
        <groupId>com.welab</groupId>
        <artifactId>welab-parent</artifactId>
        <version>1.3.0-SNAPSHOT</version><!-- add for replace -->
    </parent>

且该项目pom.xml多配置了repository，除了从settings文件中的仓库下载外，还从该仓库中下载，snapshots默认是可下载的:
    
	<repositories>
		<repository>
			<id>releases</id>
			<url>http://${nexus.proxy.location}/nexus/content/groups/public</url>
		</repository>
	</repositories>

## 复盘
apply-gateway项目进行编译后会把com.welab:welab-parent:1.3.0-SNAPSHOT从nexus仓库下到本地maven缓存中，因为该pom文件是错的，本来该项目也会编译失败的，但是它依赖的apply-gateway-base中定义了welab.version变量会这个项目编译正常，但是之后的其他项目如果使用com.welab:welab-parent:1.3.0-SNAPSHOT变会失败。

## 存在问题

- 目前nexus仓库中部分pom和jar是错的，应该都是snapshot类型的，不仅仅只有welab-parent项目，昨天发布过程中还发现其他的项目存在问题
- repository中snapshots如果是关闭的会不更新，仅仅从本地maven缓存中读取，相当于把缓存当作数据库使用，在上述问题解决之前，还只能保持目前的设置
- 项目里面就不要再定义repository，统一由settings.xml文件控制会合理点
- 运维同学注意下以下动作存在风险  
》通过命令mvn deploy:deploy-file发布pom是可以的，但发布jar要考虑下这个jar是否存在依赖，尽量使用开发同学提供的脚本来发布  
》maven中jar和pom从测试环境直接拷贝至生产环境，测试环境文件可能是不稳定版本
