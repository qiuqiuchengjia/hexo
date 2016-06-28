---
title: ' linux如何安装搜狗输入法'
date: 2015-05-31 21:54:44
tags: linux
categories: linux 
photos:
- http://img.blog.csdn.net/20151217121616209?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center
---

- 首先卸载ibus输入法，卸载ibus输入法很容易，只要在终端输入sudo apt-get remove ibus命令即可卸载ibus，然后我们要安装新的搜狗输入法（其他的输入法一样这样安装）

- 我们去搜狗官网去下载最新的搜狗输入法点击[传送门](http://pinyin.sogou.com/linux/?r=pinyin)，也可以
直接在终端中使用命令安装
- 下载32位

```cpp
wget "http://pinyin.sogou.com/linux/download.php?f=linux&bit=32" -O "sougou_32.deb"
```

- 下载64位

```cpp
wget "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O "sougou_64.deb"  
```

下载好之后我们就要进行解压缩了，在终端中执行命令sudo dpkg-isougou_64.deb，这里的sougou_64.deb是上一步下载的文件的名字，可以根据自己的名字进行改动。
接下来设置系统的输入法，通过



<font color='red'>系统设置>语言支持>键盘输入方式系统</font>


然后选择 fcitx 项，然后注销重新登陆，我们就可以看到屏幕右上角有搜狗输入法的标志了。

如图：

![](http://img.blog.csdn.net/20151217121616209?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

<!-- more -->