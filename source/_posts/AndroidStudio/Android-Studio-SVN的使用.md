---
title: Android Studio SVN的使用
date: 2016-06-01 14:52:54
tags: [AndroidStudio,SVN]
categories: AndroidStudio
---

- SVN的配置

  1. 这篇文章使用的Android studio版本为1.4 RC3。
  2. 我选择的是TortoiseSVN，版本为1.8，不要选择1.9版本（目前的最新版），因为如果你安装的是1.9版本当你在studio中配置svn时会提示你如下错误

<center>![](http://i.stack.imgur.com/MQStV.jpg)</center>

原因在于studio是基于Intellij IDEA开发的，而Intellij IDEA 14.1.4目前还无法使用svn1.9.0这个版本。

　3. 当你安装TortoiseSVN时，command line client tools 默认是不会安装的，必须手动选择安装上，否则无法在studio中进行svn关联配置

<center>![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204084756986-546433595.png)</center>　

4.安装好之后就是进行studio与svn的关联了在studio中打开如下路径File->Settings->Version Control->Subversion,如下图所示：
<center>![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204085204252-55717462.png)</center>


<!-- more -->


5.在Use command line client中选择你刚刚安装的svn路径bin目录下的svn.exe这个文件
　　Use system default Subversion configuration directory 前面勾选上，这个默认就是勾选上上的，这个是svn相关配置信息的路径，保留默认路径就行。
　　

- 添加忽略文件　

1.之所以要添加忽略文件或者文件夹，原因是由于每个人的studio工程配置都会有所不同，例如gradle 的版本。或者有些文件中保存了一些重要的信息，比如local.properties中配置的各种提交信息，这些信息是不能提交到svn上的，一般来说需要忽略的文件和文件夹主要有一下几类：

　   .idea 文件夹
　　 .gradle 文件夹
　　 所有的 build 文件夹
　　 所有的 .iml 文件
　　 local.properties 文件
　　
这也是Android馆方建议我们过滤的文件夹

2.添加忽略请打开如下路径:File->Settings->Version Control->Ignored Files,点击右面的+号添加你要忽略的文件夹或文件路径即可，如下图所示：

<center>![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204093704830-1155838146.png)</center>

3.注意：Studio中只有在未关联SVN之前添加忽略文件才有效，也就是说，这一步必须在VCS->Import into Version Control->Share Project(SubVersion)这步之前进行，否则添加的忽略文件是无效的

4.下一步就是关联svn，其实过程上一步已经说了，就是执行VCS->Import into Version Control->Share Project(SubVersion)这个选项，这里需要注意一下Import into Version Control下还有一个Import into Subversion这个选项 ,这两选项其实是有区别的，Share Project(SubVersion)这个选项只是对项目同SVN进行了关联操作，并没有将代码提交，需要完成 连接后在进行提交代码操作；而Import into Subversion这个选项只是将你的svn项目提交到了svn上，并没有进行关联，执行完你会发现所有的工程文件都变成了红色，如果你是一个项目发起者，并且当你再次提交修改的项目时就会报错，提示你该项目不是svn的工作副本，无法提交，如果想提交成功，你需要删除当前项目，重新从svn上导入后便可提交成功，虽然两种方式均可，但是建议采用Share Project(SubVersion)的方式。本文也采用Share Project(SubVersion)方式提交

5.点击Share Project(SubVersion)后会出现如下对话框
<center>![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204100347408-1033591640.png)</center>

　这里列出了当前svn的提交路径，如果你还没有点击上边的+号添加路径即可。选择完成后点击Share
　![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204101744127-1148841605.png)
　
　选择1.8format，点击OK，成功后会发现除了忽略的文件其他均变成了绿色
　![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204102023736-1619075435.png)
　
　到这为止位置关联已经建立完毕，下一步是把代码提交到svn上，在顶部菜单栏选择
　![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204102150502-1907591442.png)
　
　或者项目右击->SubVersion->Commit Directory...
　
　![](http://images2015.cnblogs.com/blog/828272/201512/828272-20151204102306643-1897108269.png)
　
6.填写commit message后点击commit。这里有的时候你点击commit后并没有任何反应，此时删除你的src目录下的test文件夹后再次提交即可。具体原因还不清楚，可能是svn检测这里有问题无法提交，或者跟studio的版本有关系。
　　到这里项目已经成功体提交到了svn上，你可以使用svn进行合作开发了
　

- 单个文件的增加或修改

很简单，在需要操作的文件上右击->Subversion->Commit File 即可
　