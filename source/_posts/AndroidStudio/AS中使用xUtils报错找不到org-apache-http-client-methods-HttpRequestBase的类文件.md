---
title: ' AS中使用xUtils报错找不到org.apache.http.client.methods.HttpRequestBase的类文件'
date: 2016-07-10 18:28:25
tags: AndroidStudio
categories: AndroidStudio
---

### AndroidStudio出现的错误###

- 错误如下

<center>![](http://o99dg8ap9.bkt.clouddn.com/AS%E4%B8%AD%E4%BD%BF%E7%94%A8xUtils%E6%8A%A5%E9%94%99%E6%89%BE%E4%B8%8D%E5%88%B0org.apache.http.client.methods.HttpRequestBase%E7%9A%84%E7%B1%BB%E6%96%87%E4%BB%B61.png)</center>

### 解决方法###

- 打开对应module的build.gradle文件

- 将 useLibrary 'org.apache.http.legacy'  将这一行代码添加到android{}根目录下 

```cpp
useLibrary 'org.apache.http.legacy'
```

<center>![](http://o99dg8ap9.bkt.clouddn.com/AS%E4%B8%AD%E4%BD%BF%E7%94%A8xUtils%E6%8A%A5%E9%94%99%E6%89%BE%E4%B8%8D%E5%88%B0org.apache.http.client.methods.HttpRequestBase%E7%9A%84%E7%B1%BB%E6%96%87%E4%BB%B62.png)</center>

### 举一反三###

- 以后类似的错误也可以学着这样解决

<!-- more -->