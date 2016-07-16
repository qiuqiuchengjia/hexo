---
title: hexo搭建个人博客
date: 2016-06-02 18:24:38
tags: [hexo,博客]
categories: 博客
photos:
- http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%875.png
- http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%877.png
- http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%873.png
---

- 首先我们应该学会看官方文档，文档是最好的资料 [传送门](https://hexo.io/zh-cn/docs/index.html)

- 首先我们需要安装Git [传送门](https://git-scm.com/)和 Node.js [传送门](https://nodejs.org/en/)

- 打开dos命令行，安装需要的组件

```cpp
npm install -g hexo-cli
```

- 安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件

```cpp
hexo init <folder>
cd <folder>
npm install
```

<!-- more -->

- 部署


安装 hexo-deployer-git
 
```cpp
 npm install hexo-deployer-git --save
```

- 修改配置

```cpp
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
  message: [message]
```
- 部署进 github 或 coding

```cpp
hexo g
hexo d
```

- 还有一点注意事项，如果要添加 README.md 文件的话，我们可以在本地
写好，然后放入public文件夹下，如图：

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2%E6%90%AD%E5%BB%BA.png)</center>

- 此文只是安装hexo的主要流程，具体事项参考hexo官方文档 [传送门](https://hexo.io/zh-cn/docs/index.html)

- 我的hexo博客搭建在github [传送门](https://github.com/qiuchengjia/qiuchengjia.github.io)，coding上 [传送门](https://coding.net/u/qiuchengjia/p/qiuchengjia/git)，喜欢可以star一下

<center>![](http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%875.png)</center>

</br>
</center>![](http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%877.png)</center>

</br>

<center>![](http://7xstki.com1.z0.glb.clouddn.com/github%E5%9B%BE%E7%89%873.png)</center>
