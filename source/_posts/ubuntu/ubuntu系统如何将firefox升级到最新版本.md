---
title: ubuntu系统如何将firefox升级到最新版本
date: 2015-05-31 22:30:22
tags: ubuntu
categories: ubuntu
---

- 先去firefox官网上下载最新版本的firefox浏览器          [传送门](http://firefox.com.cn/download/)

- 然后在终端中将旧版本的firefox浏览器删除 sudo apt-get removefirefox  ，然后系统会提示你，你就输入Y

- 解压安装最新版本，首先切换到安装目录：



  ```cpp
     cd/opt(推荐使用目录）
  ```
   
   
  **解压：**
  
  
 ```cpp
 sudo tar -xvf/tmp/firefox-36.0.4.tar.bz2
 ```
 
 <!-- more -->
 
  (下载安装路径，对于安装包的名字，输入到firefox+Tab键就会自动补全)回车
  
  
 ** 安装：**
  
  
  ```cpp
  sudo ln -s /opt/firefox  /usr/bin/firefox
  ```
  
  
  
- 安装最新的Flash插件，打开ubuntu软件中心，然后搜索adobe flash，然后点击安装，在重启一下firefox,就可以愉快的看视频了

-  -  -

![](http://img.blog.csdn.net/20151217140533710?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)