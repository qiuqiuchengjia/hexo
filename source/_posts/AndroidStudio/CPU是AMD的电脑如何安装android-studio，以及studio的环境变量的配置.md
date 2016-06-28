---
title: ' CPU是AMD的电脑如何安装android studio，以及studio的环境变量的配置'
date: 2015-05-31 18:04:43
tags: AndroidStudio
categories: AndroidStudio
---
### AMD的电脑###

我的电脑的CPU是AMD的，当初买的时候没想那么多，可是到后来才知道有那么多的问题，最近遇到的一个最大的问题就是  Android studio的安装了，先前是studio一直安装不好，后来才发现环境变量配置错误，和以前安装jdk的环境变量的时候有一点点的区别，但就是这一点点的区别搞得我焦头烂额，后来试了很多种方法终于找出了错误，后来又出现了如下错误：

```cpp
   emulator: ERROR: x86 emulation currently requires hardware acceleration!

   Please ensure Intel HAXM is properly installed and usable.

   CPU acceleration status: HAX kernel module is not installed!
                              
```

到现在我才知道原来硬件是硬伤，所以就找解决的方法，接下来我就分两点把环境变量的配置和如何解决AMD没有HAXM的功能。

<!-- more -->

### android studio的环境变量配置###

 例如：D:\develop\JDK\JDK\JDK\bin ，但是我在我的电脑上这样配置就会出现闪退，android studio得界面刚出来一下就没了，而且打开任务管理器也看到studio闪一下就没了，后来我又把环境变量换成D:\develop\JDK\JDK\JDK，注意：这里没有bin，但是发现还是一样的，后来我又把JAVA_HOME中的其他的路径全部移动到path路径中，只留下一个D:\develop\JDK\JDK\JDK路径，后来发现成功了，所以在JAVA_HOME中只设置JDK的安装目录就是可以的，注意：没有bin。
 
- 绝对路径法：即JDK的环境变量的配置全部使用绝对路径。是最简单的配置方法。
path=C:\Program Files (x86)\Java\jdk1.7.0_45\bin;C:\Program Files (x86)\Java\jdk1.7.0_45\jre\bin

- JAVA_HOME法：这是最常见的配置方法，改动比较方便，较为灵活。也可以理解为相对路径。
JAVA_HOME=C:\Program Files (x86)\Java\jdk1.7.0_45
path中=%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;

- 完整法：是在JAVA_HOME方法的基础上增加了classpath.在某些使用过程中可能会使用到classpath来寻找路径.推荐使用这种方式。
JAVA_HOME=C:\Program Files (x86)\Java\jdk1.7.0_45
path=%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;
classpath=,;%JAVA_HOME%\lib;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar（注意：classpath要以.;开头。英文状态下的“点  分号”）
 
### 安装Genymotion###


- 配置AMD的CPU的电脑如何跳过HAXM 加速功能直接可以运行模拟器：如果我们的电脑是搭载的AMD的CPU的话，启动模拟器和运行程序的时候会出现一个安装intel 的HAXM  加速功能的错误，但是我们的CPU不是intel的怎么办？

   答案是我们可以使用外置的模拟器，我们先下载一个genymotion模拟器，[传送门](http://jingyan.baidu.com/article/3ea51489e7d8bd52e61bba36.html ) ，这个是百度教程如何下载和安装genymotion模拟器，安装完毕之后我们就要把genymotion模拟器安装到我们的android studio中了，具体的方法也很简单，[传送门](http://blog.csdn.net/hyr83960944/article/details/35987721) ，这个是 将genymotion插件安装进studio的方法，[传送门](http://blog.csdn.net/hyr83960944/article/details/37900383) ，然后在用这个连接中的方法将模拟器配置进入我们的studio，接着我们就可以启动我们先前安装好的genymotion了，然后我们再在我们的studio中运行我们的项目，选择正在运行的genymotion模拟器，然后我们就会在模拟器上看到我们兴奋的界面了，是不是很容易啊。
   
![genymotion](http://img.blog.csdn.net/20150920120640647?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center "运行成功的genymotion")