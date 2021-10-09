#### 问题
现在测试环境dubbo(2.5.7)和dubbox(2.8.4)互相调用不成功
#### 原因
本来dubbo官方版本间都是兼容升级的，dubbox分支在某次升级中修改了生产端解码


#### 解决方案
1. 原有dubbox(2.8.4)分析统一切换至dubbo(2.5.7)，项目改动量有点大，而且切换过程中可能会影响生产运行  
2. 修改dubbo(2.5.7)和dubbox(2.8.4)生产端解码部分的代码，做到版本兼容，这个方案我有简单测试过程，如要使用需进一步研究源码  
>>  如增加版本判断  

```
String dubbo_version = this.getAttachment(Constants.DUBBO_VERSION_KEY);
int argNum = -1;
if (dubbo_version.equals("2.8.4")) {
    argNum = in.readInt();
}
```

问题相关的issue  
* https://github.com/dangdangdotcom/dubbox/issues/320  
* https://github.com/dangdangdotcom/dubbox/issues/165  