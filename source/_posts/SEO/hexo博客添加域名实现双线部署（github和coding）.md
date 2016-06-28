---
title: hexo博客添加域名实现双线部署（github和coding）
date: 2016-06-07 11:47:00
tags: [SEO,hexo,搜索引擎]
categories:  SEO
---

- 首先申请一个域名

- 在hexo目录下的source目录下新建一个文件CNAME，不要带后缀，也就是没有文件类型，可以使用命令来创建

```cpp
cd source
touch CNAME
```

- 然后添加自己申请的域名,不带 http 和 www 
```cpp
qiuchengjia.cn
```
- 我建议到 [dnspod](https://www.dnspod.cn/) 进行解析管理，我们可以在这里实现国内用户走coding，国外用户
走github


- 首先进入coding pages页面，添加自己的域名

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0%E5%9F%9F%E5%90%8D3.png)</center>

<!-- more -->

- 然后进入 dnspod 进行配置，如图

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2%E6%90%AD%E5%BB%BA%E5%9F%9F%E5%90%8D2.png)</center>

- NS记录的记录值


```cpp
f1g1ns1.dnspod.net.
f1g1ns2.dnspod.net.
```

