****

### 新员工入职指引-APP前端

## 目录

* [1. 开发环境搭建](#1. 开发环境搭建)
  - [1.1 安装node和watchman](#1.1 安装node和watchman)
  - [1.2 安装nrm及添加wldnpm源](#1.2 安装nrm及添加wldnpm源)
  - [1.3 安装React Native的命令行工具](#1.3 安装React Native的命令行工具)
  - [1.4 安装xcode](#1.4 安装xcode)
  - [1.5 安装JDK,Android Studio及SDK](#1.5 安装JDK,Android Studio及SDK)
  - [1.6 vscode](#1.6 vscode)
  - [1.7 webstrom](#1.7 webstrom)
  - [1.8 gitlab ssh key配置](#1.8 gitlab ssh key配置)
* [2. 项目运行](#2. 项目运行)
* [3. 项目开发流程](#3. 项目开发流程)
* [4. 项目开发相关规范](#4. 项目开发相关规范)
* [5. 项目打包](#5. 项目打包)
* [6. 项目发布](#6. 项目发布)



在准备搭建我来数科APP相关开发环境, 请确保完成 [新员工入职指引-通用.md](新员工入职指引-通用.md) 文档所需要配置的账号, 公司各类平台账号并不统一, 请整理好自己的账号和密码. 目前app开发采用react-native技术, 需要同时兼顾android和ios, 所以需要申请的是mac系统的电脑.

搭建环境之前, 确保下面相关操作已经完毕:

1. 申请网络账号及密码

2. 申请邮箱账号

3. 申请github账号及相关项目权限



# 1. 开发环境搭建



## 1.1 安装node和watchman

```shell
brew install node
brew install watchman
```

## 1.2 安装nrm及添加wldnpm源

nrm 是一个 NPM 源管理器，允许你快速地在如下 NPM 源间切换

```shell
npm install -g nrm
```

添加wldnpm源 (需要公司网络, 可以使用公司网线或welab开头的wifi)

```shell
nrm add wldnpm http://npm.wolaidai.com:8080/
```

切换wldnpm源

```java
nrm use wldnpm
```

注册wldnpm

```
npm adduser --registry http://npm.wolaidai.com:8080

输入Username
输入Password
输入Email
```

登陆wldnpm

```
npm login

输入Username
输入Password
```

## 1.3 安装React Native的命令行工具

```
npm install -g react-native-cli
```

## 1.4 安装xcode

React Native 目前需要Xcode 9.4 或更高版本。你可以通过 App Store 或是到Apple 开发者官网上下载。这一步骤会同时安装 Xcode IDE、Xcode 的命令行工具和 iOS 模拟器。

## 1.5 安装JDK,Android Studio及SDK

如果你之前没有接触过 Android 的开发环境，那么请做好心理准备，这一过程相当繁琐。请`万分仔细`地阅读下面的说明，严格对照文档进行配置操作。

> 请注意！！！最好有稳定的翻墙工具，否则在下载、安装、配置过程中会不断遭遇链接超时或断开，无法进行开发工作。



#### 1. Java Development Kit

React Native 需要 Java Development Kit [JDK] 1.8（暂不支持 1.9 版本）。你可以在命令行中输入

> `javac -version`来查看你当前安装的 JDK 版本。如果版本不合要求，则可以到 [官网](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)上下载。

#### 2. Android 开发环境

1. 安装 Android Studio

   [首先下载和安装 Android Studio](https://developer.android.com/studio/)，国内用户可能无法打开官方链接，请自行使用搜索引擎搜索可用的下载链接。安装界面中选择"Custom"选项，确保选中了以下几项：

   - `Android SDK`
   - `Android SDK Platform`
   - `Performance (Intel ® HAXM)`
   - `Android Virtual Device`

   然后点击"Next"来安装选中的组件。

   > 如果选择框是灰的，你也可以先跳过，稍后再来安装这些组件。

   安装完成后，看到欢迎界面时，就可以进行下面的操作了。

2. 安装 Android SDK

   Android Studio 默认会安装最新版本的 Android SDK。目前我来数科app项目编译的版本为`Android 7.0 `版本的 SDK。你可以在 Android Studio 的 SDK Manager 中选择安装各版本的 SDK。

   你可以在 Android Studio 的欢迎界面中找到 SDK Manager。点击"Configure"，然后就能看到"SDK Manager"。 

   <img src=img/app/as1.png width="600px" />



   > SDK Manager 还可以在 Android Studio 的"Preferences"菜单中找到。具体路径是**Appearance & Behavior**→ **System Settings** → **Android SDK**。

   在 SDK Manager 中选择"SDK Platforms"选项卡，然后在右下角勾选"Show Package Details"。展开`Android 7.0 `选项，确保勾选了下面这些组件（重申你必须使用稳定的翻墙工具，否则可能都看不到这个界面）：

   <img src=img/app/as2.png width="600px" />

   然后点击"SDK Tools"选项卡，同样勾中右下角的"Show Package Details"。展开"Android SDK Build-Tools"选项，确保选中了 React Native 所必须的`25.0.2`版本。你可以同时安装多个其他版本，然后还要勾选最底部的`Android Support Repository`。

   <img src=img/app/as3.png width="600px" />

   最后点击"Apply"来下载和安装这些组件。

   <img src=img/app/as4.png width="600px" />

3.  配置 ANDROID_HOME 环境变量

   React Native 需要通过环境变量来了解你的 Android SDK 装在什么路径，从而正常进行编译。

   具体的做法是把下面的命令加入到`~/.bash_profile`文件中：

   ```
   # 如果你不是通过Android Studio安装的sdk，则其路径可能不同，请自行确定清楚。
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

   使用`source ~/.bash_profile`命令来使环境变量设置立即生效

## 1.6 vscode

编写react-native js代码我们一般习惯使用前端开发工具vscode或者webstrom, 目前推荐在这两种开发工具选择自己熟悉的一个就行.

#### 1. vscode安装

安装地址:https://code.visualstudio.com/

#### 2. vscode插件

vocode插件大家可以根据自己喜好添加, 但是`eslint`插件和`prettier`插件请务必装上, 保证项目代码格式化统一.

<img src=img/app/vscode-eslint.png width="600px" />

<img src=img/app/vscode-prettier.png width="600px" />

#### 3. vscode相关配置

1. 打开vscode菜单 -> 首选项 -> 设置, 在右侧用户加入如下配置.

<img src=img/app/vscode-peizhi.png width="600px" />

```
    // 显示空格及控制字符
    "editor.renderControlCharacters": true, 
    "editor.renderWhitespace": "all",
    // 修改tab为2个space
    "editor.tabSize": 2,
    // 限制行数为120 会绘制一根限制线
    "editor.rulers": [
        120
    ],
```

2.  打开vscode菜单 -> 首选项 -> 按键映射扩展, 点击编辑keybindings.json,添加eslint格式化快捷键.

<img src=img/app/vscode-jianpan.png width="600px" />

打开后界面如下.添加如下配置:

```
    {
        "key": "shift+cmd+l",
        "command": "eslint.executeAutofix",
        "when": "editorTextFocus && !editorReadonly"
    }
```

上述的`key`可以自己配置, 配置后使用相关快捷键即可执行eslint修复及格式化.

<img src=img/app/vscode-jianpan2.png width="600px" />

## 1.7 webstrom

webstrom大家根据自己需求进行安装.需要安装的版本为2018.1以上版本.

#### 1. webstrom配置

1. 开启eslint检测

   <img src=img/app/webstrom-eslint.png width="600px" />

2. 保持代码缩进为2个空格

   <img src=img/app/webstrom-style.png width="600px" />

3. eslint格式化快捷键配置

   设置 -> Keymap中,  搜索Reformat with Prettier, 在搜索出来的项目上右键菜单上点击Add Keyboard Shortcut,即可设置自己喜欢的快捷键.

   <img src=img/app/webstrom-kjj.png width="600px" />


## 1.8 gitlab ssh key配置

参考: https://wiki.wolaidai.com/2017/03/20/GitLab-User-Guide/  ssh key导入 章节.

# 2. 项目运行


#### 1. 下载源码

我来数科App源码地址: https://git.wolaidai.com/WelabCo/FrontEnd/Rocket2-RN

访问前请先申请gitlab账号及gitlab相关项目权限

#### 2. 安装依赖

进入到 `Rocket2-RN/wolaidai` 目录, 执行`npm install`安装项目依赖

#### 3. 运行ios项目

执行`react-native run-ios`

#### 4. 运行android项目

前提条件: 连上设备开启usb调试. (目前项目不支持在模拟器上运行)

执行`react-native run-android`

如果链接不上机器红屏，尝试：`react-native run-android --deviceId YourDeviceId`

#### 5. 操作配置

ios模拟器`command + D`呼出配置菜单, 模拟器`command + R` reload

真机摇一摇，或者menu键

有些Android机型支持命令行触发摇一摇重新加载: `npm run android:shake` 或`adb shell input keyevent 82`



# 3. 项目开发流程

目前我来数科app一个版本迭代周期在20天左右. 大部分工作量主要在开发和测试上. 主要流程及工作可以参考下图.

<img src=img/app/liucheng.png width="600px" />

主要工作介绍:

| 阶段            | 时间(天) | 主持人员 | 参与人员              | 主要工作                                                     |
| :-------------- | -------- | -------- | --------------------- | ------------------------------------------------------------ |
| 需求评审        | 0.5      | 产品     | 产品/App/后台/H5/测试 | 明确需求, 确定需求的可行性, 确定开发方面风险, 确定需求优先级,评估开发时间 |
| 技术评审        | 0.5      | App      | 产品/App/后台/H5/测试 | 开发人员讲解需求模块的实现, 各方对实现方法提出意见建议. 前后台确定接口 |
| 开发            | 7        | App      | App/后台/H5           | 实现需求                                                     |
| 测试用例评审    | 0.5      | 测试     | 产品/App/后台/H5/测试 | 评审测试用例的正确性, 以及测试用例是否完整覆盖需求           |
| 冒烟测试        | 1        | App      | App/测试              | 确保不阻塞进件主流程, 主要功能模块实现.                      |
| 测试            | 10       | 测试     | 产品/App/后台/H5/测试 | 确定功能模块实现, 查找bug,修复bug,验证bug修复,验证各个版本app的兼容性 |
| ui走查          | 1        | ui       | ui/App                | 确保开发人员实现效果与设计稿一致                             |
| uat             | 3        | 产品     | 产品/App/测试         | uat主要在测试后期介入, 由产品验收本次迭代的需求是否完成, 确定功能及体验是否达到要求, 不足之处提出整改 |
| 后台/h5发布生产 | 0.5-1    | 后台/H5  | 后台/H5               | 产品uat通过之后, 即可让后台h5发布生产环境.为app发布做准备    |
| 生产验证        | 0.5      | 产品     | 产品/App/测试         | 验证最新版本的app在生产环境, 进件正常, 新功能正常            |
| app发布         | 0.5      | App      | App/运营渠道/运维     | 由app打出相对应的生产包/及渠道包, 由运营人员上传相关的应用市场, 运维人员上传到cdn服务器上. |



# 4. 项目开发相关规范

参考 https://wiki.wolaidai.com/2017/04/10/welab-git-workflow/ git工作流规范

及 ownCloud 上 rn代码规范.

# 5. 项目打包

App项目打包  及 项目发布  可以参考ownCloud上相关文档

<img src=img/app/owncloud1.png width="600px" />

# 6. 项目发布

参考上述文档