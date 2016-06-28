---
title: ' 如何彻底删除ubuntu上的软件'
date: 2015-06-01 14:07:24
tags: ubuntu
categories: ubuntu
---

- 找到此软件名称,然后

```cpp
sudo apt-get purge ......
(点点为为程序名称),purge参数为彻底删除文件
```


- 然后使用下面两条命令来清除残余的配置文件

```cpp
sudo apt-get autoremove,sudo apt-get clean
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
```

<!-- more -->
