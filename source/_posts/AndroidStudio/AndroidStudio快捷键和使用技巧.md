---
title: AndroidStudio快捷键和使用技巧
date: 2016-06-29 21:44:57
tags: AndroidStudio
categories: AndroidStudio
---

### 最常用快捷键###

|  快捷键       | 用途描述                         |
| ------------- |:--------------------------------:|
| ctrl+k| commit到版本控制软件
| ctrl+shift+K| push到远程仓库
| ctrl+T| 拉取版本到本地
| shift+F10|部署到模拟器运行
| Ctrl+Shift+Space | 自动补全代码
| Ctrl+Alt+L  | 格式化代码
| Ctrl + Shift + I|快速查看定义
| Ctrl＋E| 可以显示最近编辑的文件列表
| Shift＋Click| 可以关闭文件
| Ctrl＋[或]| 可以跳到大括号的开头结尾
| Ctrl＋Shift＋Backspace| 可以跳转到上次编辑的地方
| Ctrl＋F12| 可以显示当前文件的结构
| Ctrl＋F7| 可以查询当前元素在当前文件中的引用，然后按F3可以选择
| Ctrl＋N| 可以快速打开类
| Ctrl＋Shift＋N| 可以快速打开文件
| Alt＋Q| 可以看到当前方法的声明
| Ctrl＋W| 可以选择单词继而语句继而行继而函数
| Alt＋F1| 可以将正在编辑的元素在各个面板中定位
| Ctrl＋P| 可以显示参数信息
| Ctrl＋Shift＋Insert| 可以选择剪贴板内容并插入
| Alt＋Insert| 可以生成构造器/Getter/Setter等
| Ctrl＋Alt＋V | 可以引入变量。例如把括号内的SQL赋成一个变量
| Ctrl＋Alt＋T| 可以把代码包在一块内，例如try/catch
| Alt＋Up and Alt＋Down| 可在方法间快速移动
| Esc| 该操作仅仅把光标移回编辑器。
| Shift + Esc|该操作会关闭当前面板，然后把光标移回到编辑器
| Ctrl + F12|展现当前类的大纲，并可以快速跳转
| Ctrl + Tab|切换器,可以用来快速打开文件
| Alt + `|版本控制操作弹窗
| Ctrl + Alt + M|提取方法
| Ctrl + Alt + P|提取参数
| Ctrl + Shift + J|合并行和文本
| Ctrl + J|动态模版，非常好用
| Ctrl + Shift + Up/Down|上下移动方法

<!-- more -->

### 常用快捷键###

|  快捷键       | 用途描述                         |
| ------------- |:--------------------------------:|
| Ctrl + Shift + F12|隐藏所有面板
| Ctrl + Shift + "+"/ "-"| 展开/折叠代码
| Alt+回车 | 导入包,自动修正
| Ctrl+N   | 查找类
| Ctrl+Shift+N | 查找文件
| Ctrl+Alt+O | 优化导入的类和包
| Alt+Insert | 生成代码(如get,set方法,构造函数等)
| Ctrl+E或者Alt+Shift+C  | 最近访问的文件
| Ctrl+shift+E| 打开最近修改的文件
| Ctrl+R | 替换文本
| Ctrl+F | 查找文本
| Ctrl+Shift+Space | 自动补全代码
| Ctrl+空格 | 代码提示
| Ctrl+Alt+Space | 类名或接口名提示
| Ctrl+P | 方法参数提示
| Ctrl+Shift+Alt+N | 查找类中的方法或变量
| Alt+Shift+C | 对比最近修改的代码
| Shift+F6  | 重构-重命名
| Ctrl+Shift+Up/Down| 上下移动本行代码
| Ctrl+X | 剪切行
| Ctrl+Y | 删除行
| Ctrl+D | 复制行
| Ctrl+/ 或 Ctrl+Shift+/  | 注释（// 或者 /**/）
| Ctrl+J  | 自动代码
| Ctrl+E | 最近访问的文件
| Ctrl+H | 显示类结构图
| Ctrl+Q | 显示注释文档
| Alt+F1 | 查找代码所在位置
| Alt+1 | 快速打开或隐藏工程面板
| Ctrl+Alt+ left/right | 返回至上次浏览的位置
| Alt+ left/right | 切换代码视图
| Alt+ Up/Down | 在方法间快速移动定位
| Ctrl+Shift+Up/Down | 代码向上/下移动

### 使用技巧###

#### 文章####

- [传送门](http://mp.weixin.qq.com/s?__biz=MzA3ODY0MzEyMA==&mid=2657236292&idx=1&sn=7584243ad7f7559d42410eda4468b01c&scene=0#wechat_redirect)

#### 书签####

- 添加/移除书签：F3(OS X) 、F11(Windows/Linux);

- 添加/移除书签(带标记)：Alt + F3(OS X)、Ctrl + F11(Windows/Linux);

- 显示全部书签：Cmd + F3(OS X) 、Shift + F11(Windows/Linux)，显示所有的书签列表，并且是可以搜索的

- 上一个/下一个书签：无，可以在设置中设置快捷键

- 更多：当你为某个书签指定了标记，你可以使用快捷键 Ctrl + 标记 来快速跳转到标记处，比如输入Ctrl + 1，跳到标记为1的书签处

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A71.gif)</center>

#### 与分支比对####

- 描述：假如你的项目是使用git来管理的，你可以将当前文件或者文件夹与其他的分支进行比对。比较有用的是可以让你了解到你与主分支有多少差别。

- 调用：Menu → VCS → Git → Compare With Branch

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A72.gif)</center>

#### 在外部打开文件####

- 描述：通过这个快捷键，简单地点击Tab，就可以打开当前文件所在的位置或者该文件的任意上层路径。

- 快捷键：Cmd + 单击Tab(OS X)、Ctrl + 点击Tab(Windows/Linux);

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A73.gif)</center>

#### Select In####

- 描述：拿着当前文件然后问你在哪里选中该文件。恕我直言，最有用的就是在项目结构或者资源管理器中打开 该文件。每一个操作都有数字或者字母作为前缀，可以通过这个前缀来快速跳转。通常，我会 Alt + F1 然后 回车(Enter) 来打开项目视图，然后 再用 Alt + F1 在OS X的Finder里找到文件。你可以在文件中或者直接在项目视图里使用该操作

- 快捷键：Alt + F1

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A74.gif)</center>


#### Sublime Text式的多处选择####

- 描述：这个功能超级赞！该操作会识别当前选中字符串，选择下一个同样的字符串，并且添加一个光标。这意味着你可以在同一个文件里拥有多个光标，你可以同时在所有光标处输入任何东西

- 快捷键：Ctrl + G(OS X)、Alt + Ｊ（Windows、Linux）

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A75.gif)</center>

#### 编写正则表达式####

- 描述：使用Java编写正则表达式是一件很困难的事，主要原因是：

- 你必须得避开反斜杠；

- 说实话，正则很难；

- 看第二条。

- IDE能帮我们干点啥呢？当然是一个舒服的界面来编写和测试正则啦~ - 快捷键：Alt + Enter → check regexp

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A76.gif)</center>

#### 使用Enter和Tab进行代码补全的差别####

- 描述：代码补全时，可以使用Enter或Tab来进行补全操作，但是两者是有差别的

- 使用Enter时：从光标处插入补全的代码，对原来的代码不做任何操作

- 使用Tab时：从光标处插入补全的代码，并删除后面的代码，直到遇到点号、圆括号、分号或空格为止

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A77.gif)</center>

#### 提取变量####

- 描述：这是一个提取变量的快捷操作。当你在没有写变量声明的直接写下值的时候，这是一个很方便生成变量声明的操作，同时还会给出一个建议的变量命名

- 调用：Menu → Refactor → Extract → Variable

- 快捷键：Cmd + Alt + V(OS X)、Ctrl + Alt + V(Windows/Linux)；

- 更多：当你需要改变变量声明的类型，例如使用 List 替代 ArrayList，可以按下Shift + Tab，就会显示所有可用的变量类型

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A78.gif)</center>

#### 取反补全####

- 描述：有时你自动补全一个布尔值，然后回到该值的前面添加一个感叹号来完成取反操作，现在通过使用输入!代替enter完成补全操作，就可以跳过这些繁琐的操作了

- 快捷键：代码补全的时候，按下!即可（有时需要上下键选中候选项）

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A79.gif)</center>

#### 包裹代码####

- 描述： 该操作可以用特定代码结构包裹住选中的代码块，通常是if语句，循环，try/catch语句或者runnable语句。 如果你没有选中任何东西，该操作会包裹当前一整行

- 快捷键：Cmd + Alt + T(OS X)、Ctrl + Alt + T(Windows/Linux)

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A710.gif)</center>

#### 移除包裹代码####

- 描述：该操作会移除周围的代码，它可能是一条if语句，一个while循环，一个try/catch语句甚至是一个runnable语句。该操作恰恰和包裹代码（Surround With）相反

- 快捷键：Cmd + Shift + Delete(OS X)、Ctrl + Shift + Delete(Windows/Linux)

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E5%BF%AB%E6%8D%B7%E9%94%AE%E5%92%8C%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A711.gif)</center>
