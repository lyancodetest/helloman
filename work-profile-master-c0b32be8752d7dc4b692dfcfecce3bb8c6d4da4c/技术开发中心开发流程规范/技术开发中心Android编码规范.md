**卫盈联信息技术（深圳）有限公司**

**技术开发中心Android编码规范**

**2019年12月16日**

版本变更记录

  制度编号：                                         

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

1.3 Android通用规范 9

第二章 工程规范 19

2.1 AS规范 19

2.2 包管理 19

2.3 源文件结构 20

2.3.1 许可证或版权信息 20

2.3.2 package语句 20

2.3.3 import语句 20

2.3.4 类声明 21

2.4 版本统一规范 22

2.5 第三方库规范 22

第三章 命名规范 23

3.1 包名 23

3.2 类名 25

3.3 方法名 26

3.4 常量名 27

3.5 非常量字段名 28

3.5.1 scope（范围） 28

3.5.2 Type0（控件类型） 29

3.5.3 VariableName（变量名） 29

3.5.4 Type1（数据类型） 29

3.6 参数名 30

3.7 局部变量名 30

3.8 临时变量 30

3.9 类型变量名 30

3.10 资源文件命名 30

3.10.1 动画资源文件（anim/ 和 animator/） 31

3.10.2 颜色资源文件（color/） 32

3.10.3 图片资源文件（drawable/ 和 mipmap/） 32

3.10.4 布局资源文件（layout/） 34

3.10.5 菜单资源文件（menu/） 35

3.11 values 资源文件（values/） 35

3.11.1 colors.xml 35

3.11.2 dimens.xml 36

3.11.3 strings.xml 37

3.11.4 styles.xml 37

3.12 id命名 38

第四章 代码规范 38

4.1 代码布局和格式 38

4.1.1 大括号 38

4.1.2 非空块：K & R 风格 39

4.1.3 空块：可以用简洁版本 39

4.1.4 块缩进 39

4.1.5 列限制：80或100 40

4.1.6 垂直空白 40

4.1.7 水平空白 40

4.1.8 水平对齐：不做要求 41

4.1.9 用小括号来限定组：推荐 41

4.2 代码注释 42

4.2.1 类注释 42

4.2.2 方法注释 42

4.2.3 块注释 43

4.2..4 其他一些注释 43

4.3 编程规约 44

4.3.1 基本编程规范 44

4.3.2 基本代码约定 45

4.3.3 Android 基本组件 46

4.3.4 UI 与布局 49

4.3.5 进程、线程与消息通信 50

4.3.6 文件与数据库 51

4.3.7 Bitmap、Drawable 与动画 53

4.3.8 安全 54

4.3.9 其他 58

附录 58



## 前言


随着公司业务线增加，产品快速迭代累积的需求功能越来越多，项目代码趋于臃肿复杂。同时，团队成员增加或人员流动，不同开发者的编码风格不尽相同等情况，增加了项目的维护成本，降低了团队成员之间的协作效率和组织生产效能，使得开发交付质量难以保证。

为能持续提供给用户运行稳定、体验流畅的软件产品和服务，提升质量意识，引导团队成员以更加高效、高质量地进行迭代开发，降低生产故障率和项目维护成本，特制定此《Android开发规范》。

规范提供一条可供参考的标准线，以约束不同的开发风格，规范开发行为和代码约定，保证项目从整体风格到编码细节上的标准统一，提高代码可读性和可维护性，提升软件项目自身的迭代更新能力，促进代码审查和合作开发等团队协作效率，也有利于开发者养成良好的编码习惯，完成从合格到优秀的开发能力提升。

本编码规范内容包括开发总则，工程规范，命名规范和代码规范四大章节，每个章节内容是推荐性的编程经验条陈，或者是针对该章节主题的编程规约。根据约束力强弱，
规约依次分为强制、推荐、参考三大类:

【强制】必须遵守，违反本约定或将会引起严重的后果;

【推荐】尽量遵守，长期遵守有助于系统稳定性和合作效率的提升;

【参考】充分理解，技术意识的引导，是个人学习、团队沟通、项目合作的方向。

对于规约条目的延伸信息中，"说明"对内容做了适当扩展和解释；有些只列出了应遵守的编码规范（what），有些问题除了给出编码规范（what），还附加解释了规范原因（why），让读者不仅知其然，也能知其所以然。

 #### 实施和解释

本规范制定了开发Android原生软件的基本原则、规则和建议。适用于公司内所有Android原生代码的编程开发。本规范自发布之日起生效，对以后新编写的和修改的代码应遵守本规范。本规范由研发中心发布和维护。

##第一章 开发总则


### 1.1 首要编码目标


软件需要人维护，才能持续正确地运行于机器，要面向人编码，而非面向机器编码。易读、易维护的软件代码才具有生命力。

"程序必须为阅读它的人而编写，只是顺便用于机器执行。"------HaroldAbelson和Gerald
Jay Sussman

"编写程序应该以人为本，计算机次之。"------Steve McConnell

软件的生命周期贯穿产品的开发，测试，生产，用户使用，版本升级和后期维护等过程。软件维护期成本占整个生命周期成本的40%\~90%。在维护期变更代码的成本，小型系统是开发期的5倍，大型系统(
100万行代码以上)可以达到100倍。

为减少软件维护期修改bug和扩展需求的成本，以便有更多人力投入新业务研发战略，提高公司竞争力，在开发阶段应着重提高代码的易维护性和正确性。而只有简洁易懂、逻辑清晰、容易发现排查问题的容易阅读的代码，才能降低代码的维护重构和功能扩展成本，才能保证程序的正确性和可靠性。

代码可读性优先于易维护性和高拓展性，编写代码应以可读性为首要目标一以贯之。

### 1.2 通用编码规则


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

【推荐】 平衡编码过程的过度工程和可扩展性要求。说明：

-   过度工程（over-engineering）：即在正确可用的代码写出之前就过度地考虑扩展，重用的问题，使得工程过度复杂。

-   可扩展性：面向变化编程，而不是面向需求编程。需求是暂时的，变化才是常态。编码不能只考虑满足当前迭代的功能需求，写出扩展性、适应性强的程序才是负责任的做法。

代码的可扩展性，应在防止过度工程的前提下实现，编码目标由低到高层次应对如下：

\> 实现能解决问题、满足需求的可用代码 。  

\> 经过推敲以择优方式解决问题、满足要求的正确代码。

\> 具有可扩展性、可重用性的测试完备的简洁清晰代码。

### 1.3 Android通用规范


【推荐】Android 遵循标准 Java
编码规范以及下文所述的其他规则。参考：[[《阿里巴巴 Java
开发手册》]](https://www.wanandroid.com/blogimgs/a2609aed-1000-4039-93c3-7541aaa2013b.pdf)

【强制】禁止忽略异常。开发者可能会倾向于编写完全忽略异常的代码，例如：

```
void setServerPort(String value) {

try {

serverPort = Integer.parseInt(value);

} catch (NumberFormatException e) { }

}
```

千万不要这样做。虽然您可能认为自己的代码永远不会遇到这种错误，或者无需费心处理这种错误，但像上例那样忽略异常会在您的代码中埋下隐患，这种错误总有一天会被他人触发。您必须有原则地处理代码中的每个异常；具体处理方式因情况而异。

无论何时，只要遇到空的 catch
子句，就应该保持警惕。当然，在某些时候，空的 catch
语句确实没什么问题，但至少你得想一想。在 Java
中，无论怎么小心都不为过。-James Gosling

1. 将异常抛给方法调用者：

```
void setServerPort(String value) throws NumberFormatException {

serverPort = Integer.parseInt(value);

}
```

2. 抛出一个适合您的抽象级别的新异常。

```
void setServerPort(String value) throws ConfigurationException {

try {

serverPort = Integer.parseInt(value);

} catch (NumberFormatException e) {

throw new ConfigurationException(\"Port \" + value + \" is not
valid.\");

}

}
```

3. 妥善处理错误，并替换 catch {} 块中的相应值。


```
/\*\* Set port. If value is not a valid number, 80 is substituted. \*/

void setServerPort(String value) {

try {

serverPort = Integer.parseInt(value);

} catch (NumberFormatException e) {

serverPort = 80; // default port for server

}

}
```

4. 捕获异常并抛出一个新的
RuntimeException。这样做比较危险，因此请仅在下述情况下采用这种方案：您确定，如果发生此错误，最适当的处理方式就是让应用崩溃。


```
/\*\* Set port. If value is not a valid number, die. \*/

void setServerPort(String value) {

try {

serverPort = Integer.parseInt(value);

} catch (NumberFormatException e) {

throw new RuntimeException(\"port \" + value \" is invalid, \", e);

}

}
```

5.最后一种方案：如果您确信忽略异常是合适的处理方式，那么您可以忽略异常，但您必须添加备注以充分说明理由：

```
/\*\* If value is not a valid number, original port number is used. \*/

void setServerPort(String value) {

try {

serverPort = Integer.parseInt(value);

} catch (NumberFormatException e) {

// Method is documented to just ignore invalid user input.

// serverPort will just be unchanged.

}

}
```

【强制】禁止捕获常规异常。在捕获异常时，开发者可能会为了偷懒而倾向于采用以下处理方式：

```
try {

someComplicatedIOFunction(); // may throw IOException

someComplicatedParsingFunction(); // may throw ParsingException

someComplicatedSecurityFunction(); // may throw SecurityException

// phew, made it all the way

} catch (Exception e) { // I\'ll just catch all exceptions

handleError(); // with one generic handler!

}
```

千万不要这样做。几乎所有情况下都不适合捕获常规异常或
Throwable（最好不要捕获 Throwable，因为它包含 Error
异常）。这样做非常危险，因为这意味着系统会在处理应用级错误期间捕获到您从未预料到的异常（包括
ClassCastException 之类的
RuntimeException）。它掩盖了代码的故障处理属性，也就是说，如果有人在您所调用的代码中添加了一种新类型的异常，编译器不会帮助您意识到您需要采取不同的方式来处理该错误。在大多数情况下，您不应以相同的方式处理不同类型的异常。

这条规则的特例是：在测试代码和顶级代码中，您希望捕获所有类型的错误（以防它们显示在界面中或者以便一直进行批处理作业）。在这些情况下，您可以捕获常规异常（或
Throwable）并适当地处理错误。但在这样做之前，请务必三思，然后添加备注以说明为何在此处执行这类操作是安全之举。

捕获常规异常的替代方案：

-   在单个 try 之后将每个异常作为单独的 catch
    块分别进行捕获。这样做可能显得比较笨拙，但仍比捕获所有异常更可取。请注意，不要在
    catch 块中过多地重复使用代码。

-   -   通过多个 try
    块重构您的代码，使得错误处理过程更精细。从解析中分离出
    IO，然后分别处理每种情况下的错误。

-   重新抛出异常。很多时候，您无需在该级别捕获异常，只需让相应方法抛出异常即可。

【强制】禁止使用终结器。终结器可以在对象被垃圾回收器回收时执行一段代码。虽然终结器非常便于进行资源清理（尤其是外部资源），但并不能保证终结器何时被调用（甚至根本不会被调用）。

Android
不使用终结器。在大多数情况下，您可以通过良好的异常处理流程实现终结器功能。如果您的确需要终结器，请定义一个
close()
方法（或类似方法），并注明需要调用该方法的确切时间（有关示例，请参阅
InputStream）。这种情况下，可以（但并非必须）在终结器中输出简短的日志消息，前提是不会输出大量日志消息。

【推荐】 完全合格的导入。当您想要使用 foo 包中的 Bar
类时，可以使用以下两种方式导入：

import foo.\*;

可能会减少 import 语句的数量。

import foo.Bar;

明确指出实际使用了哪些类，而且代码对于维护者来说更易读。

使用 import foo.Bar; 导入所有 Android 代码。对于 Java
标准库（java.util.\*、java.io.\* 等）和单元测试代码
(junit.framework.\*)，确定了一种明确例外情况。

【推荐】 使用 Javadoc 标准备注。每个文件都应该在顶部放置版权声明，其后是
package 和 import 语句（各个块之间用空行分隔），最后是类或接口声明。在
Javadoc 备注中说明类或接口的作用。

【推荐】
编写简短方法。在可行的情况下，尽量编写短小精炼的方法。我们了解，有些情况下较长的方法是恰当的，因此对方法的代码长度没有做出硬性限制。如果某个方法的代码超出
40 行，请考虑是否可以在不破坏程序结构的前提下对其拆解。

【推荐】
在标准位置定义字段。在文件的顶部或者在使用它们的方法之前定义字段。

【推荐】
限制变量的作用域。尽可能缩小局部变量的作用域。这样做有助于提高代码的可读性和可维护性，并降低出错的可能性。每个变量应该在包含变量所有使用场合的最内层的块中进行声明。

局部变量应该在首次使用时声明。几乎每个局部变量声明都应该包含一个初始化程序。如果您还没有足够的信息来合理地初始化某个变量，请推迟到信息充足时再进行声明。

try-catch
语句是例外情况。如果通过一个会抛出受检异常的方法的返回值来初始化变量，则必须在
try 块中进行初始化。如果该值必须在 try 块之外使用，那么您必须在 try
块之前对其进行声明，因为它在 try 块中尚无法合理地初始化：

```
// Instantiate class cl, which represents some sort of Set

Set s = null;

try {

s = (Set) cl.newInstance();

} catch(IllegalAccessException e) {

throw new IllegalArgumentException(cl + \" not accessible\");

} catch(InstantiationException e) {

throw new IllegalArgumentException(cl + \" not instantiable\");

}

// Exercise the set

s.addAll(Arrays.asList(args));
```

不过，即使是这种情况，也可以通过将 try-catch 块封装在某个方法中来避免：

```
Set createSet(Class cl) {

// Instantiate class cl, which represents some sort of Set

try {

return (Set) cl.newInstance();

} catch(IllegalAccessException e) {

throw new IllegalArgumentException(cl + \" not accessible\");

} catch(InstantiationException e) {

throw new IllegalArgumentException(cl + \" not instantiable\");

}

}

\...

// Exercise the set

Set s = createSet(cl);

s.addAll(Arrays.asList(args));
```

循环变量应该在 for 语句本身中进行声明，除非有令人信服的理由不这么做：

```
for (int i = 0; i \< n; i++) {

doSomething(i);

}

和

for (Iterator i = c.iterator(); i.hasNext(); ) {

doSomethingElse(i.next());

}
```

【推荐】 为 import 语句排序。import 语句的顺序为：

导入 Android 包。

导入第三方包（com、junit、net、org）。

java 和 javax 。

要完全符合 IDE 设置，导入顺序应为：

每个分组内按字母顺序排序，其中大写字母开头的语句位于小写字母开头的语句前面（例如
Z 在 a 前面）。

每个主要分组（android、com、junit、net、org、java、javax）之间用空行隔开。

最初对于语句顺序并没有样式要求，这意味着 IDE 经常会改变顺序，或者 IDE
开发者必须停用自动导入管理功能并手动维护导入语句。这样相当不方便。当提及
Java 样式时，开发者们喜欢的样式五花八门，最终针对 Android
简单归结为"选择一种兼容一致的排序方式"。因此我们选择了一种样式，更新了样式指南，并让
IDE 遵循该指南。我们希望 IDE
用户在编写代码时，系统对所有软件包的导入都符合此模式，无需再进行额外的工程处理。

这种样式是按以下原则选取的：

用户希望先看到的导入往往位于顶部 (android)。

用户最不希望看到的导入往往位于底部 (java)。

用户可以轻松遵循的样式。

IDE 可以遵循的样式。

静态导入的使用和位置一直都存在争议。有些人希望静态导入穿插在其他导入语句之间，而有些人更希望其位于其他所有导入语句的上方或下方。因此只需在保持一致的前提下自行决定即可。

【强制】使用空格缩进。使用四 (4)
个空格来缩进块，而不要使用制表符。如果例外，请与周围的代码保持一致。使用八
(8) 个空格来缩进自动换行，包括函数调用和赋值。正确示例如下：

```
Instrument i = someLongExpression(that, wouldNotFit, on, one, line);
```

错误示例如下：

```
Instrument i = someLongExpression(that, wouldNotFit, on, one, line);
```

【推荐】遵循字段命名规范

非公开且非静态字段的名称以 m 开头。

静态字段的名称以 s 开头。

其他字段以小写字母开头。

公开静态 final 字段（常量）为全部大写并用下划线连接
(ALL\_CAPS\_WITH\_UNDERSCORES)。

例如：

```
public class MyClass {

public static final int SOME\_CONSTANT = 42;

public int publicField;

private static MyClass sSingleton;

int mPackagePrivate;

private int mPrivate;

protected int mProtected;

}
```

【推荐】限制代码行长度。代码中每一行文本的长度都应该不超过 100
个字符。虽然关于此规则存在很多争论，但最终决定仍是以 100
个字符为上限，不过存在以下例外情况：

-   如果备注行包含长度超过 100
    个字符的示例命令或文字网址，那么为了便于剪切和粘贴，该行可以超过 100
    个字符。

-   导入语句行可以超出此限制，因为用户很少会看到它们（这也简化了工具编写流程）。

【推荐】使用标准 Java
注释。注释应该位于同一语言元素的其他修饰符之前。简单的标记注释（例如
\@Override）可以与语言元素列在同一行。如果有多个注释或参数化注释，则应各占一行并按字母顺序排列。

Java 中 3 个预定义注释的 Android 标准做法如下：

-   \@Deprecated：在不建议使用注释元素时，必须使用 \@Deprecated
    注释。如果您使用 \@Deprecated 注释，则还必须为其添加 \@deprecated
    Javadoc
    标记，并且该标记应该指定一个替代实现方案。另外请注意，\@Deprecated
    方法应该仍然可以使用。如果您看到带有 \@deprecated Javadoc
    标记的旧代码，请添加 \@Deprecated 注释。

-   \@Override：当某个方法替换了超类中的声明或实现时，必须使用
    \@Override 注释。例如，如果您使用 \@inheritdocs Javadoc
    标记，并且派生于某个类（而非接口），则必须再为方法添加 \@Override
    注释，说明该方法替换了父类的方法。

<!-- -->

-   \@SuppressWarnings：\@SuppressWarnings
    注释应该仅在无法消除警告的情况下使用。如果某个警告通过了"无法消除"测试，则必须使用
    \@SuppressWarnings
    注释，以确保所有警告都会反映出代码中的实际问题。当需要
    \@SuppressWarnings 注释时，必须在前面添加一个 TODO
    备注，用于说明"无法消除"情况。这通常会标识出是哪个违规类使用了糟糕的接口。例如：

> // TODO: The third-party class com.third.useful.Utility.rotate() needs
> generics
>
> \@SuppressWarnings(\"generic-cast\")
>
> List\<String\> blix = Utility.rotate(blax);
>
> 当需要 \@SuppressWarnings
> 注释时，您应该重构代码以分离出需要使用该注释的软件元素。

【推荐】将首字母缩写词视为字词。在为变量、方法和类命名时，请将首字母缩写词和缩写形式视为字词，使名称更具可读性：

  良好             不佳
  ---------------- ----------------
  XmlHttpRequest   XMLHTTPRequest
  getCustomerId    getCustomerID
  class Html       class HTML
  String url       String URL
  long id          long ID

由于 JDK 和 Android
代码库在首字母缩写词上非常不一致，几乎也不可能与周围的代码保持一致。因此，请务必将首字母缩写词视为字词。

【推荐】使用 TODO 备注。为代码使用 TODO
备注是短期的临时解决方案，或者说足够好但并不完美。TODO
备注应该以全部大写的字符串 TODO 开头，后跟一个冒号：

// TODO: Remove this code after the UrlTable2 has been checked in.

和

// TODO: Change this to use a flag instead of a constant.

如果您的 TODO
采用"在未来的某个日期做某事"的形式，请确保在其中包含一个非常具体的日期（"在
2005 年 11
月前修复"）或者一个非常具体的事件（"在所有生产环境合成器都可处理 V7
协议后移除此代码"）。

【参考】谨慎使用日志记录。虽然日志记录非常有必要，但对性能却有明显的负面影响，如果不能保持一定程度的简洁性，就会迅速失去其实用性。日志记录工具提供以下
5 种不同级别的日志记录：

-   ERROR：在出现极其严重的情况时使用。例如，某些事件会导致用户可见的后果，如果不明确删除某些数据、卸载应用、清除数据分区或重写整个设备（或更糟），则无法恢复。系统一直会记录此级别的日志。一般情况下，最好向统计信息收集服务器报告能够说明
    ERROR 级别的一些日志记录情况的问题。

-   WARNING：在出现比较严重和意外的情况时使用。例如，某些事件会导致用户可见的后果，但是通过执行某些明确的操作（从等待或重启应用，一直到重新下载新版应用或重新启动设备）可在不丢失数据的情况下恢复。系统一直会记录此级别的日志。可以考虑向统计信息收集服务器报告能够说明
    WARNING 级别的一些日志记录情况的问题。

-   INFORMATIVE:用于记录大多数人感兴趣的信息。例如，当检测到某种情况会造成广泛的影响时，尽管不一定是错误，系统也会记录下来。这种情况应该仅由一个被视为该领域最具权威性的模块来记录（避免由非权威组件重复记录）。系统一直会记录此级别的日志。

-   DEBUG：用于进一步记录设备上发生的可能与调查和调试意外行为相关的情况。您应该只记录收集有关组件的足够信息所需的信息。如果您的调试日志是主要日志，那么您可能应采用
    VERBOSE
    级别的日志记录。系统会记录此级别的日志（即使在发布版本中），并且周围要有 if
    (LOCAL\_LOG) 或 if
    (LOCAL\_LOGD) 块，其中 LOCAL\_LOG\[D\] 在您的类或子组件中定义。这样一来，系统有可能停用所有此类日志记录。因此，if
    (LOCAL\_LOG) 块中不得包含有效逻辑。为日志编译的所有字符串也需要放在 if
    (LOCAL\_LOG) 块中。如果日志记录调用会导致字符串编译在 if
    (LOCAL\_LOG) 块之外发生，则不应将其重构为方法调用。\
    有些代码仍然在使用 if (localLOGV)。虽然名称并不规范，但也可接受。

-   VERBOSE：用于记录其他所有信息。系统仅针对调试版本记录此级别的日志，并且周围要有 if
    (LOCAL\_LOGV) 块（或同类块），以便能够默认编译。所有字符串编译都将从发布版本中删除，并且需要在 if
    (LOCAL\_LOGV) 块中显示。

注意事项：

-   在指定模块中，除了 VERBOSE
    级别之外，一个错误应该只报告一次（如果可能的话）。在模块内的单个函数调用链中，只有最内层的函数应当返回错误，同一模块中的调用者只能添加一些明显有助于隔离问题的日志记录。

-   在一个模块链中，除了 VERBOSE
    级别之外，当较低级别的模块检测到来自较高级别模块的无效数据时，低级模块应该只在
    DEBUG
    日志中记录该情况，并且仅当该日志提供的信息对调用者来说无法获取时进行记录。具体来说，当抛出异常（异常中应该会包含所有相关信息）或者所记录的所有信息都包含在错误代码中时，则不需要记录此类情况。这在框架和应用之间的交互中尤为重要，而且由第三方应用造成的情况经过框架妥善处理后，不应该触发高于
    DEBUG 级别的日志记录。应该触发 INFORMATIVE
    级别或更高级别日志记录的唯一情况是，模块或应用在其自身级别或更低级别检测到错误。

-   当事实证明某些日志记录可能会发生多次时，最好实施一种频率限制机制来防止出现具有相同（或非常相似）信息的大量重复日志副本。

-   失去网络连接属于完全在预期之内的常见情况，没必要记录下来。如果失去网络连接后导致在应用内出现某种后果，则应该记录为
    DEBUG 或 VERBOSE
    级别（具体取决于后果是否足够严重以及足够意外，足以记录在发布版本中）。

-   如果在第三方应用可访问或代表第三方应用的文件系统上拥有完整的文件系统，则不应该记录高于
    INFORMATIVE 级别的日志。

-   来自任何不受信任来源（包括共享存储空间中的任何文件或通过任何网络连接获取的数据）的无效数据被视为符合预期，在被检测到无效时不应触发高于
    DEBUG 级别的任何日志记录（甚至应该尽可能地限制日志记录）。

-   请注意，在对 String
    使用 + 运算符时，它会隐式创建一个具有默认缓冲区（大小为 16
    个字符）的 StringBuilder，还可能会创建其他临时 String
    对象。例如，显式创建 StringBuilder
    并不比依赖默认的"+"运算符成本更高（实际上可能更高效）。请注意，即使没有读取日志信息，调用 Log.v() 的代码也会在发布版本中进行编译和执行，包括编译字符串。

-   任何供其他人阅读并且在发布版本中提供的日志记录都应当简洁明了、合理易懂。这包括一直到
    DEBUG 级别的所有日志记录。

-   在内容有意义的情况下尽可能使日志记录在一行之内。一行长度在 80 到 100
    个字符内是完全可以接受的，应当尽可能避免长度超过 130 或 160
    个字符（包括标记的长度）。

-   绝不能使用高于 VERBOSE 级别的日志记录报告成功事件。

-   用于诊断难以重现的问题的临时日志记录应采用 DEBUG 或 VERBOSE
    级别，并且应当包裹在 if 块中，以便在编译期间将其完全停用。

-   请务必谨慎，避免在日志中泄露安全方面的信息。应避免提供个人信息，且必须避免提供有关受保护内容的信息。这在编写框架代码时尤为重要，因为事先无法轻易得知哪些是个人信息或受保护的内容，哪些不是。

-   请勿使用 System.out.println()（或针对原生代码使用 printf()）。System.out
    和 System.err 会重定向到 /dev/null，因此您的 print
    语句不会产生可见效果。不过，为这些调用编译的所有字符串仍会得以执行。

-   日志记录的黄金法则是，您的日志不一定要将其他日志排挤出缓冲区，正如其他日志不会这样对您的日志一样。

【推荐】保持一致。修改代码时间参考周围的代码并确定其样式。如果该代码在
if
语句周围使用空格，那么也应该这样做。如果代码备注的周围是用星号组成的小方框，同样也应该将备注放在这样的小方框内。

制定样式规范的目的是整理出通用的编码词汇表，以便人们可以专注于您所说的内容，而不是您表达的方式。我们在此提出整体样式规则，让用户都知道这一词汇表，但局部样式也很重要。如果新添加到文件的代码看起来与其周围的现有代码明显不同，那么当读者读到此处时，这些代码会打乱他们的节奏。请尽量避免这种情况。

## 第二章 工程规范


### 2.1 AS规范


Android Studio开发环境的使用：

1.  尽量使用最新的稳定版的 IDE 进行开发；

2.  编码格式统一为 **UTF-8**；

3.  编辑完 .java、.xml
    等文件后一定要 **格式化，格式化，格式化**（如果团队有公共的样式包，那就遵循它，否则统一使用
    AS 默认模板即可）；

4.  删除多余的 import，减少警告出现，可利用 AS 的 Optimize
    Imports（Settings -\> Keymap -\> Optimize Imports）快捷键；

5.  Android 开发者工具可以参考：[**Android
    开发者工具**](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2017/0526/7973.html)；

### 2.2 包管理


以下是一些常见的包定义和存放策略（但不局限于此，视项目的具体情况而定）：

1.  base: 存放基础类的包，里面的类以 Base 为前缀，例如 BaseActivity；

2.  activity: 存放 activity 的包，每个 activity
    命名以Activity结尾，例如 MainActivity;

3.  fragment: 存放 fragment的包，每个 fragment 命名以 Fragment
    结尾，例如 ChatFragment;

4.  receiver: 存放 receiver 的包；

5.  service: 存放 service 的包；

6.  adapter: 存放 adapter 的包，每个 adapter 命名以 Adapter
    结尾，例如 EventItemAdapter;

7.  common:
    存放一些公共常量，例如后端接口、SharedPreferenceKey、IntentExtra 等;

8.  utils: 存放工具类的包，比如常见的工具类：LogUtils、DateUtils；

9.  entity: 存放实体类的包；

10. widget: 存放自定义View的包；

### 2.3 源文件结构


【推荐】 一个源文件顺序地包含：

1.  许可证或版权信息(如有需要);

2.  package语句;

3.  import语句;

4.  一个顶级类(只有一个)以上每个部分之间用一个空行隔开。

#### 2.3.1 许可证或版权信息

【推荐】如果一个文件包含许可证或版权信息，那么它应当被放在文件最前面。

#### 2.3.2 package语句

【推荐】 package
语句不换行，列限制(4.4节)并不适用于package语句。(即package语句写在一行里)

#### 2.3.3 import语句

【强制】 import不要使用通配符，即不要出现类似这样的import语句：import
java.util.\*;

【强制】
import语句不换行，列限制并不适用于import语句。(每个import语句独立成行)

【推荐】 import语句可分为以下几组，按照这个顺序，每组由一个空行分隔：

1.  所有的静态导入独立成组；

<!-- -->

5.  com.google imports(仅当这个源文件是在com.google包下)；

6.  第三方的包。每个顶级包为一组，字典序。例如：android, com, junit,
    org, sun；

7.  java imports5.javax imports组内不空行，按字典序排列。

#### 2.3.4 类声明

【强制】只有一个顶级，类声明每个顶级类都在一个与它同名的源文件中(当然，还包含.java后缀)。例外：package-info.java，该文件中可没有package-info类。

【强制】类的成员顺序对易学性有很大的影响，但这也不存在唯一的通用法则。不同的类对成员的排序可能是不同的。最重要的一点，每个类应该以某种逻辑去排序它的成员，维护者应该要能解释这种排序逻辑。比如，
新的方法不能总是习惯性地添加到类的结尾，因为这样就是按时间顺序而非某种逻辑来排序的。

【推荐】使用注释将源文件分为明显的区块，区块划分如下

1.  常量声明区；

<!-- -->

8.  UI控件成员变量声明区；

9.  普通成员变量声明区；

10. 内部接口声明区；

11. 初始化相关方法区；

12. 事件响应方法区；

13. 普通逻辑方法区；

14. 重载的逻辑方法区；

15. 发起异步任务方法区；

16. 异步任务回调方法区；

17. 生命周期回调方法区（出去onCreate()方法）；

18. 内部类声明区；

【推荐】按照发生的先后顺序排列类成员：

1.  常量按照使用先后排列；

<!-- -->

19. UI控件成员变量按照layout文件中的先后顺序排列；

20. 普通成员变量按照使用的先后顺序排列；

21. 方法基本上都按照调用的先后顺序在各自区块中排列；

22. 相关功能作为小区块放在一起（或者封装掉）；

【推荐】永不分离重载：当一个类有多个构造函数，或是多个同名方法，这些函数/方法应该按顺序出现在一起，中间不要放进其它函数/方法。

### 2.4 版本统一规范


【推荐】Android
开发存在着众多版本的不同，比如 compileSdkVersion、minSdkVersion、targetSdkVersion 以及项目中依赖第三方库的版本，不同的
module 及不同的开发人员都有不同的版本，所以需要一个统一版本规范的文件。

【推荐】如果是开发多个系统级别的应用，当多个应用同时用到相同的 so 库时，一定要确保 so 库的版本一致，否则可能会引发应用崩溃。

【推荐】单一项目版本采用A.B.C
三位数字设定版本号的控制和管理，如：1.0.2。当有版本更新时，以下表规则确定版本号规范：

  版本号      说明                 示例
  ----------- -------------------- -------------------------
  **A**.b.c   属于重大更新内容     **1**.0.2 -\> **2**.00
  a.**B**.c   属于小部分更新内容   1.**0**.2 -\> 1.**2**.2
  a.b.**C**   属于补丁更新内容     1.0.**2** -\> 1.0.**4**

### 2.5 第三方库规范


遵循不重复造轮子原则。已存在第三方库查询：[**Android**
流行框架查速表](http://www.ctolib.com/cheatsheets-Android-ch.html)

【推荐】使用第三方开源库时，且根据项目的issue解决记录、开发者的知名度等各方面作为参考依据。

【推荐】第三方库选择比较稳定的版本，且定时更新到最新版本。

【强制】选择的三方开源库在github 上的项目要求 200 Star 以上

【推荐】项目使用Gradle或Maven统一管理第三方库，不需要手动导入和手动添加依赖库。如果第三方不支持Gradle或Maven，可手动导入工程。

##第三章 命名规范


#### 基本命名原则：

-   不能以下划线或美元符号开始，也不能以下划线或美元符号结束。

-   代码中的命名严禁使用拼音与英文混合的方式，不允许直接使用中文。正确的英文拼写和语法可以让阅读者易于理解，避免歧义。即使纯拼音命名方式也要避免采用但 alibaba、taobao、youku、hangzhou、shanghai 等国际通用的名称，可视同英文。

-   除了常见的英文缩写，尽量避免缩写。

-   标识符只能使用ASCII字母和数字，因此每个有效的标识符名称都能匹配正则表达式\\w+。

### 3.1 包名

【推荐】包名全部小写，连续的单词只是简单地连接起来，不使用下划线，采用反域名命名规则，全部使用小写字母。一级包名是顶级域名，通常为 com、edu、gov、net、org 等，二级包名为公司名，三级包名根据应用进行命名，后面就是对包名的划分了，关于包名的划分，推荐采用
PBF（按功能分包 Package By Feature），一开始我们采用的也是 PBL（按层分包
Package By Layer），很坑爹。PBF 可能不是很好区分在哪个功能中，不过也比
PBL 要好找很多，且 PBF 与 PBL 相比较有如下优势：

-   package 内高内聚，package 间低耦合

-   package 有私有作用域（package-private scope）

-   很容易删除功能

-   高度抽象

-   只通过 class 来分离逻辑代码

<!-- -->

-   package 的大小具备意义性

更多好处说明：[[Package by features, not
layers]](https://medium.com/@cesarmcferreira/package-by-features-not-layers-2d076df1964d#.mp782izhh)，谷歌也有相应的
Sample：[[todo-mvp]{.underline}](https://github.com/googlesamples/android-architecture/tree/todo-mvp/)，其结构如下所示：

com

└── example

└── android

└── architecture

└── blueprints

└── todoapp

├── BasePresenter.java

├── BaseView.java

├── addedittask

│   ├── AddEditTaskActivity.java

│   ├── AddEditTaskContract.java

│   ├── AddEditTaskFragment.java

│   └── AddEditTaskPresenter.java

├── data

│   ├── Task.java

│   └── source

│   ├── TasksDataSource.java

│   ├── TasksRepository.java

│   ├── local

│   │   ├── TasksDbHelper.java

│   │   ├── TasksLocalDataSource.java

│   │   └── TasksPersistenceContract.java

│   └── remote

│   └── TasksRemoteDataSource.java

参考以上的代码结构，按功能分包具体实例如下：

com

└── domain

└── app

├── App.java 定义 Application 类

├── Config.java 定义配置数据（常量）

├── base 基础组件

├── custom\_view 自定义视图

├── data 数据处理

│   ├── DataManager.java 数据管理器，

│   ├── local 来源于本地的数据，比如 SP，Database，File

│   ├── model 定义 model（数据结构以及 getter/setter、compareTo、equals
等等，不含复杂操作）

│   └── remote 来源于远端的数据

├── feature 功能

│   ├── feature0 功能 0

│   │ ├── feature0Activity.java

│   │ ├── feature0Fragment.java

│ │ ├── xxAdapter.java

│ │ └── \... 其他 class

│ └── \...其他功能

├── injection 依赖注入

├── util 工具类

└── widget 小部件

### 3.2 类名

【推荐】类名都以 UpperCamelCase 风格编写。类名通常是名词或名词短语，接口名称有时可能是形容词或形容词短语。现在还没有特定的规则或行之有效的约定来命名注解类型。名词，采用大驼峰命名法，尽量避免缩写，除非该缩写是众所周知的，
比如 HTML、URL，如果类名称中包含单词缩写，则单词缩写的每个字母均应大写。

| 类                    | 描述                  | 例如                  |
| ----------- | ------------- | ----------------  | 
| Activity 类           | Activity 为后缀标识   | 欢迎页面类 WelcomeActivity |
| Adapter 类            | Adapter 为后缀标识    | 新闻详情适配器 NewsDetailAdaper |
| 解析类                | Parser 为后缀标识     | 首页解析类 HomePosterParser |
| 工具方法类            | Utils 或 Manager 为后缀标识 | 线程池管理类：ThreadPoolManager，日志工具类：LogUtils（Logger 也可）打印工具类：PrinterUtils |
| 数据库类              | 以 DBHelper 后缀标识  | 新闻数据库：NewsDBHelper |
| Service 类            | 以 Service 为后缀标识 | 时间服务 TimeService  |
| BroadcastReceiver 类  | 以 Receiver 为后缀标识 | 推送接收 JPushReceiver |
| ContentProvider 类    | 以 Provider 为后缀标识 | ShareProvider        |
| 自定义的共享基础类    | 以 Base 开头          | BaseActivity, BaseFragment |

【推荐】测试类的命名以它要测试的类的名称开始，以 Test
结束：HashTest 或 HashIntegrationTest。

【推荐】接口（interface）：命名规则与类一样采用大驼峰命名法，多以 able
或 ible 结尾：

 interface Runnable、interface Accessible。

注意：如果项目采用 MVP，所有 Model、View、Presenter 的接口都以 I
为前缀，不加后缀，其他的接口采用上述命名规则。

### 3.3 方法名

【推荐】方法名都以 lowerCamelCase 风格编写，方法名通常是动词或动词短语：

  方法                      说明
  ------------------------- ---------------------------------------------------------------
  initXX()                  初始化相关方法，使用 init 为前缀标识，如初始化布局 initView()
  isXX(), checkXX()         方法返回值为 boolean 型的请使用 is/check 为前缀标识
  getXX()                   返回某个值的方法，使用 get 为前缀标识
  setXX()                   设置某个属性值
  handleXX(), processXX()   对数据进行处理的方法
  displayXX(), showXX()     弹出提示框和提示信息，使用 display/show 为前缀标识
  updateXX()                更新数据
  saveXX(), insertXX()      保存或插入数据
  resetXX()                 重置数据
  clearXX()                 清除数据
  removeXX(), deleteXX()    移除数据或者视图等，如 removeView()
  drawXX()                  绘制数据或效果相关的，使用 draw 前缀标识

### 3.4 常量名

【推荐】常量名命名模式为 CONSTANT\_CASE，全部字母大写，用下划线分隔单词。

【推荐】每个常量都是一个 static final 字段，但不是所有 static
final 字段都是常量。在决定一个字段是否是一个常量时，得考虑它是否真的感觉像是一个常量。

例如，如果观测任何一个该实例的状态是可变的，则它几乎肯定不会是一个常量。只是永远不打算改变的对象一般是不够的，它要真的一直不变才能将它示为常量：

```
// Constants

static final int NUMBER = 5;

static final ImmutableListNAMES = ImmutableList.of(\"Ed\", \"Ann\");

static final Joiner COMMA\_JOINER = Joiner.on(\',\'); // because Joiner
is immutable

static final SomeMutableType\[\] EMPTY\_ARRAY = {};

enum SomeEnum { ENUM\_CONSTANT }

// Not constants

static String nonFinal = \"non-final\";

final String nonStatic = \"non-static\";

static final SetmutableCollection = new HashSet();

static final ImmutableSetmutableElements = ImmutableSet.of(mutable);

static final Logger logger = Logger.getLogger(MyClass.getName());

static final String\[\] nonEmptyArray = {\"these\", \"can\",
\"change\"};
```

### 3.5 非常量字段名

【推荐】非常量字段名以 lowerCamelCase 风格的基础上改造为如下风格：基本结构为 ：

scope{Type0}VariableName{Type1}、type0VariableName{Type1}、variableName{Type1}。

说明：{} 中的内容为可选。

注意：所有的 VO（值对象）统一采用标准的 lowerCamelCase 风格编写，所有的
DTO（数据传输对象）就按照接口文档中定义的字段名编写。

#### 3.5.1 scope（范围）

【推荐】非公有，非静态字段命名以 m 开头。静态字段命名以 s 开头。其他字段以小写字母开头。例如：

```
public class MyClass {

public int publicField;

private static MyClass sSingleton;

int mPackagePrivate;

private int mPrivate;

protected int mProtected;

}
```

使用 1 个字符前缀来表示作用范围，1
个字符的前缀必须小写，前缀后面是由表意性强的一个单词或多个单词组成的名字，而且每个单词的首写字母大写，其它字母小写，这样保证了对变量名能够进行正确的断句。

#### 3.5.2 Type0（控件类型）

【推荐】考虑到 Android 众多的 UI
控件，为避免控件和普通成员变量混淆以及更好地表达意思，所有用来表示控件的成员变量统一加上控件缩写作为前缀（具体见附录 [UI
控件缩写表](https://github.com/Blankj/AndroidStandardDevelop#ui-%E6%8E%A7%E4%BB%B6%E7%BC%A9%E5%86%99%E8%A1%A8)）。

例如：mIvAvatar、rvBooks、flContainer。

#### 3.5.3 VariableName（变量名）

【推荐】变量名中可能会出现量词，我们需要创建统一的量词，它们更容易理解，也更容易搜索。例如：mFirstBook、mPreBook、curBook。

  **量词列表**   **量词后缀说明**
  -------------- ----------------------
  First          一组变量中的第一个
  Last           一组变量中的最后一个
  Next           一组变量中的下一个
  Pre            一组变量中的上一个
  Cur            一组变量中的当前变量

#### 3.5.4 Type1（数据类型）

【推荐】对于表示集合或者数组的非常量字段名，可以添加后缀来增强字段的可读性，比如：

集合添加如下后缀：List、Map、Set。

数组添加如下后缀：Arr。

例如：mIvAvatarList、userArr、firstNameSet。

注意：如果数据类型不确定的话，比如表示的是很多书，那么使用其复数形式来表示也可，例如 mBooks。

### 3.6 参数名

【推荐】参数名以 lowerCamelCase 风格编写，参数应该避免用单个字符命名。

###3.7 局部变量名

【推荐】局部变量名以 lowerCamelCase 风格编写，比起其它类型的名称，局部变量名可以有更为宽松的缩写。虽然缩写更宽松，但还是要避免用单字符进行命名，除了临时变量和循环变量。即使局部变量是 final 和不可改变的，也不应该把它示为常量，自然也不能用常量的规则去命名它。

###3.8 临时变量

【推荐】临时变量通常被取名为 i、j、k、m 和 n，它们一般用于整型；c、d、e，它们一般用于字符型。
如：for (int i = 0; i \< len; i++)。

###3.9 类型变量名

【推荐】类型变量可用以下两种风格之一进行命名：

1.  单个的大写字母，后面可以跟一个数字（如：E, T, X, T2）。

2.  以类命名方式（参考[3.2
    类名](https://github.com/Blankj/AndroidStandardDevelop#32-%E7%B1%BB%E5%90%8D)），后面加个大写的
    T（如：RequestT, FooBarT）。

更多还可参考：[[阿里巴巴 Java
开发手册]{.underline}](https://github.com/alibaba/p3c/blob/master/%E9%98%BF%E9%87%8C%E5%B7%B4%E5%B7%B4Java%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C%EF%BC%88%E8%AF%A6%E5%B0%BD%E7%89%88%EF%BC%89.pdf)

###3.10 资源文件命名

【推荐】资源文件命名为全部小写，采用下划线命名法。如果是组件化开发，我们可以在组件和公共模块间创建一个
ui 模块来专门存放资源文件，然后让每个组件都依赖 ui
模块。这样做的好处是如果老项目要实现组件化的话，只需把资源文件都放入 ui
模块即可，如果想对资源文件进行分包，还避免了多个模块间资源不能复用的问题。

【推荐】如果是三方库开发，其使用到的资源文件及相关的 name 都应该使用库名作为前缀，这样做可以避免三方库资源和实际应用资源重名的冲突。

#### 3.10.1 动画资源文件（anim/ 和 animator/）

安卓主要包含属性动画和视图动画，其视图动画包括补间动画和逐帧动画。

【推荐】属性动画文件需要放在 res/animator/ 目录下，视图动画文件需放在 res/anim/ 目录下。

命名规则：{模块名\_}逻辑名称。

说明：{} 中的内容为可选，逻辑名称 可由多个单词加下划线组成。例如：

refresh\_progress.xml、market\_cart\_add.xml、market\_cart\_remove.xml。

【推荐】普通的补间动画或者属性动画，可采用：动画类型\_方向 的命名方式。

例如：

  **名称**               **说明**
  ---------------------- ----------------
  fade\_in               淡入
  fade\_out              淡出
  push\_down\_in         从下方推入
  push\_down\_out        从下方推出
  push\_left             推向左方
  slide\_in\_from\_top   从头部滑动进入
  zoom\_enter            变形进入
  slide\_in              滑动进入
  shrink\_to\_middle     中间缩小

#### 3.10.2 颜色资源文件（color/）

【推荐】专门存放颜色相关的资源文件。命名规则：类型{\_模块名}\_逻辑名称。

说明：{} 中的内容为可选。例如：sel\_btn\_font.xml。

不推荐颜色资源也放于 res/drawable/ 目录，引用时则用 \@drawable 来引用。最好把两者分开。

#### 3.10.3 图片资源文件（drawable/ 和 mipmap/）

【推荐】res/drawable/ 目录下放的是位图文件（.png、.9.png、.jpg、.gif）或编译为可绘制对象资源子类型的
XML
文件，而 res/mipmap/ 目录下放的是不同密度的启动图标，所以 res/mipmap/ 只用于存放启动图标，其余图片资源文件都应该放到 res/drawable/ 目录下。

命名规则：类型{\_模块名}\_逻辑名称、类型{\_模块名}\_颜色。

说明：{} 中的内容为可选；类型 可以是[可绘制对象资源类型](https://github.com/Blankj/AndroidStandardDevelop/blob/master/%E5%8F%AF%E7%BB%98%E5%88%B6%E5%AF%B9%E8%B1%A1%E8%B5%84%E6%BA%90%E7%B1%BB%E5%9E%8B)，也可以是控件类型（具体见附录[UI
控件缩写表](https://github.com/Blankj/AndroidStandardDevelop#ui-%E6%8E%A7%E4%BB%B6%E7%BC%A9%E5%86%99%E8%A1%A8)）；最后可加后缀 \_small 表示小图，\_big 表示大图。

例如：

  名称                        说明
  --------------------------- ---------------------------------------------
  btn\_main\_about.png        主页关于按键 类型\_模块名\_逻辑名称
  btn\_back.png               返回按键 类型\_逻辑名称
  divider\_maket\_white.png   商城白色分割线 类型\_模块名\_颜色
  ic\_edit.png                编辑图标 类型\_逻辑名称
  bg\_main.png                主页背景 类型\_逻辑名称
  btn\_red.png                红色按键 类型\_颜色
  btn\_red\_big.png           红色大按键 类型\_颜色
  ic\_head\_small.png         小头像图标 类型\_逻辑名称
  bg\_input.png               输入框背景 类型\_逻辑名称
  divider\_white.png          白色分割线 类型\_颜色
  bg\_main\_head.png          主页头部背景 类型\_模块名\_逻辑名称
  def\_search\_cell.png       搜索页面默认单元图片 类型\_模块名\_逻辑名称
  ic\_more\_help.png          更多帮助图标 类型\_逻辑名称
  divider\_list\_line.png     列表分割线 类型\_逻辑名称
  sel\_search\_ok.xml         搜索界面确认选择器 类型\_模块名\_逻辑名称
  shape\_music\_ring.xml      音乐界面环形形状 类型\_模块名\_逻辑名称

【推荐】如果有多种形态，如按钮选择器：sel\_btn\_xx.xml，采用如下命名：

  名称                       说明
  -------------------------- -------------------------------------
  sel\_btn\_xx               作用在 btn\_xx 上的 selector
  btn\_xx\_normal            默认状态效果
  btn\_xx\_pressed           state\_pressed 点击效果
  btn\_xx\_focused           state\_focused 聚焦效果
  btn\_xx\_disabled          state\_enabled 不可用效果
  btn\_xx\_checked           state\_checked 选中效果
  btn\_xx\_selected          state\_selected 选中效果
  btn\_xx\_hovered           state\_hovered 悬停效果
  btn\_xx\_checkable         state\_checkable 可选效果
  btn\_xx\_activated         state\_activated 激活效果
  btn\_xx\_window\_focused   state\_window\_focused 窗口聚焦效果

注意：使用 Android Studio 的插件 SelectorChapek 可以快速生成
selector，前提是命名要规范。

### 3.10.4 布局资源文件（layout/）

【推荐】布局资源文件命名规则：类型\_模块名、类型{\_模块名}\_逻辑名称。

说明：{} 中的内容为可选。

例如：

  名称                          说明
  ----------------------------- -----------------------------------------
  activity\_main.xml            主窗体 类型\_模块名
  activity\_main\_head.xml      主窗体头部 类型\_模块名\_逻辑名称
  fragment\_music.xml           音乐片段 类型\_模块名
  fragment\_music\_player.xml   音乐片段的播放器 类型\_模块名\_逻辑名称
  dialog\_loading.xml           加载对话框 类型\_逻辑名称
  ppw\_info.xml                 信息弹窗（PopupWindow） 类型\_逻辑名称
  item\_main\_song.xml          主页歌曲列表项 类型\_模块名\_逻辑名称

#### 3.10.5 菜单资源文件（menu/）

【推荐】菜单相关的资源文件应放在该目录下。命名规则：{模块名\_}逻辑名称。

说明：{} 中的内容为可选。例如：main\_drawer.xml、navigation.xml。

###3.11 values 资源文件（values/）


【推荐】values/ 资源文件下的文件都以 s 结尾，如 attrs.xml、colors.xml、dimens.xml，起作用的不是文件名称，而是 \<resources\> 标签下的各种标签，比如 \<style\> 决定样式，\<color\> 决定颜色，所以，可以把一个大的 xml 文件分割成多个小的文件，比如可以有多个 style 文件，如 styles.xml、styles\_home.xml、styles\_item\_details.xml、styles\_forms.xml。

#### 3.11.1 colors.xml

【推荐】\<color\> 的 name 命名使用下划线命名法，在你的 colors.xml 文件中应该只是映射颜色的名称一个
ARGB 值，而没有其它的。不要使用它为不同的按钮来定义 ARGB 值。反例：

```
\<resources\>

\<color name=\"button\_foreground\"\>\#FFFFFF\</color\>

\<color name=\"button\_background\"\>\#2A91BD\</color\>

\<color name=\"comment\_background\_inactive\"\>\#5F5F5F\</color\>

\<color name=\"comment\_background\_active\"\>\#939393\</color\>

\<color name=\"comment\_foreground\"\>\#FFFFFF\</color\>

\<color name=\"comment\_foreground\_important\"\>\#FF9D2F\</color\>

\...

\<color name=\"comment\_shadow\"\>\#323232\</color\>
```

使用这种格式，会非常容易重复定义 ARGB
值，而且如果应用要改变基色的话会非常困难。同时，这些定义是跟一些环境关联起来的，如 button 或者 comment，应该放到一个按钮风格中，而不是在 colors.xml 文件中。正例：

```
\<resources\>

\<!\-- grayscale \--\>

\<color name=\"white\" \>\#FFFFFF\</color\>

\<color name=\"gray\_light\"\>\#DBDBDB\</color\>

\<color name=\"gray\" \>\#939393\</color\>

\<color name=\"gray\_dark\" \>\#5F5F5F\</color\>

\<color name=\"black\" \>\#323232\</color\>

\<!\-- basic colors \--\>

\<color name=\"green\"\>\#27D34D\</color\>

\<color name=\"blue\"\>\#2A91BD\</color\>

\<color name=\"orange\"\>\#FF9D2F\</color\>

\<color name=\"red\"\>\#FF432F\</color\>

\</resources\>
```

向应用设计者那里要这个调色板，名称不需要跟 \"green\"、\"blue\" 等等相同。\"brand\_primary\"、\"brand\_secondary\"、\"brand\_negative\" 这样的名字也是完全可以接受的。这样规范的颜色很容易修改或重构，会使应用一共使用了多少种不同的颜色变得非常清晰。通常一个具有审美价值的
UI 来说，减少使用颜色的种类是非常重要的。

【推荐】如果某些颜色和主题有关，那就单独写一个 colors\_theme.xml。

#### 3.11.2 dimens.xml

【推荐】像对待 colors.xml 一样对待 dimens.xml 文件，与定义颜色调色板一样，你同时也应该定义一个空隙间隔和字体大小的"调色板"。正例：

```
\<resources\>

\<!\-- font sizes \--\>

\<dimen name=\"font\_22\"\>22sp\</dimen\>

\<dimen name=\"font\_18\"\>18sp\</dimen\>

\<dimen name=\"font\_15\"\>15sp\</dimen\>

\<dimen name=\"font\_12\"\>12sp\</dimen\>

\<!\-- typical spacing between two views \--\>

\<dimen name=\"spacing\_40\"\>40dp\</dimen\>

\<dimen name=\"spacing\_24\"\>24dp\</dimen\>

\<dimen name=\"spacing\_14\"\>14dp\</dimen\>

\<dimen name=\"spacing\_10\"\>10dp\</dimen\>

\<dimen name=\"spacing\_4\"\>4dp\</dimen\>

\<!\-- typical sizes of views \--\>

\<dimen name=\"button\_height\_60\"\>60dp\</dimen\>

\<dimen name=\"button\_height\_40\"\>40dp\</dimen\>

\<dimen name=\"button\_height\_32\"\>32dp\</dimen\>

\</resources\>
```

【推荐】布局时在写 margins 和 paddings 时，你应该使用 spacing\_xx 尺寸格式来布局，而不是像对待 string 字符串一样直接写值，像这样规范的尺寸很容易修改或重构，会使应用所有用到的尺寸一目了然。
这样写会非常有感觉，会使组织和改变风格或布局非常容易。

#### 3.11.3 strings.xml

【推荐】\<string\> 的 name 命名使用下划线命名法，采用以下规则：{模块名\_}逻辑名称，这样方便同一个界面的所有 string 都放到一起，方便查找。

  名称                  说明
  --------------------- ----------------
  main\_menu\_about     主菜单按键文字
  friend\_title         好友模块标题栏
  friend\_dialog\_del   好友删除提示
  login\_check\_email   登录验证
  dialog\_title         弹出框标题
  button\_ok            确认键
  loading               加载文字

#### 3.11.4 styles.xml

【推荐】\<style\> 的 name 命名使用大驼峰命名法，几乎每个项目都需要适当的用 styles.xml 文件，因为对于一个视图来说，有一个重复的外观是很常见的，将所有的外观细节属性（colors、padding、font）放在 styles.xml 文件中。

【推荐】在应用中对于大多数文本内容，最起码应该有一个通用的 styles.xml 文件，例如：

```
\<style name=\"ContentText\"\>

\<item name=\"android:textSize\"\>\@dimen/font\_normal\</item\>

\<item name=\"android:textColor\"\>\@color/basic\_black\</item\>

\</style\>
```

应用到 TextView ：

```
\<TextView

android:layout\_width=\"wrap\_content\"

android:layout\_height=\"wrap\_content\"

android:text=\"\@string/price\"

style=\"\@style/ContentText\"

/\>
```

###3.12 id命名


【推荐】id命名规则：view
缩写{\_模块名}\_逻辑名，例如： btn\_main\_search、btn\_back。

【推荐】如果在项目中有用黄油刀，使用 AS 的插件：ButterKnife
Zelezny，可以非常方便帮助你生成注解；没用黄油刀的话可以使用 Android Code
Generator 插件。

##第四章 代码规范

###4.1 代码布局和格式


基本格式方面使用 AndroidStudio
默认模板即可（使用格式化快捷键处理后基本符合）。

#### 4.1.1 大括号

【推荐】即使是可选的，也使用大括号()。大括号与if, else, for, do,
while语句一起使用，即使只有一条语句(或是空)，也应该把大括号写上。

#### 4.1.2 非空块：K & R 风格

【推荐】一行一个语句，每个语句后要换行。对于非空块和块状结构，大括号遵循
Kernighan 和 Ritchie 风格 (Egyptian brackets):

左大括号前不换行;

左大括号后换行;

右大括号前换行;

如果右大括号是一个语句、函数体或类的终止，则右大括号后换行; 否则不换行。

如果右大括号后面是else或逗号，则不换行。示例：

```
return new MyClass() {

\@Override public void method() {

if (condition()) {

try {

something();

} catch (ProblemException e) {

recover();

}

}

}

};
```

说明：4.8.1节给出了enum类的一些例外。

#### 4.1.3 空块：可以用简洁版本

【推荐】一个空的块状结构里什么也不包含，大括号可以简洁地写成{}，不需要换行。

例外：如果它是一个多块语句的一部分(if/else 或 try/catch/finally)
，即使大括号内没内容，右大括号也要换行。示例：

void doNothing() {}

#### 4.1.4 块缩进

【推荐】每当开始一个新的块，缩进增加4个空格，当块结束时，缩进返回先前的缩进级别。缩进级别适用于代码和注释。(见4.1.2节中的代码示例)

#### 4.1.5 列限制：80或100

【推荐】一个项目可以选择一行80个字符或100个字符的列限制，除了下述例外，任何一行如果超过这个字符数限制，必须自动换行。

例外：不可能满足列限制的行(例如，Javadoc中的一个长URL，或是一个长的JSNI方法参考)。

package和import语句(见3.2节和3.3节)。注释中那些可能被剪切并粘贴到shell中的命令行。

#### 4.1.6 垂直空白

【推荐】以下情况需要使用一个空行：

1.  类内连续的成员之间：字段，构造函数，方法，嵌套类，静态初始化块，实例初始化块。
    例外：
    两个连续字段之间的空行是可选的，用于字段的空行主要用来对字段进行逻辑分组。

<!-- -->

23. 在函数体内，语句的逻辑分组间使用空行。

24. 类内的第一个成员前或最后一个成员后的空行是可选的(既不鼓励也不反对这样做，视个人喜好而定)。

25. 要满足本文档中其他节的空行要求(比如3.3节：import语句)

26. 多个连续的空行是允许的，但没有必要这样做(我们也不鼓励这样做)。

#### 4.1.7 水平空白

【推荐】除了语言需求和其它规则，并且除了文字，注释和Javadoc用到单个空格，单个ASCII空格也出现在以下几个地方：

1.  分隔任何保留字与紧随其后的左括号(()(如if, for catch等)。

<!-- -->

27. 分隔任何保留字与其前面的右大括号(})(如else, catch)。

28. 在任何左大括号前({)，两个例外：

-   \@SomeAnnotation({a, b})(不使用空格)；

-   String\[\]\[\] x = foo;(大括号间没有空格，见下面的Note)。

29. 在任何二元或三元运算符的两侧。这也适用于以下\"类运算符\"符号：

-   类型界限中的&()；

-   catch块中的管道符号(catch (FooException \| BarException e)；

-   foreach语句中的分号。

30. 在, : ;及右括号())后

31. 如果在一条语句后做注释，则双斜杠(//)两边都要空格。这里可以允许多个空格，但没有必要。

32. 类型和变量之间：List list。

33. 数组初始化中，大括号内的空格是可选的，即new int\[\] {5, 6}和new
    int\[\] { 5, 6 }都是可以的。

34. Note：这个规则并不要求或禁止一行的开关或结尾需要额外的空格，只对内部空格做要求。

#### 4.1.8 水平对齐：不做要求

术语说明：水平对齐是指通过增加可变数量的空格来使某一行的字符与上一行的相应字符对齐。

这在不少地方的代码是允许的，但Google编程风格对此不做要求。即使对于已经使用水平对齐的代码，我们也不需要去保持这种风格。以下示例先展示未对齐的代码，然后是对齐的代码：

```
private int x; // this is fine

private Color color; // this too

private int x; // permitted, but future edits

private Color color; // may leave it unaligned
```

【推荐】对齐可增加代码可读性，但它为日后的维护带来问题。考虑未来某个时候，我们需要修改一堆对齐的代码中的一行。这可能导致原本很漂亮的对齐代码变得错位。很可能它会提示你调整周围代码的空白来使这一堆代码重新水平对齐(比如程序员想保持这种水平对齐的风格)。

这就会让你做许多的无用功，增加了reviewer的工作并且可能导致更多的合并冲突。

#### 4.1.9 用小括号来限定组：推荐

【推荐】除非作者和reviewer都认为去掉小括号也不会使代码被误解，或是去掉小括号能让代码更易于阅读，否则我们不应该去掉小括号。我们不能假设读者能记住整个Java运算符优先级表。

### 4.2 代码注释
------------

为了减少他人阅读你代码的痛苦值，请在关键地方做好注释。

#### 4.2.1 类注释

【推荐】每个类完成后应该有作者姓名和联系方式的注释，对自己的代码负责。

```
/\*\*

\* \<pre\>

\* author : Blankj

\* e-mail : xxx\@xx

\* time : 2017/03/07

\* desc : xxxx 描述

\* version: 1.0

\* \</pre\>

\*/

public class WelcomeActivity {

\...

}
```

具体可以在 AS 中自己配制，进入 Settings -\> Editor -\> File and Code
Templates -\> Includes -\> File Header，输入

```
/\*\*

\* \<pre\>

\* author : \${USER}

\* e-mail : xxx\@xx

\* time : \${YEAR}/\${MONTH}/\${DAY}

\* desc :

\* version: 1.0

\* \</pre\>

\*/
```

这样便可在每次新建类的时候自动加上该头注释。

#### 4.2.2 方法注释

【推荐】每一个成员方法（包括自定义成员方法、覆盖方法、属性方法）的方法头都必须做方法头注释，在方法前一行输入 /\*\*
+ 回车 或者设置 Fix doc comment（Settings -\> Keymap -\> Fix doc
comment）快捷键，AS 便会帮你生成模板，我们只需要补全参数即可，如下所示：

```
/\*\*

\* bitmap 转 byteArr

\*

\* \@param bitmap bitmap 对象

\* \@param format 格式

\* \@return 字节数组

\*/

public static byte\[\] bitmap2Bytes(Bitmap bitmap, CompressFormat
format) {

if (bitmap == null) return null;

ByteArrayOutputStream baos = new ByteArrayOutputStream();

bitmap.compress(format, 100, baos);

return baos.toByteArray();

}
```

#### 4.2.3 块注释

【推荐】块注释与其周围的代码在同一缩进级别。它们可以是 /\* \...
\*/ 风格，也可以是 // \... 风格（// 后最好带一个空格）。对于多行的 /\*
\... \*/ 注释，后续行必须从 \* 开始， 并且与前一行的 \* 对齐。如下：


```
/\*

\* This is

\* okay.

\*/

// And so

// is this.

/\* Or you can

-   even do this. \*/
```


【推荐】注释不要封闭在由星号或其它字符绘制的框架里。在写多行注释时，如果你希望在必要时能重新换行（即注释像段落风格一样），那么使用 /\*
\... \*/。

#### 4.2..4 其他一些注释

AS
已帮你集成了一些注释模板，我们只需要直接使用即可，在代码中输入 todo、fixme 等这些注释模板，回车后便会出现如下注释。

// TODO: 17/3/14 需要实现，但目前还未实现的功能的说明

// FIXME: 17/3/14 需要修正，甚至代码是错误的，不能工作，需要修复的说明

###4.3 编程规约


#### 4.3.1 基本编程规范

1.  【推荐】合理布局，有效运用 \<merge\>、\<ViewStub\>、\<include\> 标签。

2.  【推荐】Activity 和 Fragment 里面有许多重复的操作以及操作步骤，所以我们都需要提供一个 BaseActivity 和 BaseFragment，让所有的 Activity 和 Fragment 都继承这个基类。

3.  【推荐】方法基本上都按照调用的先后顺序在各自区块中排列。

4.  【推荐】当一个类有多个构造函数，或是多个同名函数，这些函数应该按顺序出现在一起，中间不要放进其它函数。

5.  【推荐】数据提供统一的入口。无论是在 MVP、MVC 还是 MVVM
    中，提供一个统一的数据入口，都可以让代码变得更加易于维护。比如可使用一个 DataManager，把 http、preference、eventpost、database 都放在 DataManager 里面进行操作，我们只需要与 DataManager 打交道。

6.  【推荐】多用组合，少用继承；

7.  【推荐】
    提取方法，去除重复代码。对于必要的工具类抽取也很重要，这在以后的项目中是可以重用的。

8.  【推荐】可引入 Dagger2 减少模块之间的耦合性。Dagger2 是一个依赖注入框架，使用代码自动生成创建依赖关系需要的代码。减少很多模板化的代码，更易于测试，降低耦合，创建可复用可互换的模块。

9.  【推荐】项目引入 RxAndroid 响应式编程，可以极大的减少逻辑代码。

10. 【推荐】考虑是否内存泄漏，且检查内存使用情况。

11. 【推荐】面向变化编程，而非面向需求编程。

### 4.3.2 基本代码约定

12. 【推荐】及时关闭流。

13. 【推荐】尽量减少对变量的重复计算，如下面的操作：

```
> for (int i = 0; i \< list.size(); i++) {
>
> \...
>
> }
>
> 建议替换为：
>
> for (int i = 0, len = list.size(); i \< len; i++) {
>
> \...
>
> }
```

14. 【推荐】尽量采用懒加载的策略，即在需要的时候才创建。 例如：

```
> String str = \"aaa\";
>
> if (i == 1) {
>
> list.add(str);
>
> }\
> \
> 建议替换为：\
> if (i == 1) {
>
> String str = \"aaa\";
>
> list.add(str);
>
> }
```

15. 【推荐】不要在循环中使用 try...catch...，应该把其放在最外层。

16. 【推荐】使用带缓冲的输入输出流进行 IO 操作。

17. 【推荐】尽量使用 HashMap、ArrayList、StringBuilder，除非线程安全需要，否则不推荐使用 HashTable、Vector、StringBuffer，后三者由于使用同步机制而导致了性能开销。

18. 【推荐】通过引入事件总线，如：EventBus、AndroidEventBus、RxBus，它允许我们在 DataLayer 中发送事件，以便 ViewLayer 中的多个组件都能够订阅到这些事件，减少回调。

19. 【推荐】尽可能使用局部变量。

20. 【推荐】尽量在合适的场合使用单例。使用单例可以减轻加载的负担、缩短加载的时间、提高加载的效率，但并不是所有地方都适用于单例，简单来说，单例主要适用于以下三个方面：

    控制资源的使用，通过线程同步来控制资源的并发访问。

    控制实例的产生，以达到节约资源的目的。

    控制数据的共享，在不建立直接关联的条件下，让多个不相关的进程或线程之间实现通信。

21. 【推荐】把一个基本数据类型转为字符串，基本数据类型.toString() 是最快的方式，String.valueOf(数据) 次之，数据 +
    \"\" 最慢。

22. 【推荐】使用 AS 自带的 Lint 来优化代码结构（什么，你不会？右键
    module、目录或者文件，选择 Analyze -\> Inspect Code）。

####  4.3.3 Android 基本组件

Android 基本组件指
Activity、Fragment、Service、BroadcastReceiver、ContentProvider 等等。

1.  【强制】Activity 间的数据通信，对于数据量比较大的，避免使用 Intent +
    Parcelable 的方式，可以考虑 EventBus 等替代方案，以免造成
    TransactionTooLargeException。

2. 【推荐】Activity\#onSaveInstanceState()方法不是 Activity
生命周期方法，也不保证 一定会被调用。它是用来在 Activity
被意外销毁时保存 UI 状态的，只能用于保存临 时性数据，例如 UI
控件的属性等，不能跟数据的持久化存储混为一谈。持久化存储 应该在
Activity\#onPause()/onStop()中实行。

3. 【强制】Activity 间通过隐式 Intent 的跳转，在发出 Intent 之前必须通过
resolveActivity 检查，避免找不到合适的调用组件，造成
ActivityNotFoundException 的异常。

4.  【强制】避免在
Service\#onStartCommand()/onBind()方法中执行耗时操作，如果确
实有需求，应改用 IntentService 或采用其他异步机制完成。

5. 【强制】避免在
BroadcastReceiver\#onReceive()中执行耗时操作，如果有耗时工作， 应该创建
IntentService 完成，而不应该在 BroadcastReceiver 内创建子线程去做。说明:

由于该方法是在主线程执行，如果执行耗时操作会导致 UI 不流畅。可以使用
IntentService 、 创 建 HandlerThread 或 者 调 用
Context\#registerReceiver (BroadcastReceiver, IntentFilter, String,
Handler)方法等方式，在其他 Wroker线程 执行 onReceive
方法BroadcastReceiver\#onReceive()方法耗时超过 10
秒钟，可能会被系统杀死。

6. 【强制】避免使用隐式 Intent 广播敏感信息，信息可能被其他注册了对应
BroadcastReceiver 的 App 接收。说明:

https://developer.android.com/reference/android/content/BroadcastReceiver.html\#

onReceive(android.content.Context, android.content.Intent)通过
Context\#sendBroadcast()发送的隐式广播会被所有感兴趣的 receiver 接收，恶
意应用注册监听该广播的 receiver 可能会获取到 Intent
中传递的敏感信息，并进行其他危险操作。如果发送的广播为使用
Context\#sendOrderedBroadcast()方法发送 的有序广播，优先级较高的恶意
receiver
可能直接丢弃该广播，造成服务不可用，或者向广播结果塞入恶意数据。如果广播仅限于应用内，则可以使用
LocalBroadcastManager\#sendBroadcast()实现，避免敏感信息外泄和 Intent
拦截的风险。上广播可能被其他应用的如下 receiver 接收导致敏感信息泄漏

7. 【 推 荐 】 添 加 Fragment 时 ， 确 保 FragmentTransaction\#commit()
在 Activity\#onPostResume()或者
FragmentActivity\#onResumeFragments()内调用。 不要随意使用
FragmentTransaction\#commitAllowingStateLoss()来代替，任何
commitAllowingStateLoss()的使用必须经过 code
review，确保无负面影响。说明:

https://wiki.sei.cmu.edu/confluence/display/android/DRD03-J.+Do+not+broad

cast+sensitive+information+using+an+implicit+intent

Activity 可能因为各种原因被销毁，Android 支持页面被销毁前通过

Activity\#onSaveInstanceState() 保 存 自 己 的 状 态 。 但 如 果
FragmentTransaction.commit()发生在 Activity 状态保存之后，就会导致
Activity
重建、恢复状态时无法还原页面状态，从而可能出错。为了避免给用户造成不好的体
验，系统会抛出 IllegalStateExceptionStateLoss 异常。推荐的做法是在
Activity 的onPostResume() 或 onResumeFragments() ( 对 FragmentActivity )
里 执 行 FragmentTransaction.commit()，如有必要也可在
onCreate()里执行。不要随意改用

FragmentTransaction.commitAllowingStateLoss()或者直接使用 try-catch
避免crash，这不是问题的根本解决之道，当且仅当你确认 Activity
重建、恢复状态时，本次 commit 丢失不会造成影响时才可这么做。

8. 【推荐】不要在
Activity\#onDestroy()内执行释放资源的工作，例如一些工作线程的
销毁和停止，因为 onDestroy()执行的时机可能较晚。可根据实际需要，在
Activity\#onPause()/onStop()中结合 isFinishing()的判断来执行。

9. 【推荐】如非必须，避免使用嵌套的 Fragment。 说明:

1) onActivityResult()方法的处理错乱，内嵌的 Fragment
可能收不到该方法的回调， 需要由宿主 Fragment 进行转发处理;

2) 突变动画效果;

3)非必须的场景尽可能避免使用嵌套 Fragment，如需使用请注意上述问题。

参考：

https://www.androiddesignpatterns.com/2013/08/fragment-transaction-commi

https://developer.android.com/reference/android/app/FragmentTransaction.ht

ml\#commit())

嵌套 Fragment 是在 Android API 17 添加到 SDK 以及 Support
库中的功能，Fragment 嵌套使用会有一些坑，容易出现
bug，比较常见的问题有如下几种:被继承的 setRetainInstance()，导致在
Fragment 重建时多次触发不必要的逻辑。

10. 【推荐】总是使用显式Intent启动或者绑定Service，且不要为服务声明IntentFilter，
保证应用的安全性。如果确实需要使用隐式调用，则可为 Service 提供 Intent
Filter 并从 Intent 中排除相应的组件名称，但必须搭配使用
Intent\#setPackage()方法设置 Intent
的指定包名，这样可以充分消除目标服务的不确定性。

11. 【推荐】Service 需要以多线程来并发处理多个启动请求，建议使用
IntentService， 可避免各种复杂的设置。

12. 【推荐】对于只用于应用内的广播，优先使用 LocalBroadcastManager
来进行注册 和发送，LocalBroadcastManager
安全性更好，同时拥有更高的运行效率。

13. 【推荐】当前 Activity 的 onPause 方法执行结束后才会执行下一个
Activity 的 onCreate 方法，所以在 onPause
方法中不适合做耗时较长的工作，这会影响到页面之间的跳 转效率。

14. 【强制】不要在 Android 的 Application
对象中缓存数据。基础组件之间的数据共享 请使用 Intent 等机制，也可使用
SharedPreferences 等数据持久化机制。

15. 【推荐】使用 Toast 时，建议定义一个全局的 Toast
对象，这样可以避免连续显示 Toast 时不能取消上一次 Toast
消息的情况(如果你有连续弹出 Toast 的情况，避免 使用 Toast.makeText)。

16. 【强制】使用 Adapter 的时候，如果你使用了 ViewHolder 做缓存，在
getView()的 方法中无论这项 convertView
的每个子控件是否需要设置属性(比如某个 TextView 设置的文本可能为
null，某个按钮的背景色为透明，某控件的颜色为透明等)，都需
要为其显式设置属性(Textview 的文本为空也需要设置
setText(\"\")，背景透明也需要 设置)，否则在滑动的过程中，因为 adapter
item 复用的原因，会出现内容的显示错 乱。

17. 【强制】Activity 或者 Fragment 中动态注册 BroadCastReceiver
时，registerReceiver() 和 unregisterReceiver()要成对出现。说明:

如果 registerReceiver()和
unregisterReceiver()不成对出现，则可能导致已经注册的receiver
没有在合适的时机注销，导致内存泄漏，占用内存空间，加重
SystemService负担。部分华为的机型会对 receiver
进行资源管控，单个应用注册过多 receiver
会触发管控模块抛出异常，应用直接崩溃。Activity
的生命周期不对应，可能出现多次 onResume 造成 receiver
注册多个，但最终只注销一个，其余 receiver 产生内存泄漏。

####  4.3.4 UI 与布局

1.  【强制】布局中不得不使用 ViewGroup 多重嵌套时，不要使用 LinearLayout
    嵌套， 改用 RelativeLayout，可以有效降低嵌套数。说明:

Android 应用页面上任何一个 View 都需要经过 measure、layout、draw
三个步骤才能被正确的渲染。从 xml layout 的顶部节点开始进行
measure，每个子节点都需
要向自己的父节点提供自己的尺寸来决定展示的位置，在此过程中可能还会重新measure(由此可能导致
measure 的时间消耗为原来的 2-3 倍)。节点所处位置越深，套嵌带来的 measure
越多，计算就会越费时。这就是为什么扁平的 View
结构会性能更好。同时，页面拥上的 View 越多，measure、layout、draw
所花费的时间就越久。要缩 短这个时间，关键是保持 View
的树形结构尽量扁平，而且要移除所有不需要渲染的View。理想情况下，总共的
measure，layout，draw 时间应该被很好的控制在 16ms以内，以保证滑动屏幕时
UI 的流畅。要找到那些多余的 View(增加渲染延迟的 view)，可以用 Android
StudioMonitor里的 Hierarachy Viewer 工具，可视化的查看所有的 view。

2. 【推荐】在 Activity 中显示对话框或弹出浮层时，尽量使用
DialogFragment，而非 Dialog/AlertDialog，这样便于随 Activity
生命周期管理对话框/弹出浮层的生命周期。

3. 【推荐】源文件统一采用 UTF-8 的形式进行编码。

4. 【强制】禁止在非 ui 线程进行 view 相关操作。

5. 【推荐】文本大小使用单位 dp，view 大小使用单位 dp。对于
Textview，如果在文 字大小确定的情况下推荐使用 wrap\_content
布局避免出现文字显示不全的适配问 题。

6. 【强制】禁止在设计布局时多次设置子 view 和父 view
中为同样的背景造成页面过 度绘制，推荐将不需要显示的布局进行及时隐藏。

7. 【推荐】灵活使用布局，推荐 Merge、ViewStub 来优化布局，尽可能多的减少
UI 布局层级，推荐使用 FrameLayout，LinearLayout、RelativeLayout 次之。

8. 【推荐】在需要时刻刷新某一区域的组件时，建议通过以下方式避免引发全局
layout 刷新:

1) 设置固定的 view 大小的高宽，如倒计时组件等;

2) 调用 view 的 layout 方式修改位置，如弹幕组件等;

3) 通过修改 canvas 位置并且调用 invalidate(int l, int t, int r, int
b)等方式限定刷新区域;

4) 通过设置一个是否允许 requestLayout 的变量，然后重写控件的 requestlayout、onSizeChanged 方法，判断控件的大小没有改变的情况下，当进入requestLayout
的时候，直接返回而不调用 super 的 requestLayout 方法。

9. 【推荐】不能在 Activity 没有完全显示时显示 PopupWindow 和 Dialog。

10. 【推荐】尽量不要使用 AnimationDrawable，它在初始化的时候就将所有图片加载到内存中，特别占内存，并且还不能释放，释放之后下次进入再次加载时会报错。

11. 【强制】不能使用 ScrollView 包裹 ListView/GridView/ExpandableListVIew;因为这 样会把 ListView 的所有 Item 都加载到内存中，要消耗巨大的内存和 cpu 去绘制图 面。

##### 4.3.5 进程、线程与消息通信

1.  【强制】不要通过 Intent 在 Android 基础组件之间传递大数据(binder transaction 缓存为 1MB)，可能导致 OOM。

2. 【强制】在 Application 的业务初始化代码加入进程判断，确保只在自己需要的进程初始化。特别是后台进程减少不必要的业务初始化。

3. 【强制】新建线程时，必须通过线程池提供(AsyncTask 或者 ThreadPoolExecutor 或者其他形式自定义的线程池)，不允许在应用中自行显式创建线程。

说明:
使用线程池的好处是减少在创建和销毁线程上所花的时间以及系统资源的开销，解
决资源不足的问题。如果不使用线程池，有可能造成系统创建大量同类线程而导致消耗完内存或者"过度切换"的问题。另外创建匿名线程不便于后续的资源使用分析，
对性能分析等会造成困扰。

4. 【强制】线程池不允许使用 Executors 去创建，而是通过 ThreadPoolExecutor 的方式，这样的处理方式让写的同学更加明确线程池的运行规则，规避资源耗尽的风险。

5. 【强制】子线程中不能更新界面，更新界面必须在主线程中进行，网络操作不能在
主线程中调用。

6. 【强制】不要在非 UI 线程中初始化 ViewStub，否则会返回 null。

7. 【推荐】尽量减少不同 APP 之间的进程间通信及拉起行为。拉起导致占用系统资源，影响用户体验。

8. 【推荐】新建线程时，定义能识别自己业务的线程名称，便于性能优化和问题排查。

9. 【推荐】ThreadPoolExecutor 设置线程存活时间(setKeepAliveTime)，确保空闲时 线程能被释放。

10. 【推荐】禁止在多进程之间用 SharedPreferences 共享数据，虽然可以，但官方已不推荐。

11. 【推荐】谨慎使用 Android 的多进程，多进程虽然能够降低主进程的内存压力，但会 遇到如下问题:

不能实现完全退出所有 Activity 的功能;

多进程间通过 SharedPreferences 共享数据时不稳定。

首次进入新启动进程的页面时会有延时的现象(有可能黑屏、白屏几秒，是白屏还是黑屏和新
Activity 的主题有关);

应用内多进程时，Application 实例化多次，需要考虑各个模块是否都需要在所有进程中初始化;

#### 4.3.6 文件与数据库

1.  【强制】任何时候不要硬编码文件路径，请使用 Android 文件系统 API 访问。 说明:

Android 应用提供内部和外部存储，分别用于存放应用自身数据以及应用产生的用户数据。可以通过相关 API 接口获取对应的目录，进行文件操作。

2. 【强制】当使用外部存储时，必须检查外部存储的可用性。

3. 【强制】应用间共享文件时，不要通过放宽文件系统权限的方式去实现，而应使用FileProvider。

4. 【推荐】SharedPreference 中只能存储简单数据类型(int、boolean、String等)， 复杂数据类型建议使用文件、数据库等其他方式存储。

5. 【推荐】SharedPreference 提交数据时，尽量使用 Editor\#apply()，而非 Editor\#commit()。一般来讲，仅当需要确定提交结果，并据此有后续操作时，才使用 Editor\#commit()。

说明:

SharedPreference 相关修改使用 apply 方法进行提交会先写入内存，然后异步写入 磁盘，commit
方法是直接写入磁盘。如果频繁操作的话 apply 的性能会优于 commit，apply 会将最后修改内容写入磁盘。但是如果希望立刻获取存储操作的结果，并据此做相应的其他操作，应当使用
commit。

6. 【强制】数据库 Cursor 必须确保使用完后关闭，以免内存泄漏。 说明:

Cursor 是对数据库查询结果集管理的一个类，当查询的结果集较小时，消耗内存不易察觉。但是当结果集较大，长时间重复操作会导致内存消耗过大，需要开发者在操作完成后手动关闭 Cursor。

数据库 Cursor 在创建及使用时，可能发生各种异常，无论程序是否正常结束，必须在最后确保 Cursor 正确关闭，以避免内存泄漏。同时，如果 Cursor 的使用还牵涉多线程场景，那么需要自行保证操作同步。

7. 【强制】多线程操作写入数据库时，需要使用事务，以免出现同步问题。
说明:

Android 的通过 SQLiteOpenHelper 获取数据库 SQLiteDatabase 实例，Helper 中会 自动缓存已经打开的 SQLiteDatabase 实例，单个 App 中应使用 SQLiteOpenHelper 的单例模式确保数据库连接唯一。由于 SQLite 自身是数据库级锁，单个数据库操作是保证线程安全的(不能同时写入)，transaction 时一次原子操作，因此处于事务中的操作是线程安全的。

若同时打开多个数据库连接，并通过多线程写入数据库，会导致数据库异常，提示数据库已被锁住。

8. 【推荐】大数据写入数据库时，请使用事务或其他能够提高 I/O 效率的机制，保证执行速度。

9. 【强制】执行 SQL 语句时，应使用
SQLiteDatabase\#insert()、update()、delete()， 不要使用
SQLiteDatabase\#execSQL()，以免 SQL 注入风险。

10.【强制】如果 ContentProvider 管理的数据存储在 SQL 数据库中，应该避免将不受 信任的外部数据直接拼接在原始 SQL
语句中，可使用一个用于将 ? 作为可替换参数的选择子句以及一个单独的选择参数数组，会避免 SQL 注入。

####  4.3.7 Bitmap、Drawable 与动画

1.【强制】加载大图片或者一次性加载多张图片，应该在异步线程中进行。图片的加载，涉及到 IO 操作，以及 CPU 密集操作，很可能引起卡顿。

2. 【强制】在 ListView，ViewPager，RecyclerView，GirdView 等组件中使用图片时，应做好图片的缓存，避免始终持有图片导致内存泄露，也避免重复创建图片，引起性能问题。建议 使 用 Fresco ( https://github.com/facebook/fresco)、 Glide (https://github.com/bumptech/glide)等图片库。

3. 【强制】png 图片使用 tinypng 或者类似工具压缩处理，减少包体积。

4. 【推荐】应根据实际展示需要，压缩图片，而不是直接显示原图。手机屏幕比较小，

直接显示原图，并不会增加视觉上的收益，但是却会耗费大量宝贵的内存。

5. 【强制】使用完毕的图片，应该及时回收，释放宝贵的内存。6.
【推荐】针对不同的屏幕密度，提供对应的图片资源，使内存占用和显示效果达到合理的平衡。如果为了节省包体积，可以在不影响 UI 效果的前提下，省略低密度图 片。

7. 【强制】在 Activity.onPause()或 Activity.onStop()回调中，关闭当前 activity 正在执 行的的动画。页面退出时，不关闭该页面相关的动画。

8. 【推荐】在动画或者其他异步任务结束时，应该考虑回调时刻的环境是否还支持业
务处理。例如 Activity 的 onStop()函数已经执行，且在该函数中主动释放了资源，此时回调中如果不做判断就会空指针崩溃。

动画结束回调中，直接使用资源不加判断，导致异常。

9. 【推荐】使用 inBitmap 重复利用内存空间，避免重复开辟新内存。

1 0.【推荐】使用 ARGB\_565 代替 ARGB\_888，在不怎么降低视觉效果的前提下，减少 内存占用。

说明: android.graphics.Bitmap.Config 类中关于图片颜色的存储方式定义:

1\) ALPHA\_8 代表 8 位 Alpha 位图;

2\) ARGB\_4444 代表 16 位 ARGB 位图;

3\) ARGB\_8888 代表 32 位 ARGB 位图;

4\) RGB\_565 代表 8 位 RGB 位图。

位图位数越高，存储的颜色信息越多，图像也就越逼真。大多数场景使用的是

ARGB\_8888 和 RGB\_565，RGB\_565 能够在保证图片质量的情况下大大减少内存的开销，是解决 oom 的一种方法。

但是一定要注意 RGB\_565 是没有透明度的，如果图片本身需要保留透明度，那么就不能使用 RGB\_565。

11【.推荐】尽量减少Bitmap(BitmapDrawable)的使用，尽量使用纯色(ColorDrawable)、渐变色(GradientDrawable)、StateSelector(StateListDrawable)等与 Shape 结合的形式构建绘图。

12.【推荐】谨慎使用 gif 图片，注意限制每个页面允许同时播放的 gif 图片，以及单个 gif 图片的大小。

13.【参考】大图片资源不要直接打包到 apk，可以考虑通过文件仓库远程下载，减小包 体积。

14.【推荐】根据设备性能，选择性开启复杂动画，以实现一个整体较优的性能和体验;

15.【推荐】在有强依赖 onAnimationEnd 回调的交互时，如动画播放完毕才能操作页面，onAnimationEnd 可能会因各种异常没被回调(参考:
https://stackoverflow.com/questions/5474923/onanimationend-is-not-getting-called-onanimationstart-works-fine )， 建 议 加 上 超 时 保 护 或 通 过 postDelay 替 代 onAnimationEnd。

16.【推荐】当 View Animation 执行结束时，调用 View.clearAnimation()释放相关资源。

#### 4.3.8 安全

1.【强制】使用 PendingIntent 时，禁止使用空 intent，同时禁止使用隐式 Intent。说明:

使用 PendingIntent 时，使用了空 Intent,会导致恶意用户劫持修改 Intent 的内 容。禁止使用一个空 Intent 去构造 PendingIntent，构造 PendingIntent
的 Intent 一定要设置 ComponentName 或者 action。PendingIntent 可以让其他 APP 中的代码像是运行自己 APP 中。PendingIntent 的 intent 接收方在使用该
intent 时与发送方有相同的权限。在使用 PendingIntent时，PendingIntent 中包装的 intent 如果是隐式的 Intent，容易遭到劫持，导致信息泄露。mPendingIntent 是通过 new
Intent()构造原始 Intent 的，所以为"双无"Intent，这个PendingIntent 最终被通过 AccountManager.addAccount 方法传递给了恶意 APP 接口。 因此当
PendingIntent 触发执行时，发送的 intent 很可能被嗅探或者劫持，导致 intent内容泄漏。

2. 【强制】禁止使用常量初始化矢量参数构建 IvParameterSpec，建议 IV 通过随机方 式产生。说明:
使用固定初始化向量，结果密码文本可预测性会高得多，容易受到字典式攻击。iv的作用主要是用于产生密文的第一个 block，以使最终生成的密文产生差异(明文相
同的情况下)，使密码攻击变得更为困难，除此之外 iv 并无其它用途。因此 iv 通过随机方式产生是一种十分简便、有效的途径。

3. 【强制】将 android:allowbackup 属性设置为 false，防止 adb backup 导出数据。说明:

在 AndroidManifest.xml 文件中为了方便对程序数据的备份和恢复在 Android API level 8 以后增加了 android:allowBackup 属性值。默认情况下这个属性值为 true,故当 allowBackup 标志值为 true 时，即可通过 adb backup 和 adb restore 来备份和恢复应用程序数据。

4. 【强制】在实现的 HostnameVerifier 子类中，需要使用 verify 函数效验服务器主机名的合法性，否则会导致恶意程序利用中间人攻击绕过主机名效验。说明:

在握手期间，如果 URL 的主机名和服务器的标识主机名不匹配，则验证机制可以回调此接口的实现程序来确定是否应该允许此连接。如果回调内实现不恰当，默认受所有域名，则有安全风险。

5. 【强制】利用 X509TrustManager 子类中的 checkServerTrusted 函数效验服务器端 证书的合法性。说明:

在实现的 X509TrustManager 子类中未对服务端的证书做检验，这样会导致不被信任的证书绕过证书效验机制。

6. 【强制】META-INF 目录中不能包含如.apk,.odex,.so 等敏感文件，该文件夹没有经 过签名，容易被恶意替换。

7. 【强制】Receiver/Provider 不能在毫无权限控制的情况下，将 android:export 设置 为 true。

8. 【参考】数据存储在 Sqlite 或者轻量级存储需要对数据进行加密，取出来的时候进 行解密。

9. 【强制】阻止 webview 通过 file:schema 方式访问本地敏感数据。

10.【强制】不要广播敏感信息，只能在本应用使用 LocalBroadcast，避免被别的应用收到，或者 setPackage 做限制。

11.【强制】不要把敏感信息打印到 log 中。说明:

在 APP 的开发过程中，为了方便调试，通常会使用 log 函数输出一些关键流程的信息，这些信息中通常会包含敏感内容，如执行流程、明文的用户名密码等，这会让攻击者更加容易的了解 APP 内部结构方便破解和攻击，甚至直接获取到有价值的敏感信息。

```
String username = \"log\_leak\"; String password = \"log\_leak\_pwd\";

Log.d(\"MY\_APP\", \"usesname\" + username); Log.d(\"MY\_APP\",
\"password\" + password, new Throwable()); Log.v(\"MY\_APP\", \"send
message to server ");
```
以上代码使用 Log.d Log.v 打印程序的执行过程的 username 等调试信息，日志没有关闭，攻击者可以直接从 Logcat 中读取这些敏感信息。所以在产品的线上版本中关闭调试接口，不要输出敏感信息。

12.【强制】对于内部使用的组件，显示设置组件的\"android:exported\"属性为 false。

13.【强制】应用发布前确保 android:debuggable 属性设置为 false。
14.【强制】使用 Intent Scheme URL 需要做过滤。说明:

Android 应用使用 Intent 机制在组件之间传递数据，如果应用在使用 getIntent()，getAction()，Intent.getXXXExtra()获取到空数据、异常或者畸形数据时没有进行异
常捕获，应用就会发生 Crash，应用不可使用(本地拒绝服务)。恶意应用可通过向受害者应用发送此类空数据、异常或者畸形数据从而使应用产生本地拒绝服务。如果浏览器支持
Intent Scheme Uri 语法，如果过滤不当，那么恶意用户可能通过浏览器 js 代码进行一些恶意行为，比如盗取 cookie 等。如果使用了 Intent.parseUri 函数，获取的 intent 必须严格过滤，intent
至少包含addCategory("android.intent.category.BROWSABLE") ，setComponent(null) ，setSelector(null)3 个策略。

15.【强制】密钥加密存储或者经过变形处理后用于加解密运算，切勿硬编码到代码中。

16.【强制】将所需要动态加载的文件放置在 apk 内部，或应用私有目录中，如果应用必须要把所加载的文件放置在可被其他应用读写的目录中(比如
sdcard)，建议对不可信的加载源进行完整性校验和白名单处理，以保证不被恶意代码注入。

17.【强制】除非 min API level \>=17，请注意 addJavascriptInterface 的使用。 说明:
```
Intent intent = Intent.parseUri(uri.toString().trim().substring(15), 0);
intent.addCategory(\"android.intent.category.BROWSABLE\");
context.startActivity(intent);
```
应用程序在加解密时，使用硬编码在程序中的密钥，攻击者通过反编译拿到密钥可

以轻易解密 APP 通信数据。API level\>=17，允许 js 被调用的函数必须以\@JavascriptInterface 进行注解，因此不受影响; 对于 API level \< 17，尽量不要使用 addJavascriptInterface，如果一定

要用，那么:

1\) 使用 https 协议加载 URL，使用证书校验，防止访问的页面被篡改挂马;

2\) 对加载 URL 做白名单过滤、完整性校验等防止访问的页面被篡改;

3\) 如果加载本地 html,应该会 HTML 内置在 APK 中，以及对 HTML 页面进行完整性校验。

18.【强制】使用 Android 的 AES/DES/DESede 加密算法时，不要使用默认的加密模式 ECB，应显示指定使用 CBC 或 CFB 加密模式。说明:

1\) ECB:Electronic codebook，电子密码本模式

2\) CBC:Cipher-block chaining，密码分组链接模式

3\) CFB:Cipher feedback，密文反馈模式

4\) OFB:Output feedback，输出反馈模式

19.【强制】不要使用 loopback 来通信敏感信息。

20.【推荐】对于不需要使用 File 协议的应用，禁用 File 协议，显式设置 webView. getSettings().setAllowFileAccess(false)，对于需要使用 File 协议的应用，禁止 File 协议调用 JavaScript，显式设置
webView.getSettings().setJavaScriptEnabled(false)。

21【.强制】AndroidAPP在HTTPS通信中，验证策略需要改成严格模式。说明:Android APP 在 HTTPS 通信中，使用 ALLOW\_ALL\_HOSTNAME\_VERIFIER，表示允许和所有的 HOST 建立 SSL
通信，这会存在中间人攻击的风险，最终导致敏感信息可能会被劫持，以及其他形式的攻击。如果加载本地 html,应该会 HTML 内置在 APK 中，以及对 HTML 页面进行完整性校验。加密模式 ECB、CBC、CFB、OFB 等，其中
ECB 的安全性较弱，会使相同的铭文在不同的时候产生相同的密文，容易遇到字典攻击，建议使用 CBC 或 CFB 模式。

22.【推荐】Android5.0 以后安全性要求较高的应用应该使用 window.setFlag
(LayoutParam.FLAG\_SECURE) 禁止录屏。

23.【推荐】zip 中不建议允许../../file 这样的路径，可能被篡改目录结构，造成攻击。 说 明:当 zip 压缩包中允许存在\"../\"的字符串，攻击者可以利用多个\"../\"在解压时改变
zip 文件存放的位置，当文件已经存在是就会进行覆盖，如果覆盖掉的文件是 so、 dex 或者 odex 文件，就有可能造成严重的安全问题。

24.【强制】开放的 activity/service/receiver 等需要对传入的 intent 做合法性校验。

25.【推荐】加密算法:使用不安全的 Hash 算法(MD5/SHA-1)加密信息，存在被破解的风险，建议使用 SHA-256 等安全性更高的 Hash 算法。

26.【推荐】Android WebView 组件加载网页发生证书认证错误时,采用默认的处理方法 handler.cancel()，停止加载问题页面。 Android WebView 组件加载网页发生证书认证错误时，会调用 WebViewClient 类的
onReceivedSslError 方法，如果该方法实现调用了 handler.proceed()来忽略该证书错误，则会受到中间人攻击的威胁，可能导致隐私泄露.

27【推荐】直接传递命令字或者间接处理有敏感信息或操作时，避免使用 socket 实现， 使用能够控制权限校验身份的方式通讯。

#### 4.3.9 其他

1.  【强制】不要通过 Msg 传递大的对象，会导致内存问题。

<!-- -->

23. 【强制】不能使用 System.out.println 打印 log。

正例:

Log.d(TAG, \"Some Android Debug info \...\");

反例:

System.out.println(\"System out println ...\");

3. 【强制】Log 的 tag 不能是\" \"。

说明:

日志的 tag 是空字符串没有任何意义，也不利于过滤日志。

正例:
```
private static String TAG = \"LoginActivity\";

Log.e(TAG, \"Login failed!\");
```
反例:
```
Log.e(\"\", \"Login failed!\");

private static String TAG = \"LoginActivity\"; Log.e(TAG, \"Login
failed!\");
```
附录


参考文章：

[[阿里巴巴Android开发手册]](https://www.wanandroid.com/blogimgs/a2609aed-1000-4039-93c3-7541aaa2013b.pdf)

 [[Google Java
编程风格规范]](https://link.jianshu.com/?t=http://www.hawstein.com/posts/google-java-style.html)

 [[Google 官方 Android
编码风格规范]](https://link.jianshu.com/?t=http://www.360sdn.com/2013/android_0517/144.html)

[[Android-Code-Style]](https://github.com/oyjt/Android-Code-Style)

其他参考：

基于ReactNative框架的混合开发编码规范请参考：《技术开发中心ReactNative开发规范》
