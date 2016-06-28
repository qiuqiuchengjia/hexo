---
title: ' ubuntu输入密码登陆后又跳到登陆界面解决方案'
date: 2015-06-01 14:11:07
tags: ubuntu
categories: ubuntu
---

- 启动系统，输入正确的账号和密码，点击登录，屏幕一闪，然后又跳回登录界面。问题原因：主目录下的　.Xauthority　文件拥有者变成了root，从而以用户登陆的时候无法都取.Xauthority文件

- 说明：Xauthority，是startx脚本记录文件。Xserver启动时，读文件~/.Xauthority,读入对应其display 的记录。当一个需要显示的客户程序启动调用XOpenDisplay()也读这个文 件，并把找到的magic code 发送给 Xserver。当Xserver验证这个magic code正确以后，就同意连接啦。观察startx脚本也可以看到，每次startx 运行，都在调用xinit以前使用了xauth的add命令添加了一个新的记录到~/.Xauthority，用来这次运行X使用认证

- 解决方案：开机后在登陆界面按下shift + ctrl + F1进入tty命令行终端登陆，然后输入root，然后输入密码， 重装gdm 
```cpp
sudo  apt-get remove gdm  
sudo apt-get install gdm  
dpkg  -reconfigure gdm  //修改启动顺序
```

<!-- more -->

<center>![](http://img.blog.csdn.net/20151218174842394?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

然后输入：

```cpp
reboot  
```

 问题解决，我们还可以在进入系统之后再修改 .Xauthority文件的权限