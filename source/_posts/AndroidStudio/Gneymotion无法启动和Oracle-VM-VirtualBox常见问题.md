---
title: Gneymotion无法启动和Oracle VM VirtualBox常见问题
date: 2016-06-01 14:44:14
tags: genymotion
categories: AndroidStudio
---
### genymotion和VBOX下载

- 可用的带VBOX的gemymotion [传送门](http://pan.baidu.com/s/1skWJGRV)


- 有时候我们会遇到根源motion无法启动的问题，这里面有很大一部分原因是VirtualBox的配置问题，自从VirtualBox-4.3.12-93733-Win之后，就出现了很多的BUG，所以我们使用VirtualBox-4.3.12-93733-Win，下载地址：[传送门](http://pan.baidu.com/s/1dEn7kU9)

### 模拟器无法安装应用###

- 下图中模拟器无法安装应用，需要将一个包安装进模拟器就行，包的名字叫做Genymotion-ARM-Translation_v1.1，可以直接到我的百度云下载，[传送门](http://pan.baidu.com/s/1eRbZZF0) 直接将这个文件拖进模拟器的屏幕，然后重启就行

<center>![](http://img.blog.csdn.net/20160309164544218?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

</br>

### 不能创建虚拟主机###
- 下图这个问题我们需要将虚拟机卸载一下，然后进去C:\Users\Administrator\AppData\Local下删除Genymobile文件夹和删除C:\Users\Administrator下的.VirtualBox
就可以解决这个问题，还有就是这里有兼容性问题，如果是别的系统的话，建议使用win7兼容性模式运行

<!-- more -->

<center>![](http://img.blog.csdn.net/20160309165325580?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

</br>

### Unable to start the virtual device###

#### 配置全局网络配置####
- 出现这个问题是我们的虚拟机的网络配置有问题，我们可以先去打开虚拟机，管理 -->全局设定-->网络-->仅主机（Host-Only）网络--双击下面的条目


<center>![](http://img.blog.csdn.net/20160309165733985?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

<center>![](http://img.blog.csdn.net/20160309165958566?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

<center>![](http://img.blog.csdn.net/20160309170004208?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

#### 兼容性运行####

- 可以将VBOX和genymotion都设置为win8兼容性运行，而且同时设置以管理员运行

#### 设置模拟器网卡####

然后我们点击我们的Android模拟器，右键-->设置 -->网络--选择刚刚设置的网卡作为模拟器的网卡，如图：
这样就解决了我们的启动问题了
<center>![](http://img.blog.csdn.net/20160309170226647?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

<center>![](http://img.blog.csdn.net/20160309170416135?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

