---
title: ' ubuntu如何安装Mac OS X主题'
date: 2015-06-01 10:43:57
tags: [linux,ubuntu,MacOSX]
categories: ubuntu
---

首先我们开看一下完成之后的预览图，是不是很漂亮啊，不过我自定义的不是和苹果完全相同，进行一些自己的改造

<center>![](http://img.blog.csdn.net/20151217140901194?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

<!-- more -->

- 首先我们先下载一下Mac OS X的壁纸，下载地址：[传送门](http://drive.noobslab.com/data/Mac-13.10/MBuntu-Wallpapers.zip) ，解压之后选择图片，然后就可以设置为壁纸

- 安装主题修改工具，为了修改GTK主题，图标，系统主题，光标，字体我们需要安装unity tweak。要安装unitytweak在ubuntu14.04上通过使用如下命令：



```cpp
sudo apt-getinstall unity-tweak-tool
```



效果如下：


<center>![](http://img.blog.csdn.net/20151217140959435?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>



也可以通过安装ubuntu-tweak来实现主题更换


```cpp
sudoadd-apt-repository ppa:tualatrix/ppa  
sudoapt-get update  
apt-getinstall ubuntu-tweak  
```


效果如下：

<center>![](http://img.blog.csdn.net/20151217141051786?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


- 在ubuntu14.04中安装Mac OSX主题，为了修改上文说的内容，我们需要在终端中运行如下命令：


```cpp
sudo add-apt-repositoryppa:noobslab/themes  
sudo apt-get update  
sudo apt-get install mac-ithemes-v3  
sudo apt-get install mac-icons-v3  
```


然后打开刚刚的选择主题工具，分别选择如下选项：


<center>![](http://img.blog.csdn.net/20151217141156681?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


<center>![](http://img.blog.csdn.net/20151217141201555?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


<center>![](http://img.blog.csdn.net/20151217141205669?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


现在unity桌面看起来就像Mac了。你已经有了mac的图标，mac的窗口样式，mac的鼠标指针样式


- 现在我们在来添加dock：


效果如下：

<center>![](http://img.blog.csdn.net/20151217141332503?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


    1. 首先我们打开ubuntu软件中心，如图输入dock，下载当前的这个软件
    
<center>![](http://img.blog.csdn.net/20151217141453083?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>
    
    2.然后打开这个软件，选择设置为开机启动，然后右击进行配置

<center>![](http://img.blog.csdn.net/20151217141629362?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


    3.然后进入选择主题
   
   
<center>![](http://img.blog.csdn.net/20151217141641308?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>



- 这样我们的dock就设置好了，当然，还可以使用另一个dock软件Docky（这里可以不用配置，只是一个扩展，也可以使用这个软件配置第四点的dock，看你自己的喜好，Docky使用比较简单，个人比较喜欢上面那种，这种也喜欢，所以两种都配置了）


如图：

<center>![](http://img.blog.csdn.net/20151217141717095?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


然后配置出来的效果就是如图所示：


<center>![](http://img.blog.csdn.net/20151217141750892?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>