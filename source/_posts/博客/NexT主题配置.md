---
title: NexT主题配置
date: 2016-07-16 12:59:41
tags: hexo
categories: 博客
---

### 添加站内搜索###

- 添加百度/谷歌/本地 自定义站点内容搜索

- 安装hexo-generator-search

```cpp
npm install hexo-generator-search --save
```

- 在站点的 _config.yml中增加

```cpp
search:
  path: search.xml
  field: post
```

<!-- more -->