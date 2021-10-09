# Nextcloud用户手册

## 目录
* [1 Nextcloud 客户端安装及设置](#1-nextcloud客户端安装及设置)
* [2 Web访问Nexcloud](#2-web访问nexcloud)
* [3 文件同步](#3-文件同步)
* [4 文件上传](#4-文件上传)
* [5 文件分享](#5-文件分享)

## 1 Nextcloud客户端安装及设置
	
### 1.1 打开准入助手，点开“工具箱”，找到“Nextcloud”，双击安装即可。

*需要注意的事，安装过程可能会重启机器，在安装之前，请提前保存好现有工作。*

![](img/nextcloud/nextcloud_install0.png)

### 1.2 一直点击“下一步”直至安装完成

![](img/nextcloud/nextcloud_install1.png)  
![](img/nextcloud/nextcloud_install2.png)  
![](img/nextcloud/nextcloud_install3.png)  
![](img/nextcloud/nextcloud_install4.png)  
![](img/nextcloud/nextcloud_install5.png)  

### 1.3 设置Nextcloud连接向导
打开桌面“Nextcloud”图标，点击登录。

![](img/nextcloud/nextcloud_config0.png)

> 输入服务器地址“[https://pan.welab.com](https://pan.welab.com)”或“[https://172.30.35.211](https://172.30.35.211)”，点击“Next”。

![](img/nextcloud/nextcloud_config1.png)

页面转至信任证书页，勾选“总是信任该证书”后，点击“OK”。

![](img/nextcloud/nextcloud_config2.png)

跳转页面后，点击“登录”，使用Windows账户登录，允许“授权访问”。

![](img/nextcloud/nextcloud_config3.png)
![](img/nextcloud/nextcloud_config4.png)

### 1.4 设置Nextcloud同步文件夹。
在1.3完成后，新安装的客户端会要求选择需要同步的文件夹。用户在指定需要同步的文件夹后，点击“链接”即可。   
特别注意，此处必须勾选“保留本地数据”，否则同步时本地文件将会被清空。

![](img/nextcloud/nextcloud_config5.png)

## 2 Web访问Nexcloud
> 打开浏览器，地址栏输入Nextcloud地址“[https://pan.welab.com](https://pan.welab.com)”或“[https://172.30.35.211](https://172.30.35.211)”，输入Windows账户密码，登录即可。

![](img/nextcloud/nextcloud_web_access.png)

## 3 文件同步

### 3.1 打开客户端，选择“添加同步文件夹”。

![](img/nextcloud/nextcloud_sync_local_dir0.png)

**选择需要同步的本地文件夹，点击“Next”。**

![](img/nextcloud/nextcloud_sync_local_dir1.png)

**选择需要同步的云盘文件夹，点击“Next”即可。**

![](img/nextcloud/nextcloud_sync_local_dir2.png)

根据自身需求勾选不需要同步的文件夹，一般初次使用勾选“Documents”，“Photos”。选择完毕后，点击添加同步链接。

![](img/nextcloud/nextcloud_sync_local_dir3.png)

## 4 文件上传

### 4.1 客户端上传
用户只需将待上传文件放至“3 文件同步”中所设置的本地文件夹，nextcloud会立即同步本地文件至云盘上。

### 4.2 Web上传
用户登录web页面后，点击主页中“+”符号，选择“上传文件“即可。

![](img/nextcloud/nextcloud_file_upload_web.png)

## 5 文件分享

### 5.1 新建文件分享
登录web界面，选择要分享的文件或文件夹。点击①处分享按钮，在②处选择需要分享者的姓名或者部门名称。例如：lin.zhang或者业务运维_G。   
需要说明的是，分享的群组名以企业微信组织架构为标准，以最小部门为单位，群组名以“企业微信部门名”+“_G” 命名规范。

![](img/nextcloud/nextcloud_file_share.png)

### 5.2 对分享文件设置权限
针对分享的文件，有5种权限设置
> * 1.①可以再次共享     ——被分享者可以再次分享给他人
> * 2.②可以创建        ——被分享者可以上传文件或文件夹
> * 3.③可以编辑        ——被分享者可以修改文件名或文件夹名
> * 4.④可以删除        ——被分享者可以删除文件或者文件夹
> * 5.⑤设置过期日期     ——设定特定日期，取消分享

![](img/nextcloud/nextcloud_power_setting.png)