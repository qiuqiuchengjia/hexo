---
title: 项目分类建立Config文件
date: 2016-07-03 22:08:32
tags: [项目,Config]
categories: 项目
---

### 分类Config###

- 以前做项目的时候总是将所以的配置写在一个Config文件中，导致我修改配置的时候非常费劲，所以我现在使用分类Config文件的方法，虽然文件多点，但是修改的效率肯定是显著提升的

```cpp
Config  //主配置文件
ConfigUI  //界面对应的配置
ConfigIO   //文件，流操作等对应的配置
ConfigNet  //网络对应的配置
ConfigSQL   //数据库对应的配置
ConfigGlobal  //全局参数配置
```


<!-- more -->