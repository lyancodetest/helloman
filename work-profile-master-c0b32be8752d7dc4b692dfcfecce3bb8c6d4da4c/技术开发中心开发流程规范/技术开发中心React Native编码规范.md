### 卫盈联信息技术（深圳）有限公司 

技术开发中心React Native编码规范

2019年12月16日

------





## 前言

本编码规范包含了React Native开发的总体指导性原则，React Native项目工程规范，命名规范，代码规范和注释规范五大章节，其中代码规范又分为编码风格、ES规范和RN规范三个部分。每个章节内容是推荐性的编程经验条陈，或者是针对该章节主题的编程规约。根据约束力度，把编码约定分成【强制】、【推荐】两个等级：

- 【强制】：必须遵守。违反极有可能引起严重后果。
- 【推荐】：建议遵守。长期遵守这样的约定，有助于维护系统的稳定和提高合作效率。

本编码规范不涉及基于iOS和Android的原生开发相关规约。若要了解原生代码开发规范请参考：

* 《技术开发中心iOS开发规范》

* 《技术开发中心Android开发规范》





## 第一章  RN开发总则

### 1.1  模块化和组件化

【强制】使用ES6、ES7语法。

【推荐】应用应该按照模块化、组件化和分层思想进行设计开发。例如将原生功能的代码封装为职责单一的RN库，统一上层调用接口，使得平台差异透明化，降低耦合，也方便复用，减少项目的开发维护成本。

【强制】使用ES6模块化标准import/export。ES6 在语言标准的层面上，实现了模块功能，而且实现得相当简单，旨在成为浏览器和服务器通用的模块解决方案。其模块功能主要由两个命令构成：`export`和`import`。`export`命令用于规定模块的对外接口，`import`命令用于输入其他模块提供的功能。基本规则：

> * 每一个模块只加载一次， 每一个JS只执行一次， 如果下次再去加载同目录下同文件，直接从内存中读取。 一个模块就是一个单例，或者说就是一个对象；
> * 每一个模块内声明的变量都是局部变量， 不会污染全局作用域；
> * 模块内部的变量或者函数可以通过export导出；
> * 一个模块可以导入别的模块

【推荐】组件化就是基于可重用的目的，将一个大的软件系统按照分离关注点的形式，拆分成多个独立的组件，主要目的就是减少耦合。独立出来的组件可以单独维护和升级而不会影响到其他的组件。组件是构建页面的基本组成单位，一般分为下面四种类型：

1. 展示型组件   给定的输入，输出一定。没有交互逻辑  

2. 容器型组件   通常是作为数据容器，并将数据分发到子组件。  

3. 交互性组件   大多数组件都是交互组件，满足用户的交互需求。比如输入框，下拉框等。  

4. 功能性组件   不在页面中展示，不与用户直接接触。通常以高阶组件的形式存在，给现有的组件注入功能。比如我需要实现一个可以拖动的功能，这个东西是抽象的，不是具体的组件。大概是这样的用法:

   ```jsx
   <Drag >
   <Modal />
   </Drag>
   ```

【强制】在迭代过程应该沉淀出一些基础组件和业务功能组件，供内部复用和维护。

【强制】设计组件和模块应遵循职责单一职能原则，且避免职责重叠或者覆盖不均匀。

>单一职责原则描述的是如果一个模块承担的职责过多，就等于把这些职责耦合在一起。一个职责的变化可能会削弱或者抑制这个类完成其他职责的能力。这种耦合会导致脆弱的设计，当发生变化时，设计会遭受到意想不到的破坏。如果想要避免这种现象的发生，就要尽可能的遵守单一职责原则，核心就是解耦和增强内聚性。只有模块和组件满足单一职责原则，代码才能够更好地被修改，扩展，才能真正地面对变化编程。

【强制】技术服务业务。组件或模块的划分，应先从业务角度考虑，再从技术角度考虑。

【强制】分层原则：将基础服务下沉，将业务服务上浮。区分基础组件和业务组件（注意：业务组件是指业务功能组件而不是业务逻辑组件，即组件只能具备业务性用户交互的结构性功能代码，但不能有处理业务数据的逻辑代码）。

【推荐】明确Sence层的编码领域:  顾名思义，场景是组件组装和组件数据出入的地方，应该只包含数据流控制和胶水性代码。具体的用户交互功能由组件实现，业务逻辑处理由store层实现。

【推荐】明确Store层的编码领域：应该Store集中处理和存储业务数据以及元数据，为视图层提供数据源和数据状态变化的代码层。充分利用类似mobx函数值的计算缓存和可观察性，是提高Store层编码必须考虑的设计原则。

【推荐】项目迭代总是趋向无序混乱发展，为降低熵值。组件或模块的设计和划分，应满足高内聚低偶合原则，且保持模块规模大小适当，模块依赖关系适当，以及抽象级别适当。

【推荐】合适抽象的原则：为一般逻辑编码，为特殊逻辑配置，即代码描述的应该是一般逻辑，而将硬编码和分支策略做成可配置化。

【推荐】确定和设计程序的元数据：将代码中的硬编码部分、分支策略和配置化数据称为程序的元数据。

【强制】保持模块和组件的纯粹性。纯粹性包含两个方面：一是功能是特定和确定的，给定输入，输出一定。另一点是没有副作用（side effect）（代码不会对外界产生影响，也不依赖外界）。

【推荐】不要给一个好的库再封装。封装是一个异常，而不一个规范。

>大多数封装类都与底层库十分相似（有些情况下是1：1的镜像关系，而有时候以10倍的功耗来完成原始库中1/10的功能）如果在不久对底层库进行改动，这个库的封装类到后来也不得不更改。有时也将业务逻辑融入到封装类中，使它既不是一个好的封装类也不是一个好的业务代码，而是处于在两者之间的层次。

【推荐】不过度设计。并非一切都是通用的，设计总是为了解决不断变化的现实世界的需求，即使我们奇迹般的找了一个完美的抽象，它仍然有一个有效期。

【推荐】如果没有合适的抽象，复制比错误的抽象更好。复制有时是正确的抽象，当系统的某些部分具有相似的代码，一个好的抽象就出现了。复制暴露了许多的使用情况并使得界限更加清晰。

【推荐】如果没有合适的设计，就写容易被删除的代码，而不是可拓展的（低耦合优先于可拓展性）。

### 1.2  平台差异性

【推荐】调式代码时考虑JavaScript 运行时内核的不一致。React Native 比较微妙和棘手的方面在于它是在 JavaScript 内核的环境中执行的。以下是我们遇到的情况的总结结果：

- iOS 环境中运行会使用平台自己的 [JavaScript 内核](https://link.zhihu.com/?target=https%3A//developer.apple.com/documentation/javascriptcore)。这意味着 iOS 不会给我们添麻烦。
- Android 并不会使用它自己的 JavaScript 内核，所以 React Native 捆绑了自己的。
- 调试时，React Native 附带了一个 Chrome 的开发者工具。但是一旦接入了这个调试工具，所有的 JavaScript 代码就跑在了 Chrome 的 V8 引擎上了。这在 99.99%的情况下是 OK 的，但在我们遇到了这么一种情况，toLocalString 在 iOS 环境下很正常，但是在 Android 上只有调试状态下才工作。这说明 Android 的 JavaScript 内核[不包含 toLocalString](https://link.zhihu.com/?target=https%3A//github.com/facebook/react-native/issues/15717)，它就默默的失败了，除非你在调试，但这种情况下它使用的又是 V8 引擎。如果不知道这样的技术细节，带给工程师们的会是几天痛苦的调试过程。

### 1.3   Mixins

【推荐】不推荐使用[SHOULD NOT] [mixins](https://hulufei.gitbooks.io/react-tutorial/content/mixin.html) 。Mixins会增加隐式的依赖，导致命名冲突，并且会以滚雪球式增加复杂度。在大多数情况下Mixins可以被更好的方法替代，如：组件化，高阶组件，工具模块等。



## 第二章  工程规范



### 1.1  文件规范

- 【推荐】 JavaScript 文件使用无 BOM 的 UTF-8 编码。
- 【推荐】 每个文件应保证执行其独立业务，遵循面向对象最小知识原则。
- 【推荐】确定好项目的文件目录结构，要求文件层次清晰，功能划分明确。
- 【强制】使用ES6、ES7编写代码，定义方法时，每个方法结尾使用‘;’进行分隔。
- 【推荐】统一入口文件为App.js；说明：在index.android.js和index.ios.js文件中，统一入口文件为App.js,且保持所在目录和index.android.js和index.ios.js、index.js同级。
- 【推荐】文件命名遵循lowerCamelCase方式命名。如果是某一个平台特有的文件，可以加上ios或者android的后缀作为区分。例如：

```
例如：index.ios.js / index.android.js
```

- 【推荐】文件注释必须存在。文件开头需写明该文件作用、作者以及创建时间。例如：

```
/*
 * 登录页面
 * by XXX at 2018-2-10
 */
```

* 【推荐】 在文件结尾处，保留一个空行。

* 【推荐】文件头从上到下编码顺序：

  ```
  1. 先导react和react-native包里面的组件
  2. 导入第三方组件库
  3. 导入团队内部的组件库
  4. 导入相对路径的文件
  5. const常量
  6. let变量
  ```

* 【推荐】组件内部从上到下明确结构；

  ```
  1. 构造函数 
  2. rn的生命周期方法 
  3. render方法渲染视图 
  4. 自定renderXXX渲染子组件 
  5. 自定义方法（接口请求方法与接口API保持相同） 
  6. 样式放在最后
  ```

  



###1.2  项目结构

* 【推荐】避免目录结构有太多嵌套。JavaScript 项目中的深层目录嵌套会有许多痛点。在目录之间书写相对的 import 以及在移动文件时更新这些 import 都变得更加困难。
* 【推荐】按照功能或者路由来分组文件。组织项目的一种常见方法是将 CSS，JS 和测试文件一起放入按功能或路由分组的文件夹中。

* 【推荐】遵循类似如下的项目文件组织结构：

```css
.
├── index.ios.js
├── index.android.js
└── src
    ├── component           可复用的组件（非完整页面）
    ├── store               业务模块
    ├── config              配置项（常量、接口地址、路由、多语言化等预置数据）
    ├── util                工具类（非UI组件)
    ├── sence               业务场景类类
    ├── style               全局样式
    └── image               图片
```

在component和module目录中，可能还有一些内聚度较高的模块再建目录

```ruby
module/component
├── HomeView.component.js
├── HomeView.style.js
└── LoanView
    ├── LoanList.component.js          
    ├── LoanList.style.js          
    ├── LoanCell.component.js          
    ├── LoanCell.style.js              
    ├── LoanView.component.js          
    └── LoanView.style.js              
```

### 1.3  package.json

- 【强制】在使用npm或者yarn获取资源时，必须在命令末尾添加--save； 说明：使用此命令会把使用的第三方相关信息写入到package.json，这样，其他成员在下载或者更新代码后使用npm i，就可以下载最新的npm，若不加 —save ，执行npm i的时候不会下载，其他成员运行项目后在运行可能会报错，此时需要分析查看报错信息进行重新的npm install XX；
- 【推荐】使用git管理代码版本管理，不上传node_module文件夹； 说明：使用package.json进行包管理，下载或更新代码后，只需要执行npm i；若修改了npm包，建议进行版本管理，上传到私有的github仓库。
  -【强制】使用第三方或拉取新仓库时，第一步使用npm i或者npm install； 说明：检查版本是否存在冲突
- 【推荐】在使用npm或者yarn获取资源时，推荐不在命令后添加 -g； 说明，此命令可以让此资源包在根目录进行获取，不利于资源管理；
- 【强制】当升级或降级react-native版本时，必须进行代码备份； 说明：升级失败或者涉及到原生代码时，可以进行代码回滚
  -【强制】每个项目必须配置一个readMe文件，内容包括测试，正式环境等相关配置文件以及注意事项
- 【推荐】安装npm包时，推荐~来标记版本号； 说明：~和^的作用和区别：会匹配最近的小版本依赖包，比如1.2.3会匹配所有1.2.x版本，但是不包括1.3.0 ^会匹配最新的大版本依赖包，比如^1.2.3会匹配所有1.x.x的包，包括1.3.0，但是不包括2.0.0。那么该如何选择呢？当然你可以指定特定的版本号，直接写1.2.3，前面什么前缀都没有，这样固然没问题，但是如果依赖包发布新版本修复了一些小bug，那么需要手动修改package.json文件；和^则可以解决这个问题。但是需要注意^版本更新可能比较大，会造成项目代码错误，旧版本可能和新版本存在部分代码不兼容。所以推荐使用来标记版本号，这样可以保证项目不会出现大的问题，也能保证包中的小bug可以得到修复。

## 第三章 命名规范

### **3.1  命名方式**

- camel命名法，也叫lowerCamelCase，形如 thisIsApple，
- pascal命名法，同UpperCamelCase，形如 ThisIsApple，
- 下划线命名法，形如 this_is_apple
- 中划线命名法，形如 this-is-apple

###**3.2  文件命名**

* 【强制】文件和目录名只能包含 [a-z\d\ -]，并以英文字母开头(需确定,一般使用帕斯卡pascal命名法)，如DemoPage、HomeView。

* 【强制】图片命名、文件夹命名统一小写；组件，或者类名，首字母全部大写，遵守驼峰命名法；图片名字不允许使用中文。 正例:

   components // 存放一些组件

* 【强制】组件命名与文件名（除中缀外）完全一致。如果组件单独放置在目录中，则目录名也一致。

* 【强制】扩展名：使用.js作为js文件的扩展名。如果同一个文件夹下有同名而不同作用的js文件，则通过中缀（小写）进一步区分，例如：HomeView.component.js, HomeView.style.js, HomeView.action.js等。

```jsx
// bad
import Footer from './Component/Footer/FooterView' 

// good
import Footer from './Component/Footer/Footer'

// good
import Footer from './Footer'
```



* 【强制】引用命名：React模块名使用帕斯卡命名，实例使用驼峰法命名

```js
//bad 
import demoPgae from './DemoPage'

//good
import DemoPage from './DemoPage'

//bad
 const DemoComponent=<DemoComponent/>

//good 
const demoComponent=<DemoComponent/>
```

* 【强制】模块命名：使用与当前文件名一样的名称，但不推荐使用index.js作为入口文件，突出Page承担的概念以及对开发IDE的适用

```js
import DemoPage from './DemoPage/DemoPage'
```



###**3.3  代码命名**

* 【强制】代码中命名均不能以下划线或美元符号开始，也不能以下划线或美元符号结束

```
[反例]_name / $Object / name_ / name$ / Object$
复制代码
```

* 【强制】代码中命名严禁使用拼音与英文混合的方式，更不允许直接使用中文的方式

```js
[反例]DaZhePromotion [打折] / getPingfenByName() [评分] / int 某变量 = 3
复制代码
```

* 【强制】代码中的命名均不能以下划线或美元符号开始，也不能以下划线或美元符号结束。

```
反例:  _name / _*name / $name / name_ / name$ / name_*  
```

* 【强制】代码中的命名严禁使用拼音与英文混合的方式,更不允许直接使用中文的方式。
   说明:正确的英文拼写和语法可以让阅读者易于理解，避免歧义。注意，即使纯拼音命名方式也要避免采用。

```js
 正例: beijing / taobao / youku / shenzhen 等国际通用的名称，可视同英文。
 反例: DaZhePromotion [ 打折 ] / getPingfenByName() [ 评分 ] / let 某变量 = 3
```

* 【强制】类名使用 UpperCamelCase 风格，遵从驼峰形式，首字母大写。类名应当用名词

```js
export default class AnXinSharePage extends PureComponent {
复制代码
```

* 【强制】方法名、参数名、成员变量、局部变量、命名空间都统一使用 lowerCamelCase风格，遵从驼峰形式，首字母小写:

```js
  constructor(props) {
    super(props);
    this.isFromNative = this.props.navigation.state.params ? false : true;
    this.params = this.props.navigation.state.params || this.props.screenProps;
    this.state = {
      /**
       * 分数
       */
      score: 200,
      /**
       * 百分比
       */
      percent: "20%",
    };
  }
	
  componentDidMount() {
    this.props.navigation.setParams({onBack: this.onBack.bind(this)});
    this.props.navigation.setParams({onShare: this.onShare.bind(this)});
  }
复制代码
```

成员变量示例：

```js
export const FamilyMemberKey = {
  /**
   * 关系
   */
  RELATION: "relation",
  /**
   * 身份证号
   */
  IDCARD: "cdid",
  /**
   * 姓名
   */
  NAME: "name",
  /**
   * 性别
   */
  SEX: "gender",
  /**
   * 地址
   */
  ADDRESS: "address",
  /**
   * 生日
   */
  BIRTHDAY: "birthday",
  /**
   * 英文名
   */
  ENGNAME: "engName",
  /**
   * 手机号
   */
  MOBILE: "mobile",
  /**
   * 身高
   */
  HEIGHT: "height"
}
复制代码
```

* 【强制】常量命名全部大写，单词间用下划线隔开，力求语义表达完整清楚，不要嫌名字长。
   正例: MAX_STOCK_COUNT
   反例: MAX_COUNT

- 【强制】枚举名使用pascal命名法，枚举的属性使用全部大写的下划线命名法
- 【强制】boolean类型的变量、参数、函数应当使用is、has等开头，表示其类型

- 【推荐】不应该[SHOULD NOT]将rn框架提供的表示成其他意义的属性；如果属性值为true，可以直接省略；对于组件，总是加上defaultProps

```js
<Component demoProps="属性值">

//bad
<Component style="用来传递值">

//bad
<Demo hidden={true}>

//good
<Demo hidden>
```

- 【推荐】对于多个单词组成的pros，使用驼峰命名法。不使用下划线或连接线。

```jsx
// bad
<Foo
  UserName="hello"
  phone_number={12345678}
/>

// good
<Foo
  userName="hello"
  phoneNumber={12345678}
/>
```



## 第四章 代码规范

### 4.1  编码风格

#### 4.1.1  缩进

- 【强制】 使用 2 个空格做为一个缩进层级，不允许使用  tab 字符。
- 【强制】 switch 下的 case 和 default 必须增加一个缩进层级。

```js
// good
switch (variable) {
  case '1':
    // do...
    break;
  case '2':
    // do...
    break;
  default:
    // do...
}

// bad
switch (variable) {
case '1':
    // do...
    break;
case '2':
    // do...
    break;
default:
    // do...
}
```



#### 4.1.2  **对齐**

- 组件的属性要对齐，如果能一行摆下的props，最好摆在一行（个人建议超过两个就换行）。

```xml
// bad
<Foo superLongParam="bar"
     anotherSuperLongParam="baz" />

// good
<Foo
  superLongParam="bar"
  anotherSuperLongParam="baz"
/>

// 如果一行能摆下props，那就摆在一行
<Foo bar="bar" />

// 子组件照常缩进
<Foo
  superLongParam="bar"
  anotherSuperLongParam="baz"
>
  <Spazz />
</Foo>
```



#### 4.1.2  **空格**

- 【强制】 二元运算符两侧必须有一个空格，一元运算符与操作对象之间不允许有空格。

```js
let a = !arr.length;
a++;
a = b + c;
```

- 【强制】 用作代码块起始的左花括号 { 前必须有一个空格。

```js
// good
if (condition) {
}

while (condition) {
}

function funcName() {
}

// bad
if (condition){
}

while (condition){
}

function funcName(){
}
```

- 【强制】 if / else / for / while / function / switch / do / try / catch / finally 关键字后，必须有一个空格。

```js
// good
if (condition) {
}

while (condition) {
}

(function () {
})();

// bad
if(condition) {
}

while(condition) {
}

(function() {
})();
```

- 【强制】 在对象创建时，属性中的 : 之后必须有空格，: 之前不允许有空格。

```js
// good
var obj = {
    a: 1,
    b: 2,
    c: 3
};

// bad
var obj = {
    a : 1,
    b:2,
    c :3
};
```

- 【强制】 函数声明、具名函数表达式、函数调用中，函数名和 ( 之间不允许有空格。

```js
// good
function funcName() {
}

var funcName = function funcName() {
};

funcName();

// bad
function funcName () {
}

var funcName = function funcName () {
};

funcName ();
```

- 【强制】 , 和 ; 前不允许有空格。如果不位于行尾，, 和 ; 后必须跟一个空格。

```js
// good
callFunc(a, b);

// bad
callFunc(a , b) ;
```

- 【强制】 在函数调用、函数声明、括号表达式、属性访问、if / for / while / switch / catch 等语句中，() 和 [] 内紧贴括号部分不允许有空格。

```js
// good

callFunc(param1, param2, param3);

save(this.list[this.indexes[i]]);

needIncream && (variable += increament);

if (num > list.length) {
}

while (len--) {
}


// bad

callFunc( param1, param2, param3 );

save( this.list[ this.indexes[ i ] ] );

needIncreament && ( variable += increament );

if ( num > list.length ) {
}

while ( len-- ) {
}
```

- 【强制】 单行声明的数组与对象，如果包含元素，{} 和 [] 内紧贴括号部分不允许包含空格。
  声明包含元素的数组与对象，只有当内部元素的形式较为简单时，才允许写在一行。元素复杂的情况，还是应该换行书写。

```js
// good
var arr1 = [];
var arr2 = [1, 2, 3];
var obj1 = {};
var obj2 = {name: 'obj'};
var obj3 = {
    name: 'obj',
    age: 20,
    sex: 1
};

// bad
var arr1 = [ ];
var arr2 = [ 1, 2, 3 ];
var obj1 = { };
var obj2 = { name: 'obj' };
var obj3 = {name: 'obj', age: 20, sex: 1};
```

- 【强制】 行尾不得有多余的空格。

- 【强制】 在自闭合的标签中包含一个空格。

  ```jsx
  // bad
  <Foo/>
  
  // very bad
  <Foo                 />
  
  // bad
  <Foo
   />
  
  // good
  <Foo />
  ```

- #### 引号

  - 对于JSX的字符串属性使用双引号(")，其他情况下使用单引号。

  ```csharp
  // bad
  <Foo bar='bar' />
  
  // good
  <Foo bar="bar" />
  
  // bad
  <Foo style={{ left: "20px" }} />
  
  // good
  <Foo style={{ left: '20px' }} />
  ```

  

#### 4.1.3  换行

- 【强制】 每个独立语句结束后必须换行。
- 【强制】 每行不得超过 120 个字符。
- 超长的不可分割的代码允许例外，比如复杂的正则表达式。长字符串不在例外之列。
- 【强制】 运算符处换行时，运算符必须在新行的行首。

```js
// good
if (user.isAuthenticated()
    && user.isInRole('admin')
    && user.hasAuthority('add-admin')
    || user.hasAuthority('delete-admin')
) {
    // Code
}

var result = number1 + number2 + number3
    + number4 + number5;


// bad
if (user.isAuthenticated() &&
    user.isInRole('admin') &&
    user.hasAuthority('add-admin') ||
    user.hasAuthority('delete-admin')) {
    // Code
}

var result = number1 + number2 + number3 +
    number4 + number5;
```

- 【强制】 在函数声明、函数表达式、函数调用、对象创建、数组创建、for 语句等场景中，不允许在 , 或 ; 前换行。

```js
// good
var obj = {
    a: 1,
    b: 2,
    c: 3
};

foo(
    aVeryVeryLongArgument,
    anotherVeryLongArgument,
    callback
);


// bad
var obj = {
    a: 1
    , b: 2
    , c: 3
};

foo(
    aVeryVeryLongArgument
    , anotherVeryLongArgument
    , callback
);
```

- 【推荐】 不同行为或逻辑的语句集，使用空行隔开，更易阅读。

```js
// 仅为按逻辑换行的示例，不代表setStyle的最优实现
function setStyle(element, property, value) {
    if (element == null) {
        return;
    }

    element.style[property] = value;
}
```

- 【推荐】 在语句的行长度超过 120 时，根据逻辑条件合理缩进。

```js
// 较复杂的逻辑条件组合，将每个条件独立一行，逻辑运算符放置在行首进行分隔，或将部分逻辑按逻辑组合进行分隔。
// 建议最终将右括号 ) 与左大括号 { 放在独立一行，保证与 `if` 内语句块能容易视觉辨识。
if (user.isAuthenticated()
    && user.isInRole('admin')
    && user.hasAuthority('add-admin')
    || user.hasAuthority('delete-admin')
) {
    // Code
}

// 按一定长度截断字符串，并使用 + 运算符进行连接。
// 分隔字符串尽量按语义进行，如不要在一个完整的名词中间断开。
// 特别的，对于 HTML 片段的拼接，通过缩进，保持和 HTML 相同的结构。
var html = '' // 此处用一个空字符串，以便整个 HTML 片段都在新行严格对齐
    + '<article>'
    +     '<h1>Title here</h1>'
    +     '<p>This is a paragraph</p>'
    +     '<footer>Complete</footer>'
    + '</article>';

// 也可使用数组来进行拼接，相对 `+` 更容易调整缩进。
var html = [
    '<article>',
        '<h1>Title here</h1>',
        '<p>This is a paragraph</p>',
        '<footer>Complete</footer>',
    '</article>'
];
html = html.join('');

// 当参数过多时，将每个参数独立写在一行上，并将结束的右括号 ) 独立一行。
// 所有参数必须增加一个缩进。
foo(
    aVeryVeryLongArgument,
    anotherVeryLongArgument,
    callback
);

// 也可以按逻辑对参数进行组合。
// 最经典的是 baidu.format 函数，调用时将参数分为“模板”和“数据”两块
baidu.format(
    dateFormatTemplate,
    year, month, date, hour, minute, second
);

// 当函数调用时，如果有一个或以上参数跨越多行，应当每一个参数独立一行。
// 这通常出现在匿名函数或者对象初始化等作为参数时，如 `setTimeout` 函数等。
setTimeout(
    function () {
        alert('hello');
    },
    200
);

order.data.read(
    'id=' + me.model.id,
    function (data) {
        me.attchToModel(data.result);
        callback();
    },
    300
);

// 链式调用较长时采用缩进进行调整。
$('#items')
    .find('.selected')
    .highlight()
    .end();

// 三元运算符由3部分组成，因此其换行应当根据每个部分的长度不同，形成不同的情况。
var result = thisIsAVeryVeryLongCondition
    ? resultA : resultB;

var result = condition
    ? thisIsAVeryVeryLongResult
    : resultB;

// 数组和对象初始化的混用，严格按照每个对象的 `{` 和结束 `}` 在独立一行的风格书写。
var array = [
    {
        // ...
    },
    {
        // ...
    }
];
```

- 【推荐】 对于 if...else...、try...catch...finally 等语句，推荐使用在 } 号后添加一个换行 的风格，使代码层次结构更清晰，阅读性更好。

```js
if (condition) {
    // some statements;
}
else {
    // some statements;
}

try {
    // some statements;
}
catch (ex) {
    // some statements;
}
```

#### 4.1.4  语句

- 【强制】 不得省略语句结束的分号。
- 【强制】 在 if / else / for / do / while 语句中，即使只有一行，也不得省略块 {...}。

```js
// good
if (condition) {
    callFunc();
}

// bad
if (condition) callFunc();
if (condition)
    callFunc();
```

- 【强制】 函数定义结束不允许添加分号。

```js
// good
function funcName() {
}

// bad
function funcName() {
};

// 如果是函数表达式，分号是不允许省略的。
var funcName = function () {
};
```

- 【强制】 不要将目的不同的语句合并成一行

```js
  // ex1:
  // 在同一行赋值多个变量
  var a = b = 0;
  // 认为是下面的效果
　var a = 0, b = 0;
　// 实际上真正的效果是
　var a = b;
　
　// ex2:
　a = b;
　if (a) {..}

　// 如果写成这样 
　if (a = b) {...}
　// 会让读者误认为是下面的意思
　if (a === b ) {...}
```

#### 4.1.4  标签

- 【推荐】 对于没有子组件的JSX标签，始终自闭合。

```jsx
// bad
<Foo className="stuff"></Foo>

// good
<Foo className="stuff" />
```

- 【推荐】 如果组件有多行属性，则另起一行进行自闭合。

```jsx
// bad
<Foo
  bar="bar"
  baz="baz" />

// good
<Foo
  bar="bar"
  baz="baz"
/>
```

#### 4.1.5  大括号

```js
// 第一种方式
return
{
	key: value
}

// 第二种方式
block {
	key: value
}
```

上例是要返回一个对象，但第一种方式实际上返回的是undefined；因为JavaScript自动在return后面加了分号。为了避免此种错误，需要使用第二种方式，区块行首的大括号不要另起一行

- 【强制】大括号使用约定。如果是大括号内为空，则简洁地写成{}即可，不需要换行;如果 是非空代码块则:
  1. 左大括号前不换行；
  2. 左大括号后换行；
  3. 右大括号前换行；
  4. 右大括号后还有else等代码则不换行‘；’表示终止右大括号后必须换行。

####4.1.5  圆括号

- 圆括号（parentheses）在Javascript中有两种作用，一种表示调用函数，另一种表示不同的值的组合（grouping）。我们可以用空格，区分这两种不同的括号。

```js
//规则1：调用函数的时候，函数名与左括号之间没有空格。
// good
foo(bar)

// bad
foo (bar)
// 规则2：函数名和参数序列之间没有空格
// good
function foo(bar) {...}

// bad
function foo (bar) {...}
// 规则3：所有其他语法元素与左括号之间，都有一个空格
// good
return (a+b)

// bad
return(a+b)
```

- 附：with可以减少代码的书写，但是会造成混淆，不要使用with语句

- 【推荐】 当JSX标签超过一行时，使用括号包裹。单行时，不必有括号。

```jsx
/// bad
render() {
  return <MyComponent className="long body" foo="bar">
           <MyChild />
         </MyComponent>;
}

// good
render() {
  return (
    <MyComponent className="long body" foo="bar">
      <MyChild />
    </MyComponent>
  );
}

// good, when single line
render() {
  const body = <Text>hello</Text>;
  return <MyComponent>{body}</MyComponent>;
```

#### 

### 4.2  ES规范

#### 4.2.1  常量

- 【推荐】 在let和const之间，建议优先使用const，尤其是在全局环境，不应该设置变量，只应设置常量。const优于let有几个原因。一个是const可以提醒阅读程序的人，这个变量不应该改变；另一个是const比较符合函数式编程思想，运算不改变值，只是新建值，而且这样也有利于将来的分布式运算；最后一个原因是 JavaScript 编译器会对const进行优化，所以多使用const，有利于提高程序的运行效率，也就是说let和const的本质区别，其实是编译器内部的处理不同。

```js
// bad
var a = 1, b = 2, c = 3;

// good
const a = 1;
const b = 2;
const c = 3;

// best
const [a, b, c] = [1, 2, 3];
```

const声明常量还有两个好处，一是阅读代码的人立刻会意识到不应该修改这个值，二是防止了无意间修改变量值所导致的错误。

- 【强制】 所有的函数都应该设置为常量。长远来看，JavaScript 可能会有多线程的实现（比如 Intel 公司的 River Trail 那一类的项目），这时let表示的变量，只应出现在单线程运行的代码中，不能是多线程共享的，这样有利于保证线程安全。

- 【强制】不允许出现任何魔法值(即未经定义的常量)直接出现在代码中；

- 【推荐】不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护。 如:缓存相关的常量放在类:CacheConsts下; 系统配置相关的常量放在类:ConfigConsts下； 说明:大而全的常量类，非得使用查找功能才能定位到修改的常量，不利于理解和维护；

  

####4.2.1  对象

- 【强制】 使用对象字面量 {} 创建新 Object。

```js
// good
var obj = {};

// bad
var obj = new Object();
```

- 【强制】 对象创建时，如果一个对象的所有 属性 均可以不添加引号，则所有 属性 不得添加引号。

```js
var info = {
    name: 'someone',
    age: 28
};
```

- 【强制】 对象创建时，如果任何一个 属性 需要添加引号，则所有 属性 必须添加 '。

```js
// good
var info = {
    'name': 'someone',
    'age': 28,
    'more-info': '...'
};

// bad
var info = {
    name: 'someone',
    age: 28,
    'more-info': '...'
};
```

* 【强制】 不允许修改和扩展任何原生对象和宿主对象的原型。

```js
// 以下行为绝对禁止
String.prototype.trim = function () {
};
```

- 【推荐】 单行定义的对象，最后一个成员不以逗号结尾。多行定义的对象，最后一个成员以逗号结尾。

```js
// bad
const a = { k1: v1, k2: v2, };
const b = {
  k1: v1,
  k2: v2
};

// good
const a = { k1: v1, k2: v2 };
const b = {
  k1: v1,
  k2: v2,
};
```

- 【推荐】 对象尽量静态化，一旦定义，就不得随意添加新的属性。如果添加属性不可避免，要使用Object.assign方法。

```js
// bad
const a = {};
a.x = 3;

// if reshape unavoidable
const a = {};
Object.assign(a, { x: 3 });

// good
const a = { x: null };
a.x = 3;
```

- 【强制】 如果对象的属性名是动态的，可以在创造对象的时候，使用属性表达式定义。

```js
// bad
const obj = {
  id: 5,
  name: 'San Francisco',
};
obj[getKey('enabled')] = true;

// good
const obj = {
  id: 5,
  name: 'San Francisco',
  [getKey('enabled')]: true,
};
```

- 【推荐】 对象的属性和方法，尽量采用简洁表达法，这样易于描述和书写。

```js
const ref = 'some value';

// bad
const atom = {
  ref: ref,

  value: 1,

  addValue: function (value) {
    return atom.value + value;
  },
};

// good
const atom = {
  ref,

  value: 1,

  addValue(value) {
    return atom.value + value;
  },
};
```





####4.2.1  数组

- 【强制】 使用数组字面量 [] 创建新数组，除非想要创建的是指定长度的数组

```js
// good
var arr = [];

// bad
var arr = new Array();
```

- 【强制】 遍历数组不使用 for in。
  数组对象可能存在数字以外的属性, 这种情况下 for in 不会得到正确结果**

```js
var arr = ['a', 'b', 'c'];
arr.other = 'other things'; // 这里仅作演示, 实际中应使用Object类型

// 正确的遍历方式
for (var i = 0, len = arr.length; i < len; i++) {
    console.log(i);
}

// 错误的遍历方式
for (i in arr) {
    console.log(i);
}
```

- 【推荐】 不因为性能的原因自己实现数组排序功能，尽量使用数组的 sort 方法。
  自己实现的常规排序算法，在性能上并不优于数组默认的 sort 方法。以下两种场景可以自己实现排序：
  1. 需要稳定的排序算法，达到严格一致的排序结果；
  2. 数据特点鲜明，适合使用桶排。
- 【推荐】 清空数组使用 .length = 0。

- 【推荐】使用扩展运算符（...）拷贝数组。

```js
// bad
const len = items.length;
const itemsCopy = [];
let i;

for (i = 0; i < len; i++) {
  itemsCopy[i] = items[i];
}

// good
const itemsCopy = [...items];
```

- 使用 Array.from 方法，将类似数组的对象转为数组。
  const foo = document.querySelectorAll('.foo');
  const nodes = Array.from(foo);



####4.2.1  函数

- 【推荐】 一个函数的长度控制在 50 行以内
  将过多的逻辑单元混在一个大函数中，易导致难以维护。一个清晰易懂的函数应该完成单一的逻辑单元。复杂的操作应进一步抽取，通过函数的调用来体现流程。
  特定算法等不可分割的逻辑允许例外。

```js
function syncViewStateOnUserAction() {
    if (x.checked) {
        y.checked = true;
        z.value = '';
    }
    else {
        y.checked = false;
    }

    if (!a.value) {
        warning.innerText = 'Please enter it';
        submitButton.disabled = true;
    }
    else {
        warning.innerText = '';
        submitButton.disabled = false;
    }
}

// 直接阅读该函数会难以明确其主线逻辑，因此下方是一种更合理的表达方式：

function syncViewStateOnUserAction() {
    syncXStateToView();
    checkAAvailability();
}

function syncXStateToView() {
    if (x.checked) {
        y.checked = true;
        z.value = '';
    }
    else {
        y.checked = false;
    }
}

function checkAAvailability() {
    if (!a.value) {
        displayWarningForAMissing();
    }
    else {
        clearWarnignForA();
    }
}
```

- 【推荐】 一个函数的参数控制在 6 个以内
  除去不定长参数以外，函数具备不同逻辑意义的参数建议控制在 6 个以内，过多参数会导致维护难度增大。
  某些情况下，如使用 AMD Loader 的 require 加载多个模块时，其 callback 可能会存在较多参数，因此对函数参数的个数不做强制限制。
- 【推荐】 通过 options 参数传递非数据输入型参数
  有些函数的参数并不是作为算法的输入，而是对算法的某些分支条件判断之用，此类参数建议通过一个 options 参数传递。

```js
/**
 * 移除某个元素
 *
 * @param {Node} element 需要移除的元素
 * @param {boolean} removeEventListeners 是否同时将所有注册在元素上的事件移除
 */
function removeElement(element, removeEventListeners) {
    element.parent.removeChild(element);
    if (removeEventListeners) {
        element.clearEventListeners();
    }
}

//上面的函数可以转换为以下方式
/**
 * 移除某个元素
 *  * @param {Node} element 需要移除的元素
 * @param {Object} options 相关的逻辑配置
 * @param {boolean} options.removeEventListeners 是否同时将所有注册在元素上的事件移除
 */
function removeElement(element, options) {
    element.parent.removeChild(element);
    if (options.removeEventListeners) {
        element.clearEventListeners();
    }
}
```

这种模式有几个显著的优势：

> boolean 型的配置项具备名称，从调用的代码上更易理解其表达的逻辑意义。

> 当配置项有增长时，无需无休止地增加参数个数，不会出现 removeElement(element, true, false, false, 3) 这样难以理解的调用代码。

> 当部分配置参数可选时，多个参数的形式非常难处理重载逻辑，而使用一个 options 对象只需判断属性是否存在，实现得以简化。



- 【推荐】 立即执行函数可以写成箭头函数的形式。

```js
(() => {
  console.log('Welcome to the Internet.');
})();
```

- 【推荐】 那些需要使用函数表达式的场合，尽量用箭头函数代替。因为这样更简洁，而且绑定了 this。

```js
// bad
[1, 2, 3].map(function (x) {
  return x * x;
});

// good
[1, 2, 3].map((x) => {
  return x * x;
});

// best
[1, 2, 3].map(x => x * x);
```

- 【推荐】 箭头函数取代Function.prototype.bind，不应再用 self/_this/that 绑定 this。

```js
// bad
const self = this;
const boundMethod = function(...params) {
  return method.apply(self, params);
}

// acceptable
const boundMethod = method.bind(this);

// best
const boundMethod = (...params) => method.apply(this, params);
```

- 【推荐】 简单的、单行的、不会复用的函数，建议采用箭头函数。如果函数体较为复杂，行数较多，还是应该采用传统的函数写法。
- 【推荐】 所有配置项都应该集中在一个对象，放在最后一个参数，布尔值不可以直接作为参数。

```js
// bad
function divide(a, b, option = false ) {
}

// good
function divide(a, b, { option = false } = {}) {
}
```

- 【推荐】 使用默认值语法设置函数参数的默认值。

```js
// bad
function handleThings(opts) {
  opts = opts || {};
}

// good
function handleThings(opts = {}) {
  // ...
}
```



- 【推荐】  原则上按如下顺序排列React组件的各个方法（生命周期）：

```tsx
1. constructor
2. 静态方法（static methods)
3. getChildContext
4. componentWillMount
5. componentDidMount
6. componentWillReceiveProps
7. shouldComponentUpdate
8. componentWillUpdate
9. componentDidUpdate
10. componentWillUnmount
11. 点击处理或事件处理函数，比如onClickSubmit()、 onChangeDescription()
12. 用在render中的getter方法，比如getSelectReason()、 getFooterContent()
13. 可选的render方法，比如renderNavigation()、renderProfilePicture()
14. render
```

- 【推荐】 按如下方式定义propTypes, defaultProps, contextTypes等

```jsx
import React, { Component, PropTypes } from 'react';
import { Text } from 'react-native'

const propTypes = {
  text: PropTypes.string,
};

const defaultProps = {
  text: 'Hello World',
};

class Link extends Component {
  static methodsAreOk() {
    return true;
  }

  render() {
    return <Text>{this.props.text}</Text>
  }
}

Link.propTypes = propTypes;
Link.defaultProps = defaultProps;

export default Link;
```



####4.2.1  条件

- 【强制】 在相等表达式 中使用类型严格的 === ， 仅当判断null或者undefined时，使用==， 使用===可以避免等于判断中隐式的类型转换

```js
// good
if (age === 30) {
    // ......
}

// bad
if (age == 30) {
    // ......
}
```

- 不过还是建议尽量使用===，== 可能会带来一些违反直觉的后果。比如我们常使用的对象，有时获取不到而被赋值为undefine的情况。

```js
var obj = undefined;

if(obj == null){
  console.log("1");  // 执行
}

if(obj === null){
  console.log("2");  // 不执行
}
```

- 【推荐】 尽可能使用简洁的表达式。

```js
// 字符串为空

// good
if (!name) {
    // ......
}

// bad
if (name === '') {
    // ......
}
// 字符串非空

// good
if (name) {
    // ......
}

// bad
if (name !== '') {
    // ......
}
// 数组非空

// good
if (collection.length) {
    // ......
}

// bad
if (collection.length > 0) {
    // ......
}
// 布尔不成立

// good
if (!notTrue) {
    // ......
}

// bad
if (notTrue === false) {
    // ......
}

// null 或 undefined

// good
if (noValue == null) {
  // ......
}

// bad
if (noValue === null || typeof noValue === 'undefined') {
  // ......
}
```

- 【推荐】 对于相同变量或表达式的多值条件，用 switch 代替 if。

```js
// good
switch (typeof variable) {
    case 'object':
        // ......
        break;
    case 'number':
    case 'boolean':
    case 'string':
        // ......
        break;
}

// bad
var type = typeof variable;
if (type === 'object') {
    // ......
} 
else if (type === 'number' || type === 'boolean' || type === 'string') {
    // ......
}
```

- 【推荐】 如果函数或全局中的 else 块后没有任何语句，可以删除 else。

```js
// good
function getName() {
    if (name) {
        return name;
    }

    return 'unnamed';
}

// bad
function getName() {
    if (name) {
        return name;
    }
    else {
        return 'unnamed';
    }
}
```



####4.2.1  类型

- 【推荐】 类型检测优先使用 typeof。对象类型检测使用 instanceof。null 或 undefined 的检测使用 == null

```js
// string
typeof variable === 'string'

// number
typeof variable === 'number'

// boolean
typeof variable === 'boolean'

// Function
typeof variable === 'function'

// Object
typeof variable === 'object'

// RegExp
variable instanceof RegExp

// Array
variable instanceof Array

// null
variable === null

// null or undefined
variable == null

// undefined
typeof variable === 'undefined'
```

- 【推荐】 转换成 string 时，使用 + ''

```js
// good
num + '';

// bad
new String(num);
num.toString();
String(num);
```

- 【推荐】 转换成 number 时，通常使用 +

```js
// good
+str;

// bad
Number(str);
```

- 【推荐】 string 转换成 number，要转换的字符串结尾包含非数字并期望忽略时，使用 parseInt

```js
var width = '200px';
parseInt(width, 10);
```

- 【强制】 使用 parseInt 时，必须指定进制

```js
// good
parseInt(str, 10);

// bad
parseInt(str);
```

- 【推荐】 转换成 boolean 时，使用 !!

```js
var num = 3.14;
!!num;
```

- 【推荐】 number 去除小数点，使用 Math.floor / Math.round / Math.ceil，不使用 parseInt

```js
// good
var num = 3.14;
Math.ceil(num);

// bad
var num = 3.14;
parseInt(num, 10);
```



####4.2.1  字符串

- 【强制】 字符串开头和结束使用单引号 '
- 【推荐】 使用 数组 或 + 拼接字符串
- 【推荐】 复杂的数据到视图字符串的转换过程，选用一种模板引擎
- 【强制】  静态字符串一律使用单引号或反引号，不使用双引号。动态字符串使用反引号

```js
// bad
const a = "foobar";
const b = 'foo' + a + 'bar';

// acceptable
const c = `foobar`;

// good
const a = 'foobar';
const b = `foo${a}bar`;
```

####4.2.1  解构赋值

- 【推荐】 使用数组成员对变量赋值时，优先使用解构赋值。

```js
const arr = [1, 2, 3, 4];

// bad
const first = arr[0];
const second = arr[1];

// good
const [first, second] = arr;
```

- 【推荐】 函数的参数如果是对象的成员，优先使用解构赋值

```js
// bad
function getFullName(user) {
  const firstName = user.firstName;
  const lastName = user.lastName;
}

// good
function getFullName(obj) {
  const { firstName, lastName } = obj;
}

// best
function getFullName({ firstName, lastName }) {
}
```

- 【推荐】 如果函数返回多个值，优先使用对象的解构赋值，而不是数组的解构赋值。这样便于以后添加返回值，以及更改返回值的顺序

```js
// bad
function processInput(input) {
  return [left, right, top, bottom];
}

// good
function processInput(input) {
  return { left, right, top, bottom };
}

const { left, right } = processInput(input);
```

- 【推荐】 重命名解构

```js
let {foo:foo_ex} = {foo:'foo_ex'};
foo_ex = 'foo_ex';  
```

####4.2.1  Map结构

- 【推荐】 注意区分 Object 和 Map，只有模拟现实世界的实体对象时，才使用 Object。如果只是需要key: value的数据结构，使用 Map 结构。因为 Map 有内建的遍历机制

```js
let map = new Map(arr);

for (let key of map.keys()) {
  console.log(key);
}

for (let value of map.values()) {
  console.log(value);
}

for (let item of map.entries()) {
  console.log(item[0], item[1]);
}
```

####4.2.1  Class

- 【推荐】 总是用 Class，取代需要 prototype 的操作。因为 Class 的写法更简洁，更易于理解。

```js
// bad
function Queue(contents = []) {
  this._queue = [...contents];
}
Queue.prototype.pop = function() {
  const value = this._queue[0];
  this._queue.splice(0, 1);
  return value;
}

// good
class Queue {
  constructor(contents = []) {
    this._queue = [...contents];
  }
  pop() {
    const value = this._queue[0];
    this._queue.splice(0, 1);
    return value;
  }
}
```

- 【推荐】 使用extends实现继承，因为这样更简单，不会有破坏instanceof运算的危险。

```js
// bad
const inherits = require('inherits');
function PeekableQueue(contents) {
  Queue.apply(this, contents);
}
inherits(PeekableQueue, Queue);
PeekableQueue.prototype.peek = function() {
  return this._queue[0];
}

// good
class PeekableQueue extends Queue {
  peek() {
    return this._queue[0];
  }
}
```

* 【推荐】类名应使用帕斯卡写法(PascalCased)

```cpp
// 好
class SomeClass {

}
```

- 【推荐】类名与花括号须保留一个空格间距。类中的方法定义时，括号 ) 也须与花括号 { 保留一个空格间距

```jsx
// 不好
class Foo{
  constructor(){
    // constructor
  }
  sayHi()    {
    // 仅保留一个空格间距
  }
}

// 好
class Foo {
  constructor() {
    // constructor
  }
  sayHi() {
    // 仅保留一个空格间距
  }
}
```

- 【推荐】定义类时，方法的顺序如下：

1. constructor
2. public get/set 公用访问器，set只能传一个参数
3. public methods 公用方法，公用相关命名使用小驼峰式写法(lowerCamelCase)
4. private get/set 私有访问器，私有相关命名应加上下划线 _ 为前缀
5. private methods 私有方法



```jsx
// 好
class SomeClass {
  constructor() {
    // constructor
  }

  get aval() {
    // public getter
  }

  set aval(val) {
    // public setter
  }

  doSth() {
    // 公用方法
  }

  get _aval() {
    // private getter
  }

  set _aval() {
    // private setter
  }

  _doSth() {
    // 私有方法
  }
}
```

* 【推荐】如果不是class类，不使用new

```jsx
// 不好
function Foo() {
}
const foo = new Foo();

// 好
class Foo {
}
const foo = new Foo();
```

* 【推荐】使用真正意思上的类Class写法，不使用prototype进行模拟扩展Class更加简洁，易维护

```jsx
// 不好
function Dog(names = []) {
  this._names = [...names];
}
Dog.prototype.bark = function() {
  const currName = this._names[0];
  alert(`one one ${currName}`);
}

// 好
class Dog {
  constructor(names = []) {
    this._names = [...names];
  }
  bark() {
    const currName = this._names[0];
    alert(`one one ${currName}`);
  }
}
```

* 【建议】this的注意事项；子类使用super关键字时，this应在调用super之后才能使用，可在方法中return this来实现链式调用写法

```jsx
class Foo {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
}

// bad
class SubFoo extends Foo {
  constructor(x, y, z) {
    this.z = z; // 引用错误
    super(x, y);
  }
}

// good
class SubFoo extends Foo {
  constructor(x, y, z) {
    super(x, y);
    this.z = z; // this 放在 super 后调用
  }
  setHeight(height) {
    this.height = height;
    return this;
  }
}
```



####4.2.1  模块

- 【推荐】 首先，Module 语法是 JavaScript 模块的标准写法，坚持使用这种写法。使用import取代require。

```js
// bad
const moduleA = require('moduleA');
const func1 = moduleA.func1;
const func2 = moduleA.func2;

// good
import { func1, func2 } from 'moduleA';

// bad
const colors  = require('./colors');
module.exports = color.lightRed;

// good
import { lightRed } from './colors';
export default lightRed;
```

- 【推荐】 使用export取代module.exports。

```js
// commonJS的写法
var React = require('react');

var Breadcrumbs = React.createClass({
  render() {
    return <nav />;
  }
});

module.exports = Breadcrumbs;

// ES6的写法
import React from 'react';

class Breadcrumbs extends React.Component {
  render() {
    return <nav />;
  }
};

export default Breadcrumbs;
```

- 【推荐】 如果模块只有一个输出值，就使用export default，如果模块有多个输出值，就不使用export default，export default与普通的export不要同时使用。

  

- 【推荐】 不要在模块输入中使用通配符。因为这样可以确保你的模块之中，有一个默认输出（export default）。

```js
// bad
import * as myObject from './importModule';

// good
import myObject from './importModule';
```

- 【推荐】 如果模块默认输出一个函数，函数名的首字母应该小写。

```js
function makeStyleGuide() {
}

export default makeStyleGuide;
```

- 【推荐】 如果模块默认输出一个对象，对象名的首字母应该大写。

```js
const StyleGuide = {
  es6: {
  }
};

export default StyleGuide;
```

* 【推荐】 使用import / export来做模块加载导出，不使用非标准模块写法

```jsx
// 不好
const colors  = require('./colors');
module.exports = color.lightRed;

// 好
import { lightRed } from './colors';
export default lightRed;
```

- 【推荐】  import / export 后面采用花括号{ }引入模块的写法时，须在花括号内左右各保留一个空格

```jsx
// bad
import {lightRed} from './colors';
import { lightRed} from './colors';

// good
import { lightRed } from './colors';
```



### 4.3  RN规范

#### 4.2.1  变量

- 【强制】 变量在使用前必须定义，否则将导致变量污染全局环境
- 【强制】 每个var只能声明一个变量
- 【强制】 变量必须 即用即声明，不得在函数或其它形式的代码块起始位置统一声明所有变量

```js
// 变量声明与使用的距离越远，出现的跨度越大，代码的阅读与维护成本越高。
// 虽然JavaScript的变量是函数作用域，还是应该根据编程中的意图，缩小变量出现的距离空间。

// good
function kv2List(source) {
    var list = [];

    for (var key in source) {
        if (source.hasOwnProperty(key)) {
            var item = {
                k: key,
                v: source[key]
            };
            list.push(item);
        }
    }

    return list;
}

// bad
function kv2List(source) {
    var list = [];
    var key;
    var item;

    for (key in source) {
        if (source.hasOwnProperty(key)) {
            item = {
                k: key,
                v: source[key]
            };
            list.push(item);
        }
    }

    return list;
}
```

- 【强制】 使用let 取代 var

```js
'use strict';

if (true) {
  console.log(x); // ReferenceError
  let x = 'hello';
}
```

上面代码如果使用var替代let，console.log那一行就不会报错，而是会输出undefined，因为变量声明提升到代码块的头部。这违反了变量先声明后使用的原则，所以，建议不再使用var。



#### 4.3.1  基本规范

- 【强制】类名、组件使用pascal命名法：LoginPage、MenuComponent；
- 【强制】函数、变量、常量等命名规则和js规范相同；
- 【强制】不允许未经定义的常量直接出现在代码中；
- 【强制】不要使用一个常量类维护所有常量，应该按常量功能进行归类，分开维护。 如:缓存相关的常量放在类:CacheConsts下; 系统配置相关的常量放在类:ConfigConsts下； 说明:大而全的常量类，非得使用查找功能才能定位到修改的常量，不利于理解和维护；
- 【强制】不要使用一个类维护多个业务，建议按其功能划分，同上；
- 【推荐】将接口地址按功能划分归类，分开维护。后期接口升级等便于维护。
- 【强制】 项目目录应按功能进行创建及维护
  示例：![img](https://box.kancloud.cn/560b0d959c8b3d4f896c8761c9a7bac9_270x254.png)
- 【推荐】两段功能或业务相同或类似的代码不应该出现两次；
- 【推荐】 使用第三方插件时应仔细阅读官方文档的 [Readme.md](http://readme.md/)、issue、**最新提交代码的时间**，充分了解可能会出现的问题及解决办法，节省调试时间、降低开发难度；
- 【推荐】在多个参数超长，逗号后进行换行；

```js
const path = Path()
         .moveTo(0, -radius/2)
         .arc(0, radius, 1)
         .arc(0, -radius, 1)
         .close();
```

####4.3.1  页面编写规范

- 【强制】 代码中初始化state因在constructor(props)函数中，而且尽量对每个变量进行注释；
- 【强制】 代码中使用setState时，因注意异步可能导致的问题，尽量使用回调函数；

```js
 this.setState({
        //todo 
     },()=>{
        //执行setState后执行此函数
     })
```

- 【强制】 代码中使用props时，需进行propTypes检测和defaultProps默认值初始化；

```js
 	 static propTypes = {
         color: PropTypes.string,
         dotRadius: PropTypes.number,
         size: PropTypes.number
     };
 
 static defaultProps = {
         color: '#1e90ff',
         dotRadius: 10,
         size: 40
     };
```

- 【强制】 代码中用于页面展示处理UI的组件，命名以Page结尾，自定义组件命名中必须包含Component； 例子：

```js
 LoginController     登录页
 BtuuonComponent     按钮组件
```

- 【强制】代码中创建数组或对象使用以下方式；

```js
const user = {
        name:'time',
        sex:'男',
        age:25,
    };
 
const itemArray = ['0','1','2',3,{name:'25',age:'男'}];
```

- 【强制】代码中函数绑定this，强制使用箭头函数； 注：除组件原有方法，其他自定义函数命名时，需使用箭头函数；

```js
// 系统组件生命周期方法
constructor(props) {
    super(props);
};
// 自定义方法
goMainPage=()=> {
    
};
```

- 【推荐】代码中一些网络数据初始化，配置信息，推荐在此生命周期进行初始化；

```js
componentWillMount
```

- 【强制】代码中使用定时器或者DeviceEventEmitter，必须在组件卸载进行销毁或者清除；

```js
componentDidMount() {
    //注意addListener的key和emit的key保持一致
    this.msgListener = DeviceEventEmitter.addListener('Msg',(listenerMsg) => {
        this.setState({
            listenerMsg:listenerMsg,
        })
    });
}

goMainPage=()=> {
    this.timer = setTimeout(
        () => { console.log('把一个定时器的引用挂在this上'); },
        500
    );
};

componentWillUnmount() {
    //此生命周期内，去掉监听和定时器
    this.msgListener&&this.msgListener.remove();
    // 如果存在this.timer，则使用clearTimeout清空。
    // 如果你使用多个timer，那么用多个变量，或者用个数组来保存引用，然后逐个clear
    this.timer && clearTimeout(this.timer);
}
```

####4.3.1  组件引用

- 【推荐】总是在Refs里使用回调函数；
- 【强制】对组件引用，变量引用，需遵从以下方式;

```js
 import React, {Component} from 'react';
 import{
           View,
           Text,
           TouchableHighlight,
           Image,
           StyleSheet,
           InteractionManager,
 } from 'react-native';
 //from react,react-native优先；
 //from npm库其次；
 import { connect } from 'react-redux';
          
 //from 项目内组件其次；
 import LoadingAndTime from '../component/LoadingAndTime';
 import { performLoginAction } from '../action/LoginAction'
 import {encode} from '../common/Base64';
 
 //变量初始化，常量初始化 最后；
 let screenWidth = Dimensions.get('window').width;
 let screenHeight = Dimensions.get('window').height;
 let typeCode = Platform.OS == 'android' ? 'android-phone' : 'ios-phone'
 let selectColor=Platform.OS=='android'?null:'white'
```

- 【推荐】对组件引用，变量初始化等，在整个页面或组件内未使用，因去除相关代码;
- 【推荐】某些全局变量请不要使用global，需新建文件进行导出引用； NetUtil.get(global.url + “”)
- 【推荐】render()函数代码过长时，请适当进行拆分，拆分为‘‘页面内组件‘‘，提高可读性。render()函数代码行请勿超过八十行，超过之后，请自行进行拆分；
- 使用class与extends关键字。不使用React.createClass方法。需要导出的组件直接在class关键字前使用export default。

```dart
// bad
export default React.createClass({
});

// good
export default class HomeView extends Component {
}
```

- 【推荐】读取state和props时，使用const与解构，必要时可使用let。不使用var。

```csharp
// bad
var userName = this.props.userName;
let checked = this.state.checked;

// good
const { userName, age, sex } = this.props;
const { checked } = this.state;
```



####4.3.1  样式

- 【强制】 当组件使用样式属性达到三个或者三个以上时，必须使用StyleSheet来创建样式属性并进行引用；

```
 const styles = StyleSheet.create({
     container: {
         flex: 1,
         justifyContent: 'center',
         alignItems: 'center',
         backgroundColor: '#F5FCFF',
         marginTop:Common.scaleSize(10)
     }
 });
```

- 【推荐】 当使用单一属性，或者全局样式属性时，推荐使用公共样式类；

```js
 // StyleCommon.js
 export default {
     topColor:{
         backgroundColor: '#3A3D42',
     },
     mainView:{
         backgroundColor: '#12141B',
     },
 }`在这里插入代码片`
```

- 【推荐】 当使用多个state或者props值时，推荐使用以下方式；

```js
  const {size, dotRadius, color} = this.props;
  const { maxNumber,minNumber,}=this.state;
```

使用此方式，代码结构清晰简洁，便于维护；

* 【推荐】 项目的通用样式写在项目通用样式类中；模块通用样式写在模块通用样式类中；文件通用样式写在文件底部的const styles中；独有样式写在行style中。



####4.3.1  控制语句

- 【强制】在一个 switch 块内，每个case要么通过 break/return 等来终止，要么注释说明程序将继续执行到哪一个 case 为止;在一个 switch 块内，都必须包含一个default 语句并且 放在最后，即使它什么代码也没有。
- 在 if/else/for/while/do 语句中必须使用大括号，即使只有一行代码，避免使用 下面的形式: if (condition) statements;
- 【推荐】推荐尽量少用 else， if-else 的方式可以改写成

```js
 if(condition) {
	 return obj; 
 }
```

- 方式表达逻辑，【强制】请勿超过3层， 超过请使用状态设计模式。 正例:逻辑上超过 3 层的 if-else 代码可以使用卫语句，或者状态模式来实现。

```js
// 修改前
if(isReqeustError) {
	console.log('isReqeustError is true');
}
else {
	if(!classList.length) {
		console.log('classList's length is zero');
	}else {
		console.log('classList's length is more than zero');
	}
}
// 使用卫语句
if(isReqeustError) {
	console.log('isReqeustError is true');
	return;
}
if(!classList.length) {
	console.log('classList's length is zero');
	return;
}
console.log('classList's length is more than zero');
```

附：[JavaScript设计模式](https://www.kancloud.cn/digest/design-pattern-of-js/128426)

-【推荐】使用三目运算，替换if else结构，精简代码
-【推荐】除常用方法(如 getXxx/isXxx)等外，不要在条件判断中执行其它复杂的语句，将复 杂逻辑判断的结果赋值给一个有意义的布尔变量名，以提高可读性。 说明:很多 if 语句内的逻辑相当复杂，阅读者需要分析条件表达式的最终结果，才能明确什么 样的条件执行什么样的语句，那么，如果阅读者分析逻辑表达式错误呢?

```js
        //伪代码如下
boolean existed = (file.open(fileName, "w") != null)&& (...) || (...); 
        if (existed) {
            ... 
         }
```

####4.3.1  日志管理

- 【推荐】 代码中过多使用console.log()会消耗性能，推荐去除不必要的日志输入代码；
- 【强制】 在入口文件添加以下代码； 说明：可以在发布时屏蔽掉所有的console.*调用。React Native中有一个全局变量__DEV__用于指示当前运行环境是否是开发环境。我们可以据此在正式环境中替换掉系统原先的console实现。

```js
if (!__DEV__) {
	   global.console = {
	     info: () => {},
	     log: () => {},
	     warn: () => {},
	     error: () => {},
	   };
 }
```

这样在打包发布时，所有的控制台语句就会被自动替换为空函数，而在调试时它们仍然会被正常调用。

####4.3.1  性能优化

- 【推荐】使用InteractionManager.runAfterInteractions，在动画或者某些特定场景中利用InteractionManager来选择性的渲染新场景所需的最小限度的内容； 使用场景类似于：

```js
    class ExpensiveScene extends React.Component {
      constructor(props, context) {
        super(props, context);
        this.state = {renderPlaceholderOnly: true};
      }
    
      componentDidMount() {
        InteractionManager.runAfterInteractions(() => {
          this.setState({renderPlaceholderOnly: false});
        });
      }
    
      render() {
        if (this.state.renderPlaceholderOnly) {
          return this.renderPlaceholderView();
        }
    
        return (
          <View>
            <Text>Your full view goes here</Text>
          </View>
        );
      }
    
    
      renderPlaceholderView() {
        return (
          <View>
            <Text>Loading...</Text>
          </View>
        );
      }
    };
```

-【推荐】在使用Touchable系列组件时，进行setState或者大量调帧操作，请使用如下方式：

```js
handleOnPress() {
          this.requestAnimationFrame(() => {
             //todo
          });
     }
```

####4.3.1  安全规约

- 【强制】用户敏感数据禁止直接展示，必须对展示数据脱敏; 说明:查看个人手机号码会显示成:158****9119，隐藏中间 4 位，防止隐私泄露

- 【强制】请求传入任何参数必须做有效性验证；避免过度请求服务，造成服务器压力，或者双向校验； 如：验证手机号长度，是否是手机号等；

  














## 第五章 注释规范



###5.1  顶层/文件注释

- 【推荐】 顶层注释用于告诉不熟悉这段代码的读者这个文件中包含哪些东西.应该提供文件的大体内容, 它的作者, 依赖关系和兼容性信息.

```js
/**
 * @file homeSence
 * @date 2019/12/20 13:11
 * @author Administrator
 * @lastModify Administrator 2018/12/20 13:11
 */
```

###5.2  构造器函数注释

- @class
- 别名:@constructor
- 【推荐】 标明函数是一个构造器函数，意味着需要使用 new 关键字来返回一个实例，即使用 new 关键字实例化。

```js
/**
 * Create new Point
 * @class 
 */
function Point {
    
}
let point = new Point();
  
```

###5.3  类注释

- @classdesc
- 【推荐】 标签用于为类提供一个描述，这样和构造函数的描述区分开来。@classdesc标签应该与 @class (或 @constructor)标签结合使用。

```js
// ex1
/**
 * Create new MyClass
 * @class 
 * @classdesc This is MyClass description
 * @params {string} className - 班级名称
 * @params {string} classDescript - 班级描述
 */
function MyClass(className, classDescript) {
    this.className = className;
    this.classDescript = classDescript;
}

// ex2 
/**
 * Create new MyClass
 * @class 
 * @classdesc This is MyClass description
 */
class MyClass {
    
}
```

**当使用 extends关键字来扩展一个现有的类的时候，可以使用 @augments (或 @extends) 标签。**

```js
/**
 * Class representing a dot.
 * @class 
 * @classdesc This is HerClass description
 * @extends MyClass
 */
class HerClass extends MyClass {
   
}
```

###5.4  方法与函数的注释

- @param 标签提供了对某个函数的参数的各项说明，包括参数名、参数数据类型、描述等。@param {变量类型} 变量名 - 变量描述 ex: @params {string | Number}
- @callback 描述一个回调函数。
- @returns 描述一个函数的返回值。语法和@param类似。

```js
/**
 * Send a post Request
 * @param {string} url - 请求地址
 * @param {string} method - 请求方式
 * @param {Object} body - 请求所需参数
 * @callback successCallBack-requestSuccessCallBack - 请求成功的回调
 * @callback errorCallBack-requestErrorCallBack - 请求失败的回调
 * @returns {Promise.<*>}
 */
const requestUrl = async (url, method, body, successCallBack, errorCallBack) => {
    reurn new Promise...
};
```

###5.5  变量及属性的注释

- @type 用于标识一个标识符可能包含的值的类型，或由函数返回值的类型。您还可以将其包含与其他JSDoc标签类型的表达式结合使用，如@param 标签。

```
/** 
 * variable description
 * @type {(string|Array.<string>)} 
 */
var foo;

/** @type {number} */
var bar = 1;
```

###5.6  常量的注释

- @constant 记录一个对象作为一个常量。别名:@const

```
/**
 * const description
 * @constant
 * @type {string}
 *
*/
const RED = 'FF0000';

/** @constant {number} */
const ONE = 1;
```

###5.7  模块的注释

- @module 描述：记录一个 JavaScript 模块。注意：如果你提供了一个type，那 必须 同时提供模块名称（）。

```
/** @module myModule */

/** will be module:myModule~foo */
let foo = 1;

/** will be module:myModule.bar */
let bar = function() {};
```

###5.8  常用标签及说明

| 块标签                                       | 详解                                                         |
| :------------------------------------------- | :----------------------------------------------------------- |
| @author 指定项目的作者                       | [详解](https://www.css88.com/doc/jsdoc/tags-author.html)     |
| @callback 描述一个回调函数                   | [详解](https://www.css88.com/doc/jsdoc/tags-callback.html)   |
| @class 标明函数是一个构造器函数              | [详解](https://www.css88.com/doc/jsdoc/tags-class.html)      |
| @classdesc 描述整个类。                      | [详解](https://www.css88.com/doc/jsdoc/tags-classdesc.html)  |
| @constant 常量。                             | [详解](https://www.css88.com/doc/jsdoc/tags-constant.html)   |
| @constructs 这个函数成员将成为类的构造函数。 | [详解](https://www.css88.com/doc/jsdoc/tags-constructs.html) |
| @description 标签提供一般描述                | [详解](https://www.css88.com/doc/jsdoc/tags-description.html) |
| @file 在文件开头的JSDoc注释部分使用该标签    | [详解](https://www.css88.com/doc/jsdoc/tags-file.html)       |
| @module 记录一个 JavaScript 模块             | [详解](https://www.css88.com/doc/jsdoc/tags-module.html)     |
| @param 对某个函数的参数的各项说明            | [详解](https://www.css88.com/doc/jsdoc/tags-param.html)      |
| @returns 描述一个函数的返回值                | [详解](https://www.css88.com/doc/jsdoc/tags-returns.html)    |
| @todo 记录一个将要完成的任务                 | [详解](https://www.css88.com/doc/jsdoc/tags-todo.html)       |
| @type 记录一个对象的类型                     | [详解](https://www.css88.com/doc/jsdoc/tags-type.html)       |
| @typedef 记录一个自定义的类型                | [详解](https://www.css88.com/doc/jsdoc/tags-typedef.html)    |

更多标签参见：[JSDoc中文文档](https://www.css88.com/doc/jsdoc/index.html)





## 附录 参考文献

 [1] [https://github.com/sunyardTime/React-Native-CodeStyle](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2FsunyardTime%2FReact-Native-CodeStyle)
 [2] React-Native 编码规范
 [3] [ECMAScript 6 入门](https://links.jianshu.com/go?to=http%3A%2F%2Fes6.ruanyifeng.com%2F)

