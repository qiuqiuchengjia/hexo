---
title: ubuntu下如何安装android studio
date: 2015-06-01 14:01:52
tags: [AndroidStudio,ubuntu]
categories: ubuntu
---
 在ubuntu下安装android studio有好几种方法，现在我就来介绍最简单的一种方法
 
- 如果没有安装jdk的先安装jdk
 
- 到 [传送门](http://www.androiddevtools.cn/) 下载最新的android studio版本，然后选择一个文件夹解压androidstudio，然后就可以在终端中进入bin 目录，输入 sudo ./studio.sh 就可以打开androidstudio了

- 创建快捷方式，先新建一个空白文件，然后将下列代码依照自己的安装路径复制进去

```cpp
[Desktop Entry]  
Name=AndroidStudio  
Comment=AndroidStudio  
Exec=/home/qiu/Work/Developer/AndroidStudio/androidstudio/bin/studio.sh  
Icon=/home/qiu/Work/Developer/AndroidStudio/androidstudio/bin/studio.png  
Terminal=false  
Type=Application  
Categories=Application；Development；  
```


然后将文件的名字改成android.desktop，然后右键 --- > 属性--->勾选允许作为程序可执行文件，然后就可以了，此种创建快捷方式的方法对于其他程序均适用

<center>![](http://img.blog.csdn.net/20151217151413240?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


<!-- more -->