### Vasdolly打包方案分享

1. 目前多渠道打包方案原理

2. 目前多渠道打包方案流程

3. walle vasdolly多渠道打包原理

4. walle vasdolly 原生多渠道打包优缺点对比

5. vasdolly多渠道打包流程介绍

6. vasdolly多渠道打包操作

7. 测试点

   

meituan/Walle: https://github.com/Meituan-Dianping/walle



Tencent/VasDolly: https://github.com/Tencent/VasDolly

​	原理文档: :https://github.com/Tencent/VasDolly/wiki/VasDolly%E5%AE%9E%E7%8E%B0%E5%8E%9F%E7%90%86



#### 1. 打包原理

**原版打包原理:**

1. 在manifest添加占位符

   ```xml
   <meta-data android:name="MARKET_CHANNEL" android:value=${CHANNEL_VALUE} />
   ```

2. gradle里配置**productFlavors**, 用于生成不同渠道的包

   ```java
   productFlavors {
       imooc {
       	manifestPlaceholders = [CHANNEL_VALUE: "imooc"]
       }
   
       googleplayer {
       	manifestPlaceholders = [CHANNEL_VALUE: "googleplayer"]
       }
   
       //有各种新的渠道安装这种写法就可以添加了
       baidu {
       	manifestPlaceholders = [CHANNEL_VALUE: "baidu"]
       }
   
       productFlavors.all {
       	flavor -> flavor.manifestPlaceholders = [CHANNEL_VALUE : name]
       }
   }
   ```

3. 代码中读取渠道

4. ```java
   ApplicationInfo appInfo = reactApplicationContext.getPackageManager()
                  .getApplicationInfo(packageName,PackageManager.GET_META_DATA);
   Strichannel=appInfo.metaData.get("MARKET_CHANNEL").toString();
   ```

**VasDolly & Walle:**

VasDolly实现原理:https://github.com/Tencent/VasDolly/wiki/VasDolly%E5%AE%9E%E7%8E%B0%E5%8E%9F%E7%90%86

新一代开源Android渠道包生成工具Walle:https://tech.meituan.com/android-apk-v2-signature-scheme.html

借腾讯开源 VasDolly，谈谈 Android 签名和多渠道打包的原理！https://juejin.im/post/5a96325bf265da4e9b5942e5

大致流程:

1. 打出app包
2. 在不影响app签名的区块2中写入渠道包数据
3. 使用工具读出写入的字段, 获取渠道数据

美团描述:

1. 对新的应用签名方案生成的APK包中的ID-value进行扩展，提供自定义ID－value（渠道信息），并保存在APK中
2. 而APK在安装过程中进行的签名校验，是忽略我们添加的这个ID-value的，这样就能正常安装了
3. 在App运行阶段，可以通过ZIP的`EOCD（End of central directory）`、`Central directory`等结构中的信息（会涉及ZIP格式的相关知识，这里不做展开描述）找到我们自己添加的ID-value，从而实现获取渠道信息的功能



#### 2. gradle VasDolly Walle  优缺点及打包测试对比

##### 1. gradle   VS    VasDolly & Walle

VasDolly & Walle优点:

- 打渠道包速度快
- 可利用现有渠道包生成新渠道包, 方便快速.

gradle优点:

- 支持不同渠道不同资源打包
- 渠道号是受保护的，apk发出后，不会被第三方进行恶意修改渠道号(加密方案?)
- 部分三方统计不支持代码中设置渠道, 只支持在mianfast中设置渠道(jPush不支持[3.1.5版本后才支持], 例如友盟, talkingdate是支持的)
- 涉及到app加固可能会有问题(目前github issue大部分提到加固获取不到渠道问题, 大部分是加固与写渠道包信息顺序不对)



##### 2. VasDolly    VS    Walle

| 多渠道打包工具对比    | VasDolly        | Walle        |                    |
| --------------------- | --------------- | ------------ | ------------------ |
| V1签名方案            | 支持            | 不支持       | 美团v1签名是支持的 |
| V2签名方案            | 支持            | 支持         |                    |
| 已有注释块的APK       | 支持            | 支持         |                    |
| 根据已有APK生成渠道包 | 支持            | 支持         |                    |
| 命令行工具            | 支持            | 支持         |                    |
| 强校验                | 支持            | 支持         |                    |
| 多线程加速打包        | 支持            | 不支持       |                    |
| 1100包测试            | ①27s  ②4m08s    | ①35s  ②4m19s | gradle 6h          |
| 1100包(强校验)        | ①6m50s  ②10m51s | 不支持       |                    |

①:使用命令行生成1100个包, 生成母包时间未算入, 使用机器: mac mini2014高配: i7 16g 512gssd(700m/s读写)

②:使用命令行生成1100个包, 生成母包时间未算入, 使用机器: mac mini2014中配: i5 8g 240gssd(400m/s读写)

③:基于我来贷5.2.2版本



##### 3. 最终使用vasdolly原因

1. vasdolly 与 walle打包原理一致
2. vasdolly 近期更新提交更多, 对新特性兼容响应速度更快
3. vasdolly issue处理更及时



#### 3. 修改打包方案后的代码修改

1. 所有打包脚本移动至android/buildPy目录下, 脚本入口文件为build.sh文件. 原打包脚本暂时保留.

2. 将原来主要打包脚本流程从Jenkins 挪至 build.sh中. 也方便使用个人电脑进行打包.

3. 将原build.py脚本进行优化. 使用git回退代码 代替 原来 脚本中备份文件然后再恢复文件 繁琐的操作. 利用ANDROID_HOME环境变量生成local.properties文件, 方便使用个人电脑打包, 并能及时清理不必要的图片文件, 减少apk包大小. 

4. 修改读取channel的地方

   ```java
   直接读取的地方 ConfigUtil.java  getChannel()方法
   
   间接调用的地方
   	RNAppUtil.java initApp()  talkingdata 初始化
   	MainApplication.java initMTA() MTA 初始化
   
   .. 因目前版本的极光sdk未支持代码中添加渠道, 和运营的人员沟通, 因暂未使用极光的统计数据, 所以这暂时不往极光上报渠道数据.
   ```



#### 5. 测试工作

1. vasdolly 读取渠道的测试(覆盖多个android版本和机型)
2. vasdolly 与 原渠道包 升级安装测试(覆盖多个android版本和机型)
3. 9.0 v3签名测试
4. 第三方上报测试, 看看渠道上报数据是否有过去(talkdataing/自家的统计/腾讯)
5. 测试包/生产包的环境是否正确  测试包/生产包是否能抓包
6. 提供安装包(  5.3.3 vasdolly包(生产)  | 5.3.4原生包(生产)  |  5.3.5 vasdolly包(测试/生产)  )



#### 6.思考

有什么没明白? 有什么问题没考虑? 有什么改进的地方?