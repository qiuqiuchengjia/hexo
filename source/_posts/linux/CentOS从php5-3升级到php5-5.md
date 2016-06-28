---
title: CentOS从php5.3升级到php5.5
date: 2016-06-01 15:31:35
tags: [CentOS,linux]
categories: linux
---

- 首先检查php版本

```cpp
 php  --version  
```

- 增加 yum repository 以便下载php

```cpp
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm  
```

- 安装php5.5

```cpp
 yum install php55w php55w-opcache  
```

- 为了升级取代原来5.3档案

```cpp
yum install yum-plugin-replace  
  
yum replace php-common --replace-with=php55w-common  
```

<!-- more -->