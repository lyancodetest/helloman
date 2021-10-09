**卫盈联信息技术（深圳）有限公司**

**技术开发中心iOS编码规范**

**2019年12月16日**

版本变更记录

|  版本号     |  日期         |变更说明   |编制   |审核   |批准|
| ----------- | ------------- | ----------------  | ---------- | ---------- | ---------- |
|  V1.1        | 2019-12-16   |新编     |   |   |   |                
|        |           |        |        |           |        |
|        |           |        |        |           |        |

**目录**

前言 6

第一章 开发总则 7

1.1 首要编码目标 7

1.2 通用编码规则 7

第二章 工程规范 9

2.1 项目结构规范 9

2.1.1 工程总述 9

2.1.2 MVC 10

2.1.3 图片资源 10

2.1.4 头文件 11

2.2 版本规范 11

2.2.1 项目版本 11

2.2.2 Xcode 版本 12

2.3 第三方库使用规范 12

第三章 命名规范 12

3.1 命名原则 12

3.1.1 清晰性 13

3.1.2 一致性 13

3.1.3 不自我指涉 14

3.2 文件命名 14

3.2.1 项目名称 14

3.2.2 包名定义 15

3.2.3 文件夹命名 15

3.2.4 代码文件命名 15

3.2.5 资源文件命名 16

3.3 代码命名 16

3.3.1 通用命名规则 16

3.3.2 缩写规范 18

3.3.3 Method命名 19

3.3.4 Accessor命名 22

3.3.5 Parameter命名 24

3.3.6 Delegate命名 24

3.3.7 Private命名 24

3.3.8 Category命名 25

3.3.9 Class命名 26

3.3.10 Protocol命名 26

3.3.11 Notification命名 27

3.3.12 Constant命名 27

3.3.13 Exception命名 29

3.3.14 其他命名规范 29

第四章 代码规范 30

4.1 代码布局和格式 30

4.1.1 头文件引入 30

4.1.2 属性 和 私有变量 30

4.1.3 类内部布局 30

4.1.4 代码格式 31

4.2 代码注释 34

4.2.1 类的注释 35

4.2.2 方法注释 35

4.2.3 模型注释 35

4.3 编程细则 36

4.3.1 Initialize 36

4.3.2 Init方法 38

4.3.3 Init error 40

4.3.4 dealloc 40

4.3.5 Block 41

4.3.6 Notification 41

4.3.7 UI 42

4.3.8 IO 43

4.3.9 Collection 43

4.3.10 分支语句 45

4.3.11 对象判等 46

4.3.12 懒加载 47

4.3.13 多线程 47

4.3.14 内存管理 49

4.3.15 延迟调用 50

4.3.16 类的设计 51

4.3.17 方法调用 51

4.3.18 其它编码建议 55

附录 56

**\
**

前言
====

随着公司业务线增加，产品快速迭代累积的需求功能越多，项目代码的维护成本也随之增加。同时，团队成员的增加或人员流动，不同开发者的编码风格不尽相同，也增加了项目交接和合作开发成本，降低了团队成员之间的协作效率和组织生产效能，从而难以保证开发交付质量。

为防患于未然，提升质量意识，引导团队成员以更加高效、高质量地进行迭代开发，降低生产故障率和项目维护成本，以呈现给用户运行稳定、体验流畅的软件为目的，特制定此《iOS开发规范》。规范提供一条可供参考的标准线，以约束不同的开发风格，规范开发行为和代码约定，保证项目从整体风格到编码细节上的标准统一，提高代码可读性和可维护性，提升软件项目自身的迭代更新能力，促进代码审查和合作开发等团队协作效率，也有利于开发者养成良好的编码习惯，完成从合格到优秀的开发能力提升。

本编码规范内容包括开发总则，工程规范，命名规范和代码规范四大章节，每个章节内容是推荐性的编程经验条陈，或者是针对该章节主题的编程规约。根据约束力度，把编码约定分成以下两个等级：

【强制】必须遵守，违反本约定或将会引起严重的后果;

【推荐】尽量遵守，长期遵守有助于系统稳定性和合作效率的提升;

本开发规范的每个章节都由很多规约项组成，每一个规约项就是一条具体的编码规范，不同的规约项描述不同的问题。有些问题只列出了应遵守的编码规范（what），有些问题除了给出编码规范（what），还附加解释了规范原因（why），让开发者不仅知其然，也能知其所以然。

-   #### 实施和解释

本规范制定了编写iOS程序的基本原则、规则和建议。适用于公司内所有iOS原生代码的APP开发。本规范自发布之日起生效，对以后新编写的和修改的代码应遵守本规范。本规范由研发中心发布和维护。

第一章 开发总则
===============

1.1 首要编码目标
----------------

软件需要人维护，才能持续正确地运行于机器，要面向人编码，而非面向机器编码。易读、易维护的软件代码才具有生命力。

"程序必须为阅读它的人而编写，只是顺便用于机器执行。"------HaroldAbelson和Gerald
Jay Sussman

"编写程序应该以人为本，计算机次之。"------Steve McConnell

软件的生命周期贯穿产品的开发，测试，生产，用户使用，版本升级和后期维护等过程。软件维护期成本占整个生命周期成本的40%\~90%。在维护期变更代码的成本，小型系统是开发期的5倍，大型系统(
100万行代码以上)可以达到100倍。

为减少软件维护期修改bug和扩展需求的成本，以便有更多人力投入新业务研发战略，提高公司竞争力，在开发阶段应着重提高代码的易维护性和高正确性。而只有简洁易懂、逻辑清晰、容易发现排查问题的高可读性代码，才能降低代码的维护重构和功能扩展成本，才能保证程序的正确性和可靠性。

代码可读性优先于易维护性和高拓展性，编写代码应以可读性为首要目标一以贯之。

1.2 通用编码规则
----------------

【推荐】 不要过分追求技巧而导致程序的可读性降低。

【推荐】
一般情况下，代码的可阅读性高于性能目标，确定存在性能瓶颈时再优化。

【强制】
废弃的代码(没有被调用的函数和全局变量)要及时清除，重复代码应该尽可能􏰀炼成函数
。

【推荐】
代码自注释。优秀的代码命名可以自我解释，不通过注释即可轻易读懂。\
编写代码尽量追求简洁易懂，逻辑清晰；在排查问题时才能确定明显没有bug，而不是没有明显bug。

【推荐】
对于有注释的代码，当代码逻辑变更时，也一定要修改注释，且不要添加多余或重复的注释。

【推荐】
保持代码的简明清晰，避免过分的编程技巧。代码越复杂越有技巧性，则潜在错误越多，代码的可靠性越低。

【推荐】
编程首先考虑是否满足正确性，健壮性，可维护性，可移植性等质量因素，其次再考虑效率。

【强制】
编写代码时需要考虑到代码的可测试性。不可测试的代码无法保障质量，编写的代码要提供可以测试、验证的方法。

【强制】
保证函数功能单一。方法是一个为特定功能而编写处理单元，不要把多个功能逻辑放在一个方法里。

【强制】
保持代码风格一致。共同使用同一种风格带来的好处，远远超出为了统一风格而付出的\
代价。在编码规范指导下，审慎地编排代码使的代码尽可能清晰，适应其他开发成员的代码风格和阅读习惯，是一项非常重要的技能。在重构或修改其他风格的代码时，跟随其现有代码的风格编写代码。

【推荐】
不重复造轮子。在着手开发新功能之前，先检查项目中是否有已经封装好的相关功能类，需要时在已有类上添加
Catogory 进行扩展。

【推荐】
善用\#TODO注释。对于需要后续完成或完善的代码，要在相应的地方添加TODO:注释，待后面有时间修复完善。

【推荐】 平衡编码过程的过度工程和可扩展性要求。说明：

-   过度工程（over-engineering）：即在正确可用的代码写出之前就过度地考虑扩展，重用的问题，使得工程过度复杂。

-   可扩展性：面向变化编程，而不是面向需求编程。需求是暂时的，变化才是常态。编码不能只考虑满足当前迭代的功能需求，写出扩展性、适应性强的程序才是负责任的做法。

代码的可扩展性，应在防止过度工程的前提下实现，编码目标由低到高层次应对如下：

\> 实现能解决问题、满足需求的可用代码 。  

\> 经过推敲以择优方式解决问题、满足要求的正确代码。

\> 具有可扩展性、可重用性的测试完备的简洁清晰代码。

第二章 工程规范
===============

2.1 项目结构规范
----------------

### 2.1.1 工程总述

【强制】工程名称必须为英文，不能使用中文、特殊符号、其他语言，不推荐使用汉语拼音、阿拉伯数字、下划线（特殊情况除外：客户特别要求的情况、使用英文过于繁琐的情况、工程名存在版本号的情况）。

【强制】新增项目文件夹要创建实体文件夹。即到工程目录下创建相应文件夹并拖入工程。（在Finder中创建，而非在Xcode工程中直接New
Group）。

【强制】为了避免文件杂乱，物理文件应该保持和 Xcode 项目文件同步。Xcode
创建的任何组（group）都必须在文件系统有相应的映射。为了更清晰，代码不仅应该按照类型进行分组，也可以根据业务功能进行分组。

【推荐】合理组织工程的内的文件夹，工程中一般包括但不限于以下几个文件夹category(分类)、util/helper(工具类)、resource(资源)、const(常量)、third(第三方)。

【推荐】工程根目录中需要存在Class、Image、Libs、Share这几个文件夹。.h和.pch文件需要放在AppDelegate文件的下边。工程自动生成的文件不需要改变位置。

【推荐】在class下面存在两层子模块。在最子模块中进行model、view、controller分类，如有必要可以添加一个other目录。

【推荐】尽可能一直打开 target Build Settings 中 \"Treat Warnings as
Errors\"
以及一些[[额外的警告]](http://boredzo.org/blog/archives/2009-11-07/warnings)。如果你需要忽略指定的警告，使用
[[Clang
的编译特性]](http://clang.llvm.org/docs/UsersManual.html#controlling-diagnostics-via-pragmas)
。

【推荐】使用framework作为SDK的呈现形式。

【推荐】设置search path时， 使用相对路径替代绝对路径，
使用输出SDK目录路径替代本机DerivedData路径。

【推荐】图片资源命名规则: 模块\_控件类型\_功能\_状态\@几倍图.图片类型

【推荐】资源bundle文件夹不需要进行编译

【推荐】第三方库资源文件放在Vendor目录

【推荐】第三方库桥接文件需并入VenderWrapper目录

【推荐】第三库秘钥及Appkey等需要单独配置在Product目录文件下

【强制】文件夹需要彻底删除。当在Xcode中删除某一个文件夹以及文件夹中的文件时，必须要在Finder中将残留的空文件夹删除。防止出现文件夹重名和文件夹残留。

### 2.1.2 MVC

【推荐】项目文件结构主要以项目每个大模块相应下来进行划分。新建添加模块的时候，遵守这个模块划分去创建文件夹。例如：

Main，Home，Invest，Discover，Wealth，More，Account

【推荐】一致采用 MVC 设计框架， 每个模块功能点一般划分成
Model，ViewController，View 去进行实现. 每个模块各执其职。

-   Model: 保存相应的数据结构， 逻辑复杂的情况下， 可以将数据操作逻辑从
    ViewController 移动到 Model 去进行实现， 防止 ViewController
    代码过于冗余. 不方便阅读。

-   ViewController: 主要负责获取 Model 层数据， 进而管理 View 层. 以及
    User 一系列交互逻辑， 都由其负责响应管理。 由于此层任务繁重，
    逻辑复杂的时候容易造成代码冗余的状态， 必要的时候我们也可以更换成
    MVVC 模式去有效的避免 MVC 这个缺点。

-   View: 主要负责接收 Model 层数据， 进行页面渲染 数据展示，
    一般无特殊情况， 建议使用 Xib 去完成界面构建， 除非是特殊页面，
    否则尽量统一使用 Xib 的形式 去完成每个界面。

### 2.1.3 图片资源

【推荐】项目中的图片一致存放到 Assets.xcassets 进行管理. 从 V3.0
版本开始是按模块划分进行管理的， 但是到后面版本的更新迭代中，
出现了按版本顺序进行分组， 建议将图片一致保存到原有的模块分组中去。

【推荐】不需要使用的图片，及时清除， 减少 App 体积。

【推荐】图片名称可以以模块作为首接 \_
连接其相应功能点。方便以后查找。如:

trade\_result\_fail 投资，结果页，状态

discover\_activity 发现，活动

### 2.1.4 头文件

【强制】\#import引用Objective-C/Objective-C++头文件；\#include引用C/C++头文件；使用\#include时要注意\#define头保护。

【强制】\#import头文件按模块分类。

说明：对头文件按模块分类，使代码易读，也便于理解。

【强制】\#import的顺序，应该是先引用自定义类，再引用系统类/框架。

说明：将系统类放在最后引入可，避免和检验自定义类的头文件引用不完整漏洞。

【强制】\#import根框架而不是单独的零散文件。

说明：当你试图从框架(如Cocoa或者Foundation)中包含若干零散的系统头文件时，实际上包
含顶层根框架的话，编译器要做的工作更少。根框架通常已经经过预编译，加载更快。

【推荐】区分使用\@class与\#import完成引用。

说明：如需要继承类或执行协议，可以在.h中进行\#import类或协议；其他情况下，在.h中声明用\@classs声明此类即可。这样可以减少因头文件依赖引起重复编译，提高编译速度。

2.2 版本规范
------------

### 2.2.1 项目版本

【推荐】采用A.B.C
三位数字设定版本号的控制和管理，如：1.0.2。当有版本更新时，以下表规则确定版本号规范：

  版本号      说明                 示例
  ----------- -------------------- -------------------------
  **A**.b.c   属于重大更新内容     **1**.0.2 -\> **2**.00
  a.**B**.c   属于小部分更新内容   1.**0**.2 -\> 1.**2**.2
  a.b.**C**   属于补丁更新内容     1.0.**2** -\> 1.0.**4**

### 2.2.2 Xcode 版本

【推荐】Xcode 版本更新迭代很快， 建议定时到 App Store 进行更新到最新版。

2.3 第三方库使用规范
--------------------

【推荐】不重复造轮子。使用第三方开源库时，且根据项目的issue解决记录、开发者的知名度等各方面作为参考依据。

【推荐】第三方库选择比较稳定的版本，且定时更新到最新版本。

【强制】选择的三方开源库在github 上的项目要求 200 Star 以上

【推荐】项目使用cocoapods统一管理接入的第三方库，不需要手动导入和手动添加依赖库。如果第三方不支持cocoapods，可手动导入工程。安装cocoapods请参考：[cocoapods安装](https://link.jianshu.com/?t=http://blog.csdn.net/qtds8810/article/details/50510910)

第三章 命名规范
===============

3.1 命名原则
------------

根据Cocoa编码规范里的描述，非特殊情况下，命名应该遵循以下基本原则：Clarity、Consistency、No
Self Reference。即清晰性、一致性、不要自我指涉[Code Naming
Basics](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingBasics.html)。

### 3.1.1 清晰性

清晰性要求表现为高可读性，高可读性的标准是代码简洁，含义清楚，自我解释，且防止命名冲突（通过加前缀后缀来保证：每个模块都要加上自己的前缀，
前缀在编程接口中非常重要，
可以区分软件的功能范畴并防止不同文件或者类之间命名发生冲突， 比如
DKTableView、DKDataBase）。

【推荐】代码自身命名不需要注释也能了解其作用，尽量减少代码注释。

【推荐】使用全称，不使用缩写。相对于简洁的风格，提倡用完整的单词来表达，这样表达的意思更加清晰。示例如下：

  代码                    是否正确规范
  ----------------------- ----------------------------------------
  insertObject:atIndex:   正确
  insert:at:              不清晰，没有说明插入什么，插到哪里
  removeObjectAtIndex:    正确
  removeObject:           正确，因为⽅法是⽤来移除作为参数的对象
  remove:                 不清晰，没有说明要移除什么

### 3.1.2 一致性

一致性要求整个工程的命名风格要保持一致性，最好和苹果 SDK
的代码保持统一。不同类中完成相似功能的方法应该名称一致，比如用 count
来返回集合的个数，不能在 A 类中使用 count 而在 B 类中使用 getNumber 。

【推荐】尽可能与 Cocoa
编程接⼝命名保持一致。如果不太确定某个命名的⼀致性，请浏览头文件或参考文档中的范例，在使⽤多态方法的类中，命名的⼀致性⾮常重要。在不同类中实现相同功能的⽅法应该具有同的名称。示例如下：

  代码                                    点评
  --------------------------------------- -----------------------------------------
  -- (NSInteger)tag                       在 NSView， NSCell， NSControl 中有定义
  -- (void)setStringValue:(NSString \*)   在许多 Cocoa classes 中都有定义

### 3.1.3 不自我指涉

通俗的讲，自我指涉是指在变量末尾增加了自己类型的一个后缀。

  命名             说明
  ---------------- --------------------
  NSString         规范的写法
  NSStringObject   自我指涉（不规范）

掩码常量、通知除外：

  命名                                   说明
  -------------------------------------- ------------
  NSUnderlineByWordMask                  规范的写法
  NSTableViewColumnDidMoveNotification   规范的写法

3.2 文件命名
------------

### 3.2.1 项目名称

【强制】项目名称遵循大驼峰命名。例如：

AoRiseProject。

### 3.2.2 包名定义

【强制】Bundle
Identifier采用反域名命名规范，全部用小写字母，以域名后缀+公司顶级域名+应用名形式命名，例如：

com.rogrand.dianbangbang

### 3.2.3 文件夹命名

【强制】工程文件夹命名保证与真实文件目录路径对应。

【推荐】文件夹命名使用相应模块结构分层的英文，首字母要大写。例如：

Model，View，Controller，Tool，Other，Service

### 3.2.4 代码文件命名

【推荐】文件的扩展名遵循如下设定:

  文件名规范   文件类型
  ------------ ------------------------------
  .h           C / C++ / Objective-C 头文件
  .m           Objective-C 实现文件
  .mm          Objective-C / C++ 实现文件
  .cc          纯 C++ 实现文件
  .c           纯 C 实现文件

【强制】分类的文件名应该包含被扩展的类名，例如：

NSString+DKUtils.h

NSTextView+DKAutocomplete.h

### 3.2.5 资源文件命名

【强制】资源文件名以小写字符、下划线命名，加前缀区分。所有的资源文件都需要加上工程前缀（小写）。

【推荐】命名模式设定：

加后缀\_small表示小图

加后缀\_big表示大图

【推荐】逻辑名称可由多个单词加下划线组成，采用以下规则：

用途\_模块名\_逻辑名称

用途\_模块名\_颜色

用途\_逻辑名称

用途\_颜色

  说明         前缀（工程前缀示例MW）   示例
  ------------ ------------------------ --------------------------------------------------------
  按钮相关     mw\_btn\_                mw\_btn\_home\_normal、mw\_btn\_red，mw\_btn\_red\_big
  背景相关     mw\_btn\_                mw\_bg\_home\_header、mw\_bg\_main
  图标相关     mw\_ic\_                 mw\_ic\_home\_location、mw\_bg\_input
  分割线相关   mw\_div\_                mw\_ic\_home\_location、mw\_bg\_input
  默认相关     mw\_def\_                mw\_ic\_home\_location、mw\_bg\_input

3.3 代码命名
------------

### 3.3.1 通用命名规则

Objective-C 的命名通常比较长，
命名规则一般遵循驼峰式命名法。即成员变量命名用小驼峰，类名命名用大驼峰。

小驼峰规则：第一个单词首字母小写，其余单词的首字母都大写。例：nameTextField。

大驼峰规则：每个单词的首字母大写。例：NameTextField。

代码中的命名严禁使用拼音与英文混合的方式，更不允许直接使用中文的方式。正确的英文拼写和语法可以让阅读者易于理解，避免歧义。

\*注意：即使纯拼音命名方式也要避免采用。但beijing、youku、hangzhou等国际通用的名称，可视同英文.

一般情况下，通用命名规则适用于变量、常量、属性、参数、方法、函数等。非一般情况，具体规范有如下列举：

【强制】驼峰命名方式。参数名、成员变量、局部变量、属性名都要采用小写字母开头的驼峰命名方式。如果方法名以一个众所周知的大写缩略词开始，可以不适用驼峰命名方式。比如FTP、WWW等。

【强制】自我描述性。属性/函数/参数/变量/常量/宏
的命名必须具有自我描述性。杜绝中文拼音、过度缩写、或者无意义的命名方式。

【强制】禁止自我指涉。属性/局部变量/成员变量不要自我指涉。通知和掩码常量(通常指那些可以进行按位运算的枚举值)
除外。

【推荐】一致性。属性/函数/参数/变量/常量/宏
的命名应该具有上下文或者全局的一致性，相同类型或者具有相同作用的变量的命名方式应该相同或者类似。

说明：具体来讲，不同文件中或者不同类中具有相同功能或相似功能的属性的命名应该是相同的或者相似的。好处在于：方便后来的开发者减少代码的阅读量和提高对代码的理解速度。
比如：

//
count同时定义在NSDictionary、NSArray、NSSet这三个集合类中。且这三个集合类中的count属性都代表同一个意思，即集合中对象的个数。

\@property (readonly) NSUInteger count;

【强制】清晰性。属性/函数/参数/变量/常量/宏
的命名应该保持清晰+简洁，如果鱼和熊掌不能兼得，那么清晰更重要。

  命名                    说明
  ----------------------- ------------------------------------------
  insertObject:atIndex:   规范的写法
  insert:at:              不清晰，插入什么？at代表什么？
  removeObjectAtIndex:    规范的写法
  removeObject:           规范的写法，因为参数指明了要移除一个对象
  remove:                 不清晰，移除什么？

【推荐】一般情况下，不要缩写或省略单词，建议拼写出来，即使它有点长。当然，在保证可读性的同时，for循环中遍历出来的对象或者某些方法的参数可以缩写。

  命名                   说明
  ---------------------- ----------
  destinationSelection   规范写法
  destSel                不清晰
  setBackgroundColor:    规范写法
  setBkgdColor:          不清晰

### 3.3.2 缩写规范

通常情况下不应该缩写命名(参考[General
Principles](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingBasics.html%23//apple_ref/doc/uid/20001281-1001751))，但众所周知的缩写可以继续使用。

在其他情况下，我们需要遵循下面两条缩写建议：

-   允许使用那些在C语言时代就已经在使用的缩写，比如alloc和getc；

-   命名参数可以使用缩写；

-   其他情况，尽量不要缩写。

计算机行业通用的缩写也可以继续使用，包括但不限于HTML、URL、RTF、HTTP、TIFF、JPG、PNG、GIF、LZW、ROM、RGB、CMYK、MIDI、FTP。

主要参考文档: [[Cocoa guide
可接受的缩略语和首字母缩略词]](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/APIAbbreviations.html#//apple_ref/doc/uid/20001285-BCIHCGAE)

【推荐】非必要时不使用缩写，以保证语义表达清晰原则。

说明：Objective-C
提倡代码阅读时具备自描述特征。变量，常量，特别是方法名相对其他语言来说会相对长一点，其用意是为了表达更加清晰明了，尽量让阅读不产生歧义，且基本能达到代码字描述作用。所以应该严格遵守语言的设计风格，保持一致，能有效的提高协同开发的效率，提高可维护性。2.

### 3.3.3 Method命名

【强制】方法名采用小写字母开头的驼峰命名方式。如果方法名以一个中所周知的大写缩略词开头（比如HTTP），该规则可以忽略。

【推荐】除了特定类的命名，一般情况不在方法名称中使用前缀。

【推荐】类、协议、函数、常量、枚举等全局可见内容需要添加三个字符作为前缀。苹果保留对任意两个字符作为前缀的使用权，所以尽量不要使用两个字符作为前缀。禁止使用的前缀包括但不限于：NS，UI，CG，CF，CA，WK，MK，CI，NC。

【强制】禁止在方法前面加下划线" \_
"。Apple官网团队经常在方法前面加下划线"\_\"。为了避免方法覆盖，导致不可预知的意外，禁止在方法前面加下划线。

【强制】自我描述性。方法的命名应该具有自我描述性。杜绝中文拼音、过度缩写、或者无意义的命名方式。

【推荐】一致性。方法的命名应该具有上下文或者全局的一致性，相同类型或者具有相同作用的方法的命名方式应该相同或者类似。如下：

// 该方法同时定义在NSView、NSControl、NSCell这三个类里面。

(NSInteger)tag;

// 该属性同时定义在NSDcitionary和NSArray中。

\@property (readonly) NSUInteger count;

【强制】如果一个方法代表某个名词执行的动作，则该方法应该以一个动词开头。如下：

\- (void)invokeWithTarget:(id)target;

\- (void)selectTabViewItem:(NSTabViewItem \*)tabViewItem

【强制】如果方法代表对象接收的动作，那么方法名以动词开头。但不要使用"do"或者"does\"作为方法名称的一部分，因为这些助动词不能为方法名称增加太多的意义，反而让方法看起来更加臃肿。同时，也不要在动词前面使用副词或者形容词。

【强制】如果方法返回接收者的某个属性，就以属性名作为方法名。如果方法间接的返回一个或多个值，可以使用"getxxx"的形式命名。其他情况则无需在方法名前面额外添加"get\"。

  命名                       说明
  -------------------------- ----------
  \- (NSSize)cellSize;       规范写法
  \- (NSSize)calcCellSize;   不规范
  \- (NSSize)getCellSize;    不规范

【强制】只有当方法间接的返回对象或数值，才有必要在方法名称中使用"get"，这种格式只适用于返回多个数据项的情况。如下：

// 通过传入指针，来获得多个值：

-   (void)getLineDash:(float \*)pattern count:(int\*)count phase:(float
    \*)phase;

// NSURLCache (NSURLSessionTaskAdditions)中声明的方法：

\- (void)getCachedResponseForDataTask:(NSURLSessionDataTask \*)dataTask
completionHandler:(void (\^) (NSCachedURLResponse \* \_\_nullable
cachedResponse))completionHandler;

【强制】所有参数前面都应该添加关键字，除非你能保证每个人都能意会到你的隐含意义。

  命名                                                                               说明
  ---------------------------------------------------------------------------------- ----------
  \- (void)sendAction:(SEL)aSelector toObject:(id)anObject forAllCells:(BOOL)flag;   规范写法
  \- (void)sendAction:(SEL)aSelector :(id)anObject :(BOOL)flag;                      不推荐

【推荐】参数之前的单词尽量能描述参数的意义。

  命名                                  说明
  ------------------------------------- ----------
  \- (id)viewWithTag:(NSInteger)aTag;   规范写法
  \- (id)taggedView:(int)aTag;          不规范

【强制】如果当前子类创建的方法比从父类继承来的方法更加具体明确。本身提供的方法更具有针对性。则不该重写类本身提供的方法。而是应该单独的提供一个方法，并在新的方法后面添加上必要的关键参数。

  命名                                                                                                                                          说明
  --------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------
  \- (id)initWithFrame:(CGRect)frameRect;                                                                                                       NSView， UIView.
  \- (id)initWithFrame:(NSRect)frameRect mode:(int)aMode cellClass:(Class)factoryId numberOfRows:(int)rowsHigh numberOfColumns:(int)colsWide;   NSMatrix， a subclass of NSView

// UIView提供的方法

\- (instancetype)initWithFrame:(CGRect)frame

// 更具针对性的方法

\- (instancetype)initWithFrame:(CGRect)frame mode:(int)aMode
cellClass:(Class)factory Id numberOfRows:(int)rows
numberOfColumns:(int)cols;

【推荐】不要使用"and"连接接收者属性。尽管and在下面的例子中读起来还算顺口，但随着你创建的方法参数的增加，这将会带来一系列的问题。

  命名                                                                                                       说明
  ---------------------------------------------------------------------------------------------------------- ----------
  \- (int)runModalForDirectory:(NSString \*)path file:(NSString \*) name types:(NSArray \*)fileTypes;        规范写法
  \- (int)runModalForDirectory:(NSString \*)path andFile:(NSString \*)name andTypes:(NSArray \*)fileTypes;   不规范

【推荐】如果方法描述了两个独立的动作，可以使用"and"连接起来。

  命名                                                                                                     说明
  -------------------------------------------------------------------------------------------------------- ----------------------------
  \- (BOOL)openFile:(NSString \*)fullPath withApplication:(NSString \*)appName andDeactivate:(BOOL)flag;   规范写法 （NSWorkspace. ）

### 3.3.4 Accessor命名

Accessor Methods是指set、get方法。这些方法有一些推荐写法格式：

【推荐】如果属性是名词，推荐格式如下：

\- (type)noun;

\- (void)setNoun:(type)aNoun;

例如：

\- (NSString \*)title;

\- (void)setTitle:(NSString \*)aTitle;

【推荐】如果属性表示一个形容词，推荐格式如下：

\- (BOOL)isAdjective;

\- (void)setAdjective:(BOOL)flag;

例如：

\- (BOOL)isEditable;

\- (void)setEditable:(BOOL)flag;

【推荐】如果属性是一个动词，动词使用一般现在时。推荐格式如下：

\- (BOOL)verbObject;

\- (void)setVerbObject:(BOOL)flag;

例如：

\- (BOOL)showsAlpha;

\- (void)setShowsAlpha:(BOOL)flag;

【强制】不要把动词的过去分词形式当做形容词来使用。

  命名                                        说明
  ------------------------------------------- ----------
  \- (void)setAcceptsGlyphInfo:(BOOL)flag;    规范写法
  \- (BOOL)acceptsGlyphInfo;                  规范写法
  \- (void)setGlyphInfoAccepted:(BOOL)flag;   不规范
  \- (BOOL)glyphInfoAccepted;                 不规范

  命名                                          说明
  --------------------------------------------- ----------
  \- (void)setCanHide:(BOOL)flag;               规范写法
  \- (BOOL)canHide;                             规范写法
  \- (void)setShouldCloseDocument:(BOOL)flag;   规范写法
  \- (BOOL)shouldCloseDocument;                 规范写法
  \- (void)setDoesAcceptGlyphInfo:(BOOL)flag;   不规范
  \- (BOOL)doesAcceptGlyphInfo;                 不规范

【推荐】可以使用情态动词（can、should、will等）明确方法意义，但不要使用do、does这类无意义的情态动词。

  命名                                          说明
  --------------------------------------------- ----------
  \- (void)setCanHide:(BOOL)flag;               规范写法
  \- (BOOL)canHide;                             规范写法
  \- (void)setShouldCloseDocument:(BOOL)flag;   规范写法
  \- (BOOL)shouldCloseDocument;                 规范写法
  \- (void)setDoesAcceptGlyphInfo:(BOOL)flag;   不规范
  \- (BOOL)doesAcceptGlyphInfo;                 不规范

【推荐】只有方法间接的返回一个数值，或者需要多个数值需要被返回的时候，才有必要在方法名称中使用"get"。像下面这种接收多个参数的方法应该能够传入nil，因为调用者未必对每个参数都感兴趣

-   (void)getLineDash:(float \*)pattern count:(int \*)count phase:(float
    \*)phase;

### 3.3.5 Parameter命名

【强制】不要使用 "pointer" 或 "ptr"
命名参数，应该使用参数类型而非它的名字来代表他是否是一个指针。参考
\[[[Method
Arguments]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html)\]

### 3.3.6 Delegate命名

delegate methods 又叫做delegation
methods，如果delegate对象实现了另一个对象的delegate方法，那么这个对象就可以在它自己某个指定的事件发生时调用delegate对象的delegate方法。delegate方法的命名有一些与众不同的格式：

【推荐】以触发消息的对象名开头，省略类名前缀并且首字母小写。如下：

\- (BOOL)tableView:(NSTableView \*)tableView shouldSelectRow:(int)row;

\- (BOOL)application:(NSApplication \*)sender openFile:(NSString
\*)filename;

【推荐】除非delegate方法只有一个参数，即触发delegate方法调用的delegating对象，否则冒号是紧跟在类名后面的。如下：

\- (BOOL)applicationOpenUntitledFile:(NSApplication \*)sender;

【推荐】发送通知后再触发delegate方法是一个例外：当delegate方法的调用是为了告诉delegate对象，某个通知已经被发送时，这个delegate方法的参数应该是通知对象，而非触发delegate方法的对象。如下：

\- (void)windowDidChangeScreen:(NSNotification \*)notification;

【推荐】使用did或will这两个情态动词通知delegate对象某件事已经发生或将要发生。

\- (void)browserDidScroll:(NSBrowser \*)sender;

\- (NSUndoManager \*)windowWillReturnUndoManager:(NSWindow \*)window;

【推荐】虽然我们可以在delegate方法中使用did和will来询问delegate是否可以代替另一个对象做某件事情，但是使用should看起来更加完美。如下：

\- (BOOL)windowShouldClose:(id)sender;

### 3.3.7 Private命名

大部分情况下，私有方法的命名和公有方法的命名规则是一样的，但通常情况下应该给私有方法添加一个前缀，目的是和公有方法区分开。尽管这样，这种给私有方法加前缀的命名方式有可能引起一些奇怪的问题。例如：当从Cocoa
framework（即Cocoa系统库）中的某个类派生出来一个子类时，并不知道该子类中定义的私有方法是否覆盖了父类的私有方法，即有可能在子类中实现的私有方法和父类中的某个私有方法同名，在运行时极有可能导致一些莫名其妙的问题，并且极难调试追踪问题。

Cocoa frameworks（Cocoa系统库）中的私有方法通常以一个下划线" \_
"开头，用于标记这些方法是私有的(比如， \_fooData )
，这大概是Apple工程师的开发习惯。基于这个事实，提供以下两条建议：

【强制】禁止使用下划线" \_
"作为私有方法的开头。Apple已经预留这种私有方法的命名习惯。

【推荐】如果要子类化Cocoa
Frameworks中的一个非常庞大复杂的类（比如NSView或UIView），并且想要绝对确保子类中的私有方法名和父类中的私有方法名不重复，可以添加一个自定义前缀作为私有方法的前缀，这个自定义前缀应该尽可能的独特，可以基于公司或者项目的缩写，比如"XX\_"。

【强制】不要在参数的名称中使用"pointer"或者"ptr\"。应该使用参数的类型来说明参数是否是一个指针。

【强制】不要使用一到两个字符作为参数名。

【强制】不要对参数的每个单词都缩写。

【推荐】如果调用某个方法是为了通知delegate某个事件\"即将\"发生或者\"已经\"发生，则请在方法名称中使用"will"或者"did"这样的助动词。例如：

\- (void)applicationWillResignActive:(UIApplication \*)application;

\- (void)applicationDidEnterBackground:(UIApplication \*)application;

【推荐】如果调用某个方法是为了要求delegate代表其他对象执行某件事情，应该在方法中使用"should"这样的情态动词。当然，也可以在方法中使用"did"或者"will"这样的字眼，但前者更优。例如：

\- (BOOL)tableViewSholdScroll:(id)sender;

### 3.3.8 Category命名

【强制】category中不要声明属性和成员变量。

【强制】避免category中的方法覆盖系统方法。可以使用前缀来区分系统方法和category方法。但前缀不要仅仅使用下划线"\_"。

【推荐】如果一个类比较复杂，建议使用category的方式组织代码。具体可以参考UIView。

### 3.3.9 Class命名

【强制】class的名称应该由两部分组成，前缀+名称。即class的名称应该包含一个前缀和一个名词。

### 3.3.10 Protocol命名

【推荐】有时候protocol只是声明了一堆相关方法，并不关联class。这种不关联class的protocol使用ing形式以和class区分开来。比如NSLocking而非NSLock。

  命名        说明
  ----------- --------------------------
  NSLocking   规范写法
  NSLock      不好，看起来像是一个类名

  命名                  说明
  --------------------- ----------
  UITableViewDelegate   规范写法
  NSObjectProtocol      规范写法

【推荐】如果proctocol不仅声明了一堆相关方法，还关联了某个class。这种关联class的protocol的命名取决于关联的class，然后再后面再加上protocol或delegate用于显示的声明这是一份协议。

  命名                  说明
  --------------------- ----------
  UITableViewDelegate   规范写法
  NSObjectProtocol      规范写法

### 3.3.11 Notification命名

【推荐】
如果一个类声明了delegate属性，通常情况下，这个类的delegate对象可以通过实现的delegate方法收到大部分通知消息。那么，这些通知的名称应该反映出对应的delegate方法，比如application对象发送的NSApplicationDidBecomeActiveNotification通知和对应的applicationDidBecomeActive:消息。这也算是命名的一致性要求。

【强制】notification的命名使用全局的NSString字符串进行标识。命名规则：

\[Name of associated class\] + \[Did \| Will\] + \[UniquePartOfName\] +
Notification

例如：

NSApplicationDidBecomeActiveNotification

NSWindowDidMiniaturizeNotification

NSTextViewDidChangeSelectionNotification

NSColorPanelColorDidChangeNotification

【强制】object通常是指发出notification的对象，如果在发送notification的同时要传递一些额外的信息，请使用userInfo，而不是object。

【强制】如果某个通知是为了告知外界某个事件\"即将\"发生或者\"已经\"发生，则请在通知名称中使用"will"或者"did"这样的助动词。例如：

UIKeyboardWillChangeFrameNotification;

UIKeyboardDidChangeFrameNotification;

### 3.3.12 Constant命名

参考
[[Constants]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingIvarsAndTypes.html)

#### 3.3.12.1 枚举常量

【强制】使用枚举类型来表示一组相关的整型常量。

【推荐】枚举常量和typedef定义的枚举类型的命名规范同函数的命名规范一致。

参考 [[Naming
Functions]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingFunctions.html#//apple_ref/doc/uid/20001283-BAJGGCAD)

例如：

typedef enum \_NSMatrixMode {

   NSRadioModeMatrix           = 0，

   NSHighlightModeMatrix       = 1，

   NSListModeMatrix            = 2，

   NSTrackModeMatrix           = 3

} NSMatrixMode;

注意：上面枚举typeof中的\_NSMatrixMode是无用的。

可以像位掩码(bit masks)一样创建一个匿名枚举，如下：

enum {

   NSBorderlessWindowMask      = 0，

   NSTitledWindowMask          = 1 \<\< 0，

   NSClosableWindowMask        = 1 \<\< 1，

   NSMiniaturizableWindowMask  = 1 \<\< 2，

   NSResizableWindowMask       = 1 \<\< 3

};

#### 3.3.12.2 使用const关键字创建常量

【强制】使用const关键字创建浮点型常量，也可以使用const来创建和其他常量不相关的整型常量，否则请使用枚举类型来创建（如果一个整型常量和其他常量不相关，可以使用const来创建，否则使用枚举类型表示一组相关的整型常量）。以下例子声明了const常量的格式：

const float NSLightGray;

#### 3.3.12.3 其他常量类型

【强制】通常情况下，不要使用\#define预处理命令(preprocessor
command)创建常量。如上面所说：使用枚举创建整型常量；使用const修饰符创建浮点型常量。

【强制】有些符号需要使用大写字母标识。预处理器需要根据这个符号进行计算以便决定是否要对某一块代码进行处理。比如：

\#ifdef DEBUG

需要注意那些编译器定义的宏，左侧和右侧各有两个下划线。如下：

\_\_MACH\_\_

【强制】通知的名字和字典的key，应该使用字符串常量来定义。使用字符串常量编译器可以进行检查，这样可以避免拼写错误。Cocoa
系统库提供了许多字符串常量的例子，比如：

APPKIT\_EXTERN NSString \*NSPrintCopies;

字符串常量应该在.h头文件中暴露给外部，而字符串常量真正的赋值是在.m文件中。如下：

.h文件

extern NSString \*const
WSNetworkReachablityStatusDidChangedNotification;

.m文件

NSString \* const WSNetworkReachablityStatusDidChangedNotification =
@\"WSNetworkReachablityStatusDidChangedNotification\";

### 3.3.13 Exception命名

参考 [[Notifications and
Exceptions]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingIvarsAndTypes.html)

上面1.1.11节已介绍通知的命名规范。异常和通知的命名遵循相似的规则，但又各有不同。

【强制】和Notification的命名规范一样(可参考1.1.11
Notification命名规范一节)，异常也是用全局的NSString字符串进行标识。命名方式如下：

\[Prefix\] + \[UniquePartOfName\] + Exception

相当于异常由前缀、名称中能够标识异常唯一性的那部分、Exception。如下：

NSColorListIOException

NSColorListNotEditableException

NSDraggingException

NSFontUnavailableException

NSIllegalSelectorException

### 3.3.14 其他命名规范

【推荐】禁止使用拼音命名， 要使用正确的英文拼写进行命名。

【推荐】命名使用驼峰命名法， 类名使用大驼峰命名法，
其余使用小驼峰命名法。

【推荐】属性， 方法， 参数， 变量，
常量等的命名应该具有上下文或者全局的一致性，
相同类型或具有相同作用的变量的命名方式应该相同或相似，
并且保持清晰和简洁。

【推荐】方法， 属性命名小写字母开头(以大写缩略词开始的除外)，
文件夹大写字母开头。

【推荐】自营SDK文件前缀Welab， 其他SDK文件前缀Welab。

【推荐】category中使用wl\_和wb\_前缀与原有方法进行区分。

【推荐】不要使用\_作为私有方法的开头。

【推荐】Target-Action的方法命名时加Action， 使用(id)sender代表触发对象 -
(void)clickAction:(id)sender;

第四章 代码规范
===============

4.1 代码布局和格式
------------------

### 4.1.1 头文件引入

【推荐】按照一定顺序引入头文件：

\#import \<系统库\>

\#import \<第三方\>

\#import \"项目类\"

### 4.1.2 属性 和 私有变量

【推荐】public 和 非public 属性建议放在相应的地方：

\@interface ClassA ()

\@property (nonatomic，strong) NSString \*name;

\@end

【推荐】私有变量建议命名遵循其中一个，为了规避iOS的命名，特性个人推荐第二种方法命名私有变量：

NSString \*\_title;

NSString \*title\_;

### 4.1.3 类内部布局

【推荐】 类内部布局的分割以下例标注作为参考，根据具体情况增删：

\#pragma mark - lifeCycle (这部分写生命周期方法)

\#pragma mark - \<UITableViewDelegate\> (系统的delegate方法)

\#pragma mark - \<CustomDelegate\> (自定义的delegate方法)

\#pragma mark - event response (交互方法)

\#pragma mark - private methods (非公共方法)

\#pragma mark - view getter(lazy) (主要是View懒加载)

\#pragma mark - view setter

\#pragma mark - data getter

\#pragma mark - data setter

【推荐】对于private methods 和 event response
等等只是在本类中调用的方法建议以p\_开头，以后修改能了解其影响范围。例如：

\#pragma mark -private methods

\- (void)p\_didSelectQuestionItem:(NSDictionary \*)questionItem

### 4.1.4 代码格式

参考
[[raywenderlich/objective-c-style-guide]](https://github.com/raywenderlich/objective-c-style-guide)

【推荐】代码格式大部分内容可以通过插件自动格式化，详见[[ClangFormat-Xcode]](https://github.com/travisjeffery/ClangFormat-Xcode)插件使用。

【推荐】遵循如下代码组织形式。

\#pragma mark - Lifecycle

\- (instancetype)init {}

\- (void)dealloc {}

\- (void)viewDidLoad {}

\- (void)viewWillAppear:(BOOL)animated {}

\- (void)didReceiveMemoryWarning {}

\#pragma mark - Custom Accessors

\- (void)setCustomProperty:(id)value {}

\- (id)customProperty {}

\#pragma mark - IBActions

\- (IBAction)submitData:(id)sender {}

\#pragma mark - Public

\- (void)publicMethod {}

\#pragma mark - Private

\- (void)privateMethod {}

\#pragma mark - UITextFieldDelegate

\#pragma mark - UITableViewDataSource

\#pragma mark - UITableViewDelegate

\#pragma mark - NSCopying

\- (id)copyWithZone:(NSZone \*)zone {}

\#pragma mark - NSObject

\- (NSString \*)description {}

说明：以上只是提供了组织代码的一种思路，不排斥其他的组织方式。

【推荐】方法之间空一行， 单个方法不要超过80行，
如果方法过长需要抽出部分代码分步执行。

【推荐】实例方法-和类方法+与(空一格， 方法参数间空一格。

【推荐】方法实现的{和}独占一行， 方法内部的{和}不需要独占一行， 包括if，
switch等， 但是{必须与前一个字符空一格，
block的{需要与参数结尾的)间空一格， void除外。

【推荐】参数个数在两个以内不需要换行对齐，
两个以上需要换行并保证以:对齐(特殊情况除外，
例如:在该行位置过于靠后或换行之后:无法对齐) ，如下：

\- (void)callMethod:(NSString \*)value1

value2:(NSString \*)value2

value3:(NSString \*)value3

{

if (value1) {

return;

}

\[Object callMethodB:value1 value2:value2\];

\[Object callMethodC:value1

block1:\^{

NSLog(@\"a\");

}

block2:\^(NSString \*args2) {

NSLog(@\"a\");

}\];

\[Object callMethodD:value1

block1:\^(NSString \*args1) {

NSLog(@\"a\");

}

block2:\^(NSString \*args2) {

NSLog(@\"a\");

}\];

NSMutableURLRequest \*request = \[NSMutableURLRequest
requestWithURL:reqURL cachePolicy:self.cachePolicy
timeoutInterval:self.timeoutInterval\];

}

【推荐】指针\*与实例名之间没有空格。

【推荐】属性的定义， \@property和(， )和类名， 类名和\*间必须有空格，
必须写明是否原子性， 指针类型 \@property (nonatomic， strong) NSString
\*someString;

【推荐】声明一个变量时， 指针\*靠近变量名 NSString \*someString =
@\"SomeString\";

【推荐】相同功能的代码需要进行封装， 不要使用cv操作

【推荐】使用\#pragma mark -对实现文件进行方法分类：

\#pragma mark - life cycle

\#pragma mark - setter && getter

\#pragma mark - public method

\#pragma mark - action

\#pragma mark - private method

\#pragma mark - delegate && dataSource

【推荐】尽量保持代码的整洁， 不要添加过多无意义的log和注释。

【推荐】所有的方法之间空一行。

【推荐】所有的代码块之间空一行，删除多余的注释。

【推荐】所有自定义的方法需要给出注释。

【推荐】尽量使用懒加载，在控制器分类时有提及和要求，其它自定义类按照控制器格式分类，没有的分类不写即可。

【推荐】代码后的'{'不需要独占一行，包括方法之后，if，switch等。

【强制】统一要求属性的定义在property之后空一格，括号之后空一格，写上类名，空一格之后跟上\*和属性名。如下：

\@property (nonatomic， strong) UITableView \*tableView;

\@property (nonatomic， strong) DeliveryModel \*delivery;

\@property (nonatomic， strong) DeliveryLookAdapter \*lookAdapter;

\@property (nonatomic， strong) DeliveryLookAPIManager \*lookManager;

【推荐】遵循一般代码规范，与苹果API风格保持一致。

【强制】定时删除不用的代码和注释。

【推荐】如果有方法一直不会用到，请删除（除工具类）。

【推荐】没有执行任何业务逻辑的方法，请删除或给予注释，删除多余的资。源或文件，添加必要的注释。

【推荐】比较大的代码块需要给出注释。

4.2 代码注释
------------

最好的代码是不需要注释，尽量通过合理的命名、良好的代码组织把含义表达清楚，在必要的地方添加注释，注释需要与代码同步更新。

　属性注释

　　例子：

　　　　/// 学生

　　　　\@property (nonatomic， strong) Student \*student;

#### 　方法声明注释：

/\*\*

　　\* \@brief 登录验证

　　\*

　　\* \@param personId 用户名

　　\* \@param password 密码

　　\* \@param complete 执行完毕的block

　　\*

　　\* \@return

　　\*/

　　+ (void)loginWithPersonId:(NSString \*)personId password:(NSString
\*)password complete:(void (\^)(CheckLogon \*result))complete;

【强制】如果方法、函数、类、属性等需要提供给外界或者他人使用，必须要加注释说明。

【强制】如果代码以SDK的形式提供给其他工程调用，必须对暴露给外界的所有方法、属性、参数加以注释说明。

【推荐】注释应该说明其作用以及注意事项(如果有)。

【推荐】遵循代码即注释的编程要求。设计方法、属性和代码逻辑本身应具有自我描述性，注释应简明明扼。

【推荐】头文件中的注释使用option + command +
/快速生成Xcode默认格式注释。

【推荐】实现文件中的注释使用//

【推荐】使用//注释时， 与注释内容间空一格。

【推荐】在关键地方做好注释。

### 4.2.1 类的注释

【推荐】类的注释保持如下形式：

//

// MyViewController.m

// text

//

// Created by 林霞 on 2017/9/12.

// Copyright © 2017年 林霞 1826692128\@qq.com. All rights reserved.

//

该注释是自动生成的，在xcode中设置即可。

Created by 电脑用户名on 创建该文件的时间。

Copyright 2017
后面的名字和邮箱是自己填写和设置的。具体可在xcode工程，Project
Document中设置。这样便可在每次新建类的时候自动加上该头注释。

### 4.2.2 方法注释

【推荐】方法注释，方法外部统一用option + command +
/，方法内部统一用//注释。如下:

/\*\*

测试

\*/

\- (void)text

{

//测试按钮事件响应

}

### 4.2.3 模型注释

【推荐】每个model中的，包含的每个属性，都必须要写上相对应的注释，用///注释。阅读者一看这个model，就清楚知道model中的每个字段代表的意思，用来做什么事情的。

\@interface DeliveryModel : NSObject

///提货劵所在商圈id

\@property (nonatomic， assign) long long mallId;

///商圈全称

\@property (nonatomic， copy) NSString \*mallFullName;

///商圈简称

\@property (nonatomic， copy) NSString \*mallShortName;

///提货劵号

\@property (nonatomic， copy) NSString \*credentialsCode;

///总金额

\@property (nonatomic， assign) NSInteger totalAmount;

///提货劵所在店铺id

\@property (nonatomic， assign) long long storeId;

///货劵所在店铺名称

\@property (nonatomic， copy) NSString \*storeName;

///提货劵id

\@property (nonatomic， strong) NSNumber \*credentialsId;

///状态:0：未提货、1：已提货、2：已分享、3：已退款

\@property (nonatomic， assign) NSInteger state;

///提货商品(以下为提货商品参数)

\@property (nonatomic， strong) NSArray\<DeliveryGoodslist \*\>
\*goodsList;

///二维码

\@property (nonatomic， copy) NSString \*qrCode;

///商品总个数

\@property (nonatomic， assign) NSInteger goodsCount;

\@end

说明：如果不是model的属性，是其它类属性，需要注释，请按照model属性注释方式。

4.3 编程细则
------------

### 4.3.1 Initialize

参考 [[Tips and Techniques for Framework
Developers]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/FrameworkImpl.html)

(void)initialize类方法先于其他的方法调用。且initialize方法提供了一个让代码once、lazy执行的地方。initialize通常被用于设置class的版本号(参考
[[Versioning and
Compatibility]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/FrameworkImpl.html#//apple_ref/doc/uid/20001286-1001777))。
initialize方法的调用遵循继承规则(子类方法中可以调用到父类的同名方法，即使没有调用\[super
xxx\])。如果我们没有实现initialize方法，运行时初次调用这个类的时候，系统会沿着继承链(类继承体系)，先后给继承链上游中的每个超类发送一条initialize消息，直到某个超类实现了initlialize方法，才会停止向上调用。因此，在运行时，某个类的initialize方法可能会被调用多次(比如，如果一个子类没有实现initialize方法)。
比如有三个类：SuperClass、SubClass和FinalClass。他们的继承关系是FinalClass-\>SubClass-\>SuperClass，现只实现了SuperClass方法的initialize方法：

// SuperClass

\@implementation SuperClass

\+ (void)initialize {

   NSLog(@\"superClass initalize\");

}

\@end

// 初始化FinalClass

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   FinalClass \*finalC = \[FinalClass new\];

}

控制台输出结果：

2019-11-27 22:11:03.130365+0800 Demo\[67162:11721965\] superClass
initalize

2019-11-27 22:11:03.130722+0800 Demo\[67162:11721965\] superClass
initalize

2019-11-27 22:11:03.130815+0800 Demo\[67162:11721965\] superClass
initalize

解释：

因为FinalClass继承自SubClass，SubClass继承自SuperClass，继承体系中只有SuperClass实现了initialize方法，导致初始化FinalClass这个子类时，FinalClass会调用他的父类(SubClass)中的initialize方法。又因为(FinalClass)的父类(SubClass)也没有实现initialize方法，会继续沿着继承体系，向上游寻找，最后找到SubClass的父类(SuperClass)，而SuperClass实现了这个initialize方法，至此调用结束。连续调用了三次SuperClass的initialize方法的原因是：子类FinalClass的初始化触发了超类SubClass、SuperClass的初始化。所以初始化FinalClass时，实际上使这三个类都得到了初始化的机会，自然就会连续调用三次SuperClass的initialize方法。

还是上面那三个类，如果我们又给SubClass实现了initialize方法，那么控制台将会输出如下结果：

2019-11-27 22:34:54.697952+0800 Load\[67652:11780578\] superClass
initalize

2019-11-27 22:34:54.698118+0800 Load\[67652:11780578\] subClass
initialize

2019-11-27 22:34:54.698472+0800 Load\[67652:11780578\] subClass
initialize

基于上面事实建立如下约定：

【强制】如果我们想要让initialize方法仅仅被调用一次，那么需要借助于GCD的dispatch\_once()。如下：

\+ (void)initialize {

   static dispatch\_once\_t onceToken = 0;

   dispatch\_once(&onceToken， \^{

       // the initializing code

  }

}

【推荐】如果想在继承体系的某个指定类的initialize方法中执行一些初始化代码，可以使用类型检查和而非dispatch\_once()。如下：

if (self == \[NSFoo class\]) {

   // the initializing code

}

总而言之，由于任何子类都会调用父类的initialize方法，可能会导致某个父类的initialize方法会被调用多次。我们可以使用类型判等或dispatch\_once()这两种方式避免这种情况，以保证initialize中的代码不会被无辜调用。

initialize是由系统自动调用的方法，我们不应该显示或手动调用initialize方法，如果要触发某个类的初始化行为，应该调用这个类的一些无害的方法。比如：

\[NSImage self\];

### 4.3.2 Init方法

Objective-C有designated Initializers和secondary
Initializers的概念。designated
Initializers叫做指定初始化方法。《Effective Objective-C 2.0
编写高质量iOS 与 OS X代码的52个有效方法》中将designated
Initializers翻译为"全能初始化方法"。designated
Initializers方法是指类中为对象提供必要信息以便其能完成工作的初始化方法。一个类可以有一个或者多个designated
Initializers。但是要保证所有的其他secondary
initializers都要调用designated Initializers，即只有designated
Initializers才会存储对象的信息。其好处是：当这个类底层的某些数据存储机制发生变化时(可能是一些property的变更)，只需要修改这个designated
Initializers内部的代码即可，无需改动其他secondary
Initializers初始化方法的代码。

【强制】所有secondary 初始化方法都应该调用designated 初始化方法。

【强制】所有子类的designated初始化方法都要调用父类的designated初始化方法。使这种调用关系沿着类的继承体系形成一条链。

【强制】如果子类的designated初始化方法与超类的designated初始化方法不同，则子类应该覆写超类的designated初始化方法。（因为开发者很有可能直接调用超类的某个designated方法来初始化一个子类对象，这样也是合情合理的，但使用超类的方法初始化子类，可能会导致子类在初始化时缺失一些必要信息）。

【强制】如果超类的某个初始化方法不适用于子类，则子类应该覆写这个超类的方法，并在其中抛出异常。

【强制】禁止子类的designated初始化方法调用父类的secondary初始化方法。否则容易陷入方法调用死循环。如下：

// 超类

\@interface ParentObject : NSObject

\@end

\@implementation ParentObject

   //designated initializer    

   - (instancetype)initWithURL:(NSString\*)url title:(NSString\*)title {

       if (self = \[super init\]) {

           \_url = \[url copy\];

           \_title = \[title copy\];

      }

       return self;

  }

   //secondary initializer

   - (instancetype)initWithURL:(NSString\*)url {

       return \[self initWithURL:url title:nil\];

  }

   \@end

// 子类

\@interface ChildObject : ParentObject

\@end

   \@implementation ChildObject

   //designated initializer

   - (instancetype)initWithURL:(NSString\*)url title:(NSString\*)title {

       //在designated intializer中调用 secondary initializer，错误的

       if (self = \[super initWithURL:url\]) {

      }

       return self;

  }

   \@end

\@implementation ViewController

   - (void)viewDidLoad {

      \[super viewDidLoad\];

       // 这里会死循环

       ChildObject\* child = \[\[ChildObject alloc\]
initWithURL:@\"url\" title:@\"title\"\];

  }

   \@end

【强制】禁止在init方法中使用self.xxx的方式访问属性。如果存在继承的情况下，很有可能导致崩溃。参考
[[《为什么不能在init和dealloc函数中使用accessor方法》]](https://www.jianshu.com/p/3cf3f5007243)

### 4.3.3 Init error

好的初始化方法应该具备一些必要的容错功能，基于此建立以下约定：

【强制】调用父类的designated初始化方法初始化本类的对象。

【强制】校验父类designated初始化方法返回的对象是否为nil。

【推荐】如果初始化当前对象的时候发生了错误，应该给予对应的处理：释放对象，并返回nil。

以下实例列举类初始化阶段可能会存在的错误：

\- (id)init {

   self = \[super init\];  // Call a designated initializer here.

   if (self != nil) {

       // Initialize object \...

       if (someError) {

           \[self release\];

           self = nil;

       }

   }

   return self;

}

### 4.3.4 dealloc

【强制】不要忘记在dealloc方法中移除通知和KVO。

【推荐】dealloc 方法应该放在实现文件的最上面，并且刚好在 \@synthesize 和
\@dynamic 语句的后面。在任何类中，init 都应该直接放在 dealloc
方法的下面。

【强制】在dealloc方法中，禁止将self作为参数传递出去，如果self被retain到下个runloop周期再释放，则会造成多次释放crash。如下：

-(void)dealloc{

  \[self unsafeMethod:self\];

}

因为当前已经在self这个指针所指向的对象的销毁阶段，销毁self所指向的对象已经在所难免。如果在unsafeMethod:中把self放到了autorelease
poll中，那么self会被retain住，计划下个runloop周期在进行销毁。但是dealloc运行结束后，self所指向的对象的内存空间就直接被回收了，但是self这个指针还没有销毁(即没有被置为nil)，导致self变成了一个名副其实的野指针。在下一个runloop周期，因为self所指向的对象已经被销毁，会因为非法访问而造成crash问题。

【强制】和init方法一样，禁止在dealloc方法中使用self.xxx的方式访问属性。说明：

如果存在继承的情况下，有可能由于面向对象的继承、多态特性与accessor可能造成的副作用联合导致导致崩溃。继承和多态使父类实现在调用accessor时，调用到子类重写的accessor，然而子类可能部分并未完全初始化或已经销毁，因此会引起一系列的逻辑问题甚至崩溃。

所以在init和dealloc中使用accessor是存在风险的。但这并不代表百分之百的崩溃或者错误。从目前实践来看，存在继承时，在init或者dealloc方法中使用accessor会存在很高的风险，所以需要将苹果所说的Don't
Use Accessor Methods in Initializer Methods and
dealloc当作一条编程规范，才能从根本上规避这个问题。

不过有些特殊场景需要破例访问accessor。比如待初始化的实例变量声明在超类中，不能在子类中访问此实例变量时，就只能通过setter来对实例变量赋值；或者当一个实例变量是lazy（懒加载）的，就必须通过getter方法访问属性，否则无法给实例变量赋值。

参考
[[《为什么不能在init和dealloc函数中使用accessor方法》]](https://www.jianshu.com/p/3cf3f5007243)

### 4.3.5 Block

【强制】调用block时需要对block判空。

【强制】注意block潜在的引用循环。

### 4.3.6 Notification

前面的命名规范1.1.11章节已经介绍了通知的命名规范，这里解释的是通知的使用规范：

【强制】具体编码时应把通知作为备选项而非首选项，必须考虑有没有更好的办法来代替这个通知。说明：

通知在开发中能够实现一对多的通信，所有可以使用delegate和block实现的通信和传值，都可以使用通知实现。正因通知功能如此灵活，我们需要清楚通知适合使用的场景，避免把通知和delegate以及block等进行混淆，或者通知满天飞的现象。

【强制】post通知时，object通常是指发出notification的对象，如果在发送notification的同时要传递一些额外的信息，请使用userInfo，而不是object。

【强制】NSNotificationCenter在iOS8及更老的系统有一个多线程bug，selector执行到一半可能会因为self的销毁而引起crash，解决的方案是在selector中使用weak\_strong\_dance。如下：

\- (void)onMultiThreadNotificationTrigged:(NSNotification \*)notify {

   \_\_weak typeof(self) wself = self; \_\_strong typeof(self) sself =
wself;

   if (!sself) { return; }

  \[self doSomething\];

}

【强制】在多线程应用中，Notification的消息可能在post的线程或在注册观察者的线程中被转发。如果post消息不在主线程，而接受消息的回调做了UI操作，就需要让其在主线程执行。

说明：每个进程都会创建一个NotificationCenter，通过NSNotificationCenter
defaultCenter获取其实例，当然也可以自己创建一个center。NoticiationCenter是以同步（非异步，当前线程，会等待，会阻塞）的方式发送请求（当post通知时，center会一直等待所有的observer都收到并且处理了通知才会返回到poster）。如果需要异步发送通知，可使用notificationQueue，在多线程的应用中，通知会发送到所有的线程。

### 4.3.7 UI

【强制】使用\[\[UIApplication sharedApplication\]
keyWindow\]获取window，不要使用view.window获取。

【强制】使用到 UIScrollView，UITableView，UICollectionView 的 Class
，要在 dealloc 方法里手动的把对应的 delegate， dataSouce 置为 nil。

【强制】UITableView使用self-sizing实现不等高cell时，请在-
(UITableViewCell \*)tableView:(UITableView \*)tableView
cellForRowAtIndexPath:(NSIndexPath
\*)indexPath;中给cell设置数据。不要在- (void)tableView:(UITableView
\*)tableView willDisplayCell:(UITableViewCell \*)cell
forRowAtIndexPath:(NSIndexPath \*)indexPath;方法中给cell设置数据。

【推荐】当访问一个 CGRect 的 x， y， width， height
时，应该使用[CGGeometry
函数](http://developer.apple.com/library/ios/%23documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html)代替直接访问结构体成员。苹果的
CGGeometry 参考中说到：

All functions described in this reference that take CGRect data
structures as inputs implicitly standardize those rectangles before
calculating their results. For this reason， your applications should
avoid directly reading and writing the data stored in the CGRect data
structure. Instead， use the functions described here to manipulate
rectangles and to retrieve their characteristics.

因此，推荐的写法是这样的：

CGRect frame = self.view.frame;

CGFloat x = CGRectGetMinX(frame);

CGFloat y = CGRectGetMinY(frame);

CGFloat width = CGRectGetWidth(frame);

CGFloat height = CGRectGetHeight(frame);

反对这样的写法：

CGRect frame = self.view.frame;

CGFloat x = frame.origin.x;

CGFloat y = frame.origin.y;

CGFloat width = frame.size.width;

CGFloat height = frame.size.height;

### 4.3.8 IO

【推荐】尽量少用NSUserDefaults。

说明：\[\[NSUserDefaults standardUserDefaults\] synchronize\]
会block住当前线程，直到所有的内容都写进磁盘，如果内容过多，重复调用会严重影响性能。

【推荐】经常被使用的文件最好做好缓存，避免重复的IO操作。

【推荐】只有在合适的时候才进行持久化操作。

### 4.3.9 Collection

【强制】不要用一个可能为nil的对象初始化集合对象，否则可能会导致crash。例如：

// 可能崩溃

NSObject \*obj = somOjbcetMaybeNil;

NSMutableArray \*arrM = \[NSMutableArray arrayWithObject:obj\];

// 崩溃信息：

\*\*\* Terminating app due to uncaught exception
\'NSInvalidArgumentException\'， reason: \'\*\*\*
-\[\_\_NSPlaceholderArray initWithObjects:count:\]: attempt to insert
nil object from objects\[0\]'

// 改进办法:

NSObject \*obj = somOjbcetMaybeNil;

NSMutableArray \*arrM = nil;

if (obj && \[obj isKindOfClass:\[NSObject class\]\]) {

   arrM = \[NSMutableArray arrayWithObject:obj\];

} else {

   arrM = nil;

}

【强制】同上，对插入到集合对象里面的对象需要进行判空。

【强制】在多线程访问可变集合对象的场景，必要时应该加锁保护（不可变集合(比如NSArray)类默认是线程安全的，而可变集合类(比如NSMutableArray)不是线程安全的）。

【强制】禁止在多线程环境下直接访问可变集合对象中的元素。应该先进行copy，再访问不可变集合对象内的元素。

// 正例

\- (void)checkAllValidItems{

NSArray \*array = \[array copy\];

\[array enumerateObjectsUsingBlock:\^(id \_Nonnull obj， NSUInteger
idx， BOOL \* \_Nonnull stop) {

//do something using obj

}\]; }

//反例

\- (void)checkAllValidItems{

\[self.allItems enumerateObjectsUsingBlock:\^(id \_Nonnull obj，
NSUInteger idx， BOOL \* \_Nonnull stop) {

    //do something using obj

    //
如果在enumerate过程中，其他线程对allItems这个可变集合进行了变更操作，这里就有可能引发crash

}\]; }

【强制】使用enumerateObjectsUsingBlock遍历集合对象中的对象时，注意关键字return的作用域。block中的return代表的是使当前的block返回，而非使当前的整个函数体返回。以下使用NSArray举例：

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   NSArray \*array = \[NSArray arrayWithObject:@\"1\"\];

  \[array enumerateObjectsUsingBlock:\^(id  \_Nonnull obj， NSUInteger
idx， BOOL \* \_Nonnull stop) {

       // excute some code\...

       return;

  }\];

   // 依然会执行到这里

   NSLog(@\"fall through\");

}

// 执行结果：

fall through

当两个enumerateObjectsUsingBlock嵌套，如果仅在最内层的block中return，外层block的代码还是会被执行（block相当于一个匿名函数，在block中使用return返回，仅是让当前这个匿名函数返回）。例如：

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   NSArray \*arr1 = \[NSArray arrayWithObject:@\"1\"\];

   NSArray \*arr2 = \[NSArray arrayWithObject:@\"2\"\];

  \[arr2 enumerateObjectsUsingBlock:\^(id  \_Nonnull obj， NSUInteger
idx， BOOL \* \_Nonnull stop) {

      \[arr1 enumerateObjectsUsingBlock:\^(id  \_Nonnull obj，
NSUInteger idx， BOOL \* \_Nonnull stop) {

           // do something

           return;

      }\];

       

       NSLog(@\"fall through\");

  }\];

   

   NSLog(@\"fall through\");

}

// 执行结果：

// fall through

// fall through

【强制】禁止返回mutable对象，禁止将mutable对象当作为入参传递。

【推荐】如果使用NSMutableDictionary作为缓存，建议使用NSCache代替。

【推荐】集合类使用泛型来指定对象的类型。

\@property(nonatomic，copy) NSArray\<NSString \*\> \*array;

\@property(nonatomic，strong) NSMutableDictionary\<NSString \*，NSString
\*\> \*dictionary;

### 4.3.10 分支语句

【推荐】if条件判断语句后面必须要加大括号{}。不然随着业务的发展和代码迭代，极有可能引起逻辑问题。例如：

正例：

if (!error) {

   return success;

}

反例：

if (!error)

   return success;

if (!error)  return success;

【强制】多于3个逻辑表达式必须用参数分割成多个有意义的bool变量。

【推荐】遵循gold path法则，不要把真正的逻辑写道括号内。

正例：

\- (void)someFuncWith:(NSString \*)parameter {

   if (!parameter) {

       return;

  }

   // do something

  \[self doSomething\];

}

反例：

\- (void)someFuncWith:(NSString \*)parameter {

   if (parameter) {

       // do something

      \[self doSomething\];

  }

}

【推荐】对于条件语句的真假，因为 nil 解析为
NO，所以没有必要在条件中与它进行比较。永远不要直接和 YES 和
NO进行比较，因为 YES 被定义为 1，而 BOOL 可以多达 8 位。

正例：

if (isAwesome)

if (!\[someObject boolValue\])

反例：

if (\[someObject boolValue\] == NO) { }

if (isAwesome == YES) { }

【强制】使用switch...case\...语句的时候，不要丢掉default:。除非switch枚举。

【强制】switch...case\...语句的每个case都要添加break关键字，避免出现fall-through。

### 4.3.11 对象判等

isEqual:方法允许传入任意类型的对象作为参数，如果参数类型和receiver(方法调用者)类型不一致，会返回NO。而isEqualToString:和isEqualToArray:这两个方法会假设参数类型和receiver类型一致，也就是说，这两个方法不会对参数进行类型检查。

【推荐】安全起见，如果从外部数据源(比如info.plist或preferences)获取的数据，推荐使用isEqual:方法。

【推荐】为更好的代码性能，如果知道参数的确切类型，使用类似于isEqualToString:的方法。

【推荐】遵循gold path法则，不要把真正的逻辑写道括号内。

对象等同性判定的更多内容可参考
[[《浅析对象等同性判断》]](https://www.jianshu.com/p/e1fd4fb9341c)

### 4.3.12 懒加载

【推荐】适合懒加载的场景，除以下三条之外，请不要使用懒加载。

-   一个对象的创建依赖于其他对象。

-   一个对象在整个app过程中，可能被使用，也可能不被使用。

-   一个对象的创建需要经过大量的计算或者比较消耗性能。

【推荐】懒加载中不应该有其他不必要的逻辑代码。说明：

懒加载本质上就是延迟初始化某个对象，其职责仅仅是初始化一个对象，然后对这个对象的属性赋值。如果有相关联逻辑性代，请放到其他合适的地方。

【强制】不滥用懒加载，只对那些真正需要懒加载的对象采用懒加载。

【强制】注意懒加载重复多次被触发。如果一个对象在懒加载后，某些场景下又被设置为nil，则很难保证这个懒加载不被再次触发。

### 4.3.13 多线程

【强制】禁止使用GCD的dispatch\_get\_current\_queue()函数获取当前线程信息。

【强制】对剪贴板的读取必须要放在异步线程处理，最新Mac和iOS里的剪贴板共享功能会导致需要读取大量内容的可能，导致读取线程被长时间阻塞。

反例：

dispatch\_async(dispatch\_get\_global\_queue(DISPATCH\_QUEUE\_PRIORITY\_DEFAULT，
0)， \^{

  UIPasteboard \*pasteboard = \[UIPasteboard generalPasteboard\];

  if (pasteboard.string.length \> 0) {//这个方法会阻塞线程

     NSString \*text = \[pasteboard.string copy\];

    \[pasteboard setValue:@\"\"
forPasteboardType:UIPasteboardNameGeneral\];

     if (text == nil \|\| \[text isEqualToString:@\"\"\]) {

         return ;

    }

     dispatch\_async(dispatch\_get\_main\_queue()， \^{

        \[self processShareCode:text\];

    });

  }

});

【推荐】仅当必须保证顺序执行时才使用dispatch\_sync，否则容易出现死锁。可使用dispatch\_async代替：

反例：

\- (void)viewDidLoad {

  \[super viewDidLoad\];

  //
在主队列中同步添加一个block到主队列中，出现死锁报错:EXC\_BAD\_INSTRUCTION

dispatch\_queue\_t mainQueue = dispatch\_get\_main\_queue();

  dispatch\_block\_t block = \^() {

      NSLog(@\"%@\"， \[NSThread currentThread\]);

  };

  dispatch\_sync(mainQueue， block);

}

正例：

\- (void)viewDidLoad {

  \[super viewDidLoad\];

 
//虽然把任务加到了主队列由主线程来执行，但因为异步，此时主队列后面的任务不依赖于前面的任务。

  dispatch\_queue\_t mainQueue = dispatch\_get\_main\_queue();

  dispatch\_block\_t block = \^() {

      NSLog(@\"%@\"， \[NSThread currentThread\]);

  };

  dispatch\_async(mainQueue， block);

}

// 打印结果：

\<NSThread: 0x600000073300\>{number = 1， name = main}

【强制】禁止在非主线程中进行UI元素的操作。

【强制】在主线程中禁止进行同步网络资源读取，使用NSURLSession进行异步获取。当然，你可以在子线程同步获取网络资源，但还是上面的那一条建议：避免使用dispatch\_sync，尽量使用dispatch\_async。因为死锁不一定只发生在主线程。

【强制】如果需要进行大文件或者多文件的IO操作，禁止主线程使用，必须进行异步处理。

### 4.3.14 内存管理

【推荐】函数体提前return时，要注意是否有对象没有被释放掉(常见于CF对象)，避免内存泄露。

【推荐】请慎重使用单例，避免产生不必要的常驻内存。

如UIApplication、access database 、request network 、access
userInfo这类全局仅存在一份的对象或者需要多线程访问的对象，可以使用单例。其他情况不要仅为访问方便就使用单例。

【推荐】单例初始化方法中尽量保证单一职责，尤其不要进行其他单例的调用（在极端情况下，两个单例对象在各自的单例初始化方法中调用，会造成死锁）。

【强制】在dealloc方法中，禁止将self作为参数传递出去，如果self被retain住，到下个runloop周期再释放，则会造成多次释放crash（在4.3.4的dealloc一节中有说明）。

【推荐】除非知道自己在做什么，否则不建议将UIView类的对象加入到NSArray、NSDictionary、NSSet中。如有需要可以添加到NSMapTable
和
NSHashTable。因为NSArray、NSDictionary、NSSet会对加入的对象做strong引用（即使你把加入的对象进行了weak）。而NSMapTable、NSHashTable对加入的对象做weak引用。

说明：NSHashTable相当于weak的NSMutableArray；NSMapTable相当于weak的NSMutableDictionary：

// 反例：

\@implementation WSObject

\- (void)dealloc {

   NSLog(@\"dealloc\");

}

\@end

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   WSObject \*object = \[WSObject new\];

   //
即使对object进行了weak弱化，数组也会强引用这个object对象。dealloc方法不会被执行。

   \_\_weak typeof(object) weakObject = object;

  \[self.arrM addObject:weakObject\];

   

   dispatch\_after(dispatch\_time(DISPATCH\_TIME\_NOW， (int64\_t)(2 \*
NSEC\_PER\_SEC))， dispatch\_get\_main\_queue()， \^{

       NSLog(@\"count = %ld\"，self.arrM.count);

  });

}

// 打印结果：

// count = 1

正例：

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   WSObject \*object = \[WSObject new\];

   NSHashTable \*hashTable = \[NSHashTable weakObjectsHashTable\];

  \[hashTable addObject:object\];

   dispatch\_after(dispatch\_time(DISPATCH\_TIME\_NOW， (int64\_t)(2 \*
NSEC\_PER\_SEC))， dispatch\_get\_main\_queue()， \^{

       NSLog(@\"count = %ld\"，hashTable.count);

  });

}

// 打印结果：

// dealloc

// count = 1

上例中object已经释放了，但是控制台仍然输出 hashTable.count ==
1，此时存在于hashTable中的那个object已经变成了nil：

\- (void)touchesBegan:(NSSet\<UITouch \*\> \*)touches withEvent:(UIEvent
\*)event {

   WSObject \*object = \[WSObject new\];

   NSHashTable \*hashTable = \[NSHashTable weakObjectsHashTable\];

  \[hashTable addObject:object\];

   dispatch\_after(dispatch\_time(DISPATCH\_TIME\_NOW， (int64\_t)(2 \*
NSEC\_PER\_SEC))， dispatch\_get\_main\_queue()， \^{

       NSLog(@\"count = %ld\"，hashTable.count);

       

       if (hashTable && hashTable.count) {

           WSObject \*object = \[hashTable anyObject\];

           NSLog(@\"object = %@\"，\[object self\]);

      }

  });

}

// 打印结果：

2017-07-04 22:19:10.952139+0800 tst\[46834:4305636\] dealloc

2017-07-04 22:19:13.149903+0800 tst\[46834:4305636\] count = 1

2017-07-04 22:20:55.234522+0800 tst\[46834:4305636\] object = (null)

### 4.3.15 延迟调用

【强制】performSelector:withObject:afterDelay:要在有Runloop的线程调用，否则调用不生效。

说明：异步线程默认是没有runloop的，除非手动创建；而主线程是系统会自动创建Runloop的。所以在异步线程调用是请先确保该线程是有Runloop的。

使用performSelector:withObject:afterDelay:和cancelPreviousPerformRequestsWithTarget组合时要小心，afterDelay会增加引用计数，而cancel会对引用计数减一。如果receiver在引用计数器为1的时候，调用cancel会立即回收receiver。后续再次调用receiver的方法就会crash。所以需要使用weakSelf并判空：

\_\_weak typeof(self) weakSelf = self;

\[NSObject cancelPreviousPerformRequestsWithTarget:self\];

if (!weakSelf) {

   // NSLog(@\"self dealloc\");

   return;

}

\[self doOther\];

### 4.3.16 类的设计

【推荐】尽量减少继承，类的继承关系不要超过3层。可以考虑使用category、protocol来代替继承。

【推荐】把稳定的、公共的变量或者方法抽取到父类中。

【推荐】子类尽量只维持父类所不具备的特性和功能。

【推荐】.h文件中尽量不要声明成员变量。

【推荐】.h文件中的属性尽量声明为只读。

【推荐】.h文件中只暴露出一些必要的类、公开的方法、只读属性；私有类、私有方法和私有属性以及成员变量，尽量写在.m文件中。

### 4.3.17 方法调用

【推荐】使用属性代替成员变量，
使用self.代替\_(setter和getter方法中除外)。

【推荐】使用.语法代替\[\]调用无参数且要使用返回值的方法。

【推荐】尽量使用lazy load， 在使用时再去初始化对象。

【推荐】重载系统方法的时候， 如无特殊情况均需要先调用super的方法。

【推荐】使用new代替alloc.init初始化对象。

【推荐】创建单例对象方法， 使用instancetype作为返回值类型，
并且统一使用sharedInstance作为方法名。例如：

\+ (instancetype)sharedInstance;

【推荐】创建单例对象时， 使用线程安全的方式创建完全单例 static Class
\*instance = nil。

\+ (instancetype)sharedInstance

{

   static dispatch\_once\_t onceToken;

   dispatch\_once(&onceToken， \^{

       instance = Class.new;

  });

   return instance;

}

 

\+ (instancetype)allocWithZone:(NSZone \*)zone

{

   static dispatch\_once\_t onceToken;

   dispatch\_once(&onceToken， \^{

       instance = \[super allocWithZone:zone\];

  });

   return instance;

}

初始化方法使用默认代码格式 - (instancetype)init

{

   self = \[super init\];

   if (self) {

       // do something

  }

   return self;

}

【推荐】使用字面量快速构造对象。

|    类型         |    语法          |    示例                 |
| ----------- | ------------- | ----------------  | 
|    NSString     |    @"文字"       |    @"aString"           |
|    NSNumber     |    \@数字        |    \@1                  |
|    NSArray      |    @\[数组内容\] |    @\[\@1， \@2\]       |
|    NSDictionary |    @{键 : 值}    |    @{@"key" : @"value"} |

-   

【推荐】NSArray和NSDictionary使用字面量创建时， 内部每一个元素需要对齐：

NSArray \*someItems = @\[@\"ABC\"，

                      @\"BCD\"，

                      @\"CDE\"\];

     

NSDictionary \*someKeyValues = @{@\"Key1\" : @\"Value1\"，

                               @\"Key2\" : @\"Value2\"};

 

NSDictionary \*someKeyValues = @{@\"Key1\" : @\"Value1\"，

                               @\"Key2\" : @\"Value2\"

                              }.lm\_newKeyValues;

【推荐】如果需要操作的一组元素需要去重， 请使用NSSet而不是NSArray。

【推荐】头文件中只暴露一些必要公开的方法， 属性， 私有方法和属性，
尽量写在实现文件中。

【推荐】不要使用宏定义的方式创建常量， 因为宏定义不会进行类型检测。

【推荐】常量应该在实现文件中进行复制，
如果需要暴露给外部在头文件中extern出来， 使用k标识常量，
无需暴露的使用static修饰。如下：

.h

extern NSString \*const kSomeConstant;

.m

NSString \*const kSomeConstant = @\"someConstant\";

.m

static NSString \*const kSomeConstant = @\"someConstant\";

【推荐】使用NS\_ENUM和NS\_OPTIONS宏来定义枚举值。

typedef NS\_ENUM(NSUInteger， SomeEnum) {

   SomeEnumA，

   SomeEnumB，

   SomeEnumC，

};

 

typedef NS\_OPTIONS(NSUInteger， SomeEnum) {

   SomeEnumA = 1 \<\< 0，

   SomeEnumB = 1 \<\< 1，

   SomeEnumC = 1 \<\< 2，

};

【强制】if语句后面必须要有{}

【强制】switch语句每一个case都要有{}

if， else， switch， while需要另起一行 if (condition) {

   statements

}

else {

   statements

}

【推荐】多于2个逻辑表达式必须用参数分割成多个有意义的bool变量。

【推荐】在条件判断中， 尽量把逻辑写在判断之后。

\+ (void)someMethod {

if (!someCondition) {

return;

}

// do something

}

【推荐】在条件判断时， 需要省略和\`nil\`，\`YES\`， \`NO\`比较的部分。

【推荐】尽量避免条件语句的嵌套。

【推荐】一目运算符\`!\`， \`++\`， \`---\`不需要空格间隔。例如：

if (!hidden) {

}

【推荐】二目运算符+， -， \*， /， %， =， \>， \<， ==， !=， \>=，
\<=， &&， \|\|， &， \^， \|等运算符左右两侧各空一格。例如：

NSInteger one = 1;

NSInteger two = 2;

 

NSInteger three = one + two;

【推荐】三目运算符? :除?:外都要与?he:两侧各空一格。例如：

NSString \*someValue = condition ? @\"A\" : @\"B\";

 

NSString \*someValue2 = someValue ?: @\"B\";

【推荐】三目运算符不要超过两层判断。

【推荐】如果方法是为了获取某一个值， 不要在方法前面加。例如：

get + (UIImage \*)blurImage;

【推荐】尽量使用block作为回调手段。

【推荐】调用block回调前必须判断block是否为nil。

【推荐】在声明遵守的协议时， 尽量把声明写在实现文件中，
)和\<间空一格。例如：

\@interface SomeClass () \<SomeDelegate\>

\@end

【强制】调用delegate回调前必须判断该协议方法是否被实现。

### 4.3.18 其它编码建议

【推荐】建议项目统一使用Masonry和xib结合的方式布局。不允许出现直接设置frame的情况。如果是纯代码的项目，不允许出现xib和拉约束的情况。不建议使用纯storyboard开发。

【推荐】数据提供统一的入口。无论是在 MVP、MVC 还是 MVVM
中，提供一个统一的数据入口，都可以让代码变得更加易于维护。比如可使用一个DataManager，把
http、preference、eventpost、database
都放在DataManger里面进行操作，我们只需要与DataManger打交道。

【推荐】提取方法，去除重复代码。对于必要的方法进行工具类抽取，在其他项目重用。

【推荐】尽可能的使用局部变量。

【推荐】尽量减少对变量的重复计算。

【推荐】尽量在合适的场合使用单例。使用单例可以减轻加载的负担，缩短加载的时间，提高加载效率。但请尽量不使用单例，使用时请校对是否匹配以下三个方面的适用性：

1\. 控制资源的使用，通过线程同步来控制资源的并发访问。

2\. 控制实例的产生，以达到节约资源的目的。

3.
控制数据的共享，在不建立直接关联的条件下，让多个不相关的进程或线程之间实现通信。

【推荐】使用Instruments分析内存和检测内存泄漏。

附录
====

参考文章：

[[Coding Guidelines for
Cocoa]](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/APIAbbreviations.html#//apple_ref/doc/uid/20001285-BCIHCGAE)

[[Google Objective-C Style
Guide]](https://github.com/google/styleguide/blob/gh-pages/objcguide.md)

[[objective-c-style-guide]{.underline}](https://github.com/raywenderlich/objective-c-style-guide)

[[App Programming Guide for
iOS]](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html)

其他参考：

基于ReactNative框架的混合开发编码规范请参考：《技术开发中心React
Native开发规范》
