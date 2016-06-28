---
title: hexo做SEO（添加sitemap和baidusitemap）
date: 2016-06-06 12:07:57
tags: [SEO,搜索引擎,hexo]
categories: SEO
---

- 添加站点地图

站点地图是一种文件，您可以通过该文件列出您网站上的网页，从而将您网站内容的组织架构告知Google和其他搜索引擎。Googlebot等搜索引擎网页抓取工具会读取此文件，以便更加智能地抓取您的网站

- 安装插件

打开hexo目录下的dos命令行，分别安装百度和google插件

```cpp
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```

- 在博客目录的_config.yml中添加如下代码

```cpp
# 自动生成sitemap
sitemap:
path: sitemap.xml
baidusitemap:
path: baidusitemap.xml
```

<!-- more -->

- 编译你的博客

```cpp
hexo g
```

- 如果你在你的博客根目录的public下面发现生成了sitemap.xml以及baidusitemap.xml就表示成功了

- 修改 node_modules\hexo-generator-baidu-sitemap\baidusitemap.ejs
文件，将红色框内的地址换成自己的地址

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%81%9Aseo%E5%9B%BE%E7%89%872.png)</center>

- 修改 node_modules\hexo-generator-sitemap\sitemap.xml文件，将红色
框内的地址换成自己的地址

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%81%9Aseo%E5%9B%BE%E7%89%871.png)</center>