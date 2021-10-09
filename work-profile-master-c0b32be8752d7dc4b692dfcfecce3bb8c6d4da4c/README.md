# 常用的环境地址及配置信息等，方便大家收藏

## 常用账号及密码
### 通用配置
* WiFi  
    电脑端：WeLab|手机端：WeLab-C  
    gorge.guo/xxxxxx(默认:域账号/域密码)
* 企业邮箱  
    http://mail.wolaidai.com  
    gorge.guo@wolaidai.com/xxxxxx(密码建议设置成域密码)
* 工单系统账号及密码  
    https://service.wolaidai.com  
    gorge.guo@wolaidai.com/xxxxxx(默认:邮箱账号/域密码)
* GitLab  
    https://git.wolaidai.com  
    gorge.guo/xxxxxx(默认:域账号/域密码)
* ownCloud  
    172.30.35.154  
    gorge.guo/xxxxxx(默认:域账号/域密码)[注意：会定期要求改密码]
* TAPD  
    https://www.tapd.cn/    
    gorge.guo@wolaidai.com/xxxxxx(默认:邮箱账号/域密码)
* Apollo配置中心  
    http://apollo-portalweb.wolaidai.com/signin 
    saas/saas-dev

### 各环境配置
#### 阿里云环境
* 应用发布及部署 - [https://sa.wolaidai.com](https://sa.wolaidai.com)  
    LDAP用户名密码
* Apollo配置中心 - [http://10.0.4.8:8070/signin](http://10.0.4.8:8070/signin)  
    sass/saas-dev 
* API网关地址 - [http://10.2.0.202:2000/#](http://10.2.0.202:2000/#)  
    admin/admin
* maven仓库地址 - [http://nexus.service.ops.welab.co:8081/nexus](http://nexus.service.ops.welab.co:8081/nexus)  
    
#### jrocket2环境
* DEV - PostgreSQL  
    192.168.252.109  
    [注意：账号密码提工单申请]  
    数据库：rocket2
* UAT - PostgreSQL  
    192.168.252.113  
    [注意：账号密码提工单申请]  
    数据库：rocket2
    
#### SAAS
* Maven仓库  
    192.168.251.201  
    deployment/admin123
* DEV - MySQL  
    192.168.244.15  
    root/sqlpass
* Jenkins  
    http://192.168.251.202:8000  
    gorge.guo/xxxxxx(默认：域账号/git密码)
    
* Dubbo控制台
    待补充
    
* MQ控制台

#### 仁聚财务系统
* Maven仓库  
    192.168.246.91  
    admin/adminfin
* DEV - 数据库  
    192.168.246.90  
    dev/sqlpass
* DEV - rabbitmq  
    192.168.246.201:5672  
    welend/wewe
* DEV - redis  
    192.168.246.201:8001,192.168.246.201:8002,192.168.246.201:8003  
    devappwsx(密码)
* UAT - 数据库  
    192.168.252.107  
    saas_app/HopcfbrvdaSbGZj9
* UAT - rabbitmq  
    192.168.245.201:5672  
    welend/wewe
* UAT - redis  
    192.168.245.201:8001,192.168.245.201:8002,192.168.245.201:8003  
    devappwsx(密码)
* Jenkins  
    http://192.168.246.94:8000    
    gorge.guo/xxxxxx(默认：域账号/git密码)
* Dubbo控制台  
    http://192.168.235.218:8080/dubbo-monitor/  
    root/dubbofin

## 常用URL地址，请在浏览器里设置标签
* 我来贷官网 | https://m.wolaidai.com/
* WeLab OA | https://oa.wolaidai.com/
* WeLab 邮箱 | http://mail.wolaidai.com/
* WeLab GitLab | https://git.wolaidai.com/
* WeLab WiKi | http://wiki.wolaidai.com/
* WeLab 天枢平台 | http://ops.wolaidai.com/
* WeLab Apollo配置中心 | http://192.168.251.244:8070/signin/
* WeLab 工单系统 | https://service.wolaidai.com/
* WeLab Maven | http://192.168.251.201:8081/nexus/
* WeLab TAPD | https://www.tpad.cn/20800451/prong/stories/stories_list/
* WeLab Jenkins发布平台(saas) | http://192.168.251.202:8000/
* WeLab Jenkins发布平台(finance) | http://192.168.246.94:8000/
* WeLab 网关配置 | http://192.168.246.202:2000/#/login/
* WeLab 我来贷运维支撑平台 | https://sa.wolaidai.com/