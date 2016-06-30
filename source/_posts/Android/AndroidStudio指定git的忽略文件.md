---
title: AndroidStudio指定git的忽略文件
date: 2016-06-29 17:43:11
tags: [Android,git]
categories: Android
---

### AndroidStudio自动忽略###

- 现在的AndroidStudio已经很智能了，当创建项目的时候自动给我们创建了一个

.gitignore 并给我们忽略了一些文件

```cpp
*.iml
.gradle
/local.properties
/.idea/workspace.xml
/.idea/libraries
.DS_Store
/build
/captures
```

### 手动忽略###

- 我们还可以在项目创建完成之后手动指定要忽略的文件

```cpp
.idea 文件夹
.gradle 文件夹
所有的 build 文件夹
所有的 .iml 文件
local.properties 文件
```

- AndroidStudio如图配置就可以实现

<center>![](http://o99dg8ap9.bkt.clouddn.com/AndroidStudio%E6%8C%87%E5%AE%9Agit%E7%9A%84%E5%BF%BD%E7%95%A5%E6%96%87%E4%BB%B6.png)</center>

<!-- more -->