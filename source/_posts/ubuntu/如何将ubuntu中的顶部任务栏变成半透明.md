---
title: ' 如何将ubuntu中的顶部任务栏变成半透明'
date: 2015-06-01 13:12:24
tags: ubuntu
categories: ubuntu
---


   我们在安装gnome桌面之后会非常困扰，因为顶部的任务栏是黑色的，感觉非常的压抑，如图：这就是顶部任务栏，只不过我的做过修改，所以不是黑色的，下面我就来教大家如何将任务栏变成半透明
   
<center>![](http://img.blog.csdn.net/20151217142104335?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>

<!-- more -->

- 先找到文件 /usr/share/gnome-shell/theme/gnome-shell.css ，然后我们将这个文件复制出来，我们需要修改这个文件，由于我们没有修改这个文件的权限，所以我们把这个文件复制出来，修改好了之后我们再在终端中将这个文件移动到原来的路径，这样就修改文件中的内容了。自认为这种方法比在终端中直接修改要好一点


- 然后我们打开这个文件，找到 #panel  这个节点，如图：


<center>![](http://img.blog.csdn.net/20151217142124475?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>



然后将 background - color 改成  transparent ，如图：


<center>![](http://img.blog.csdn.net/20151217142147022?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


- 然后我们再在终端中用 root 用户将这个修改之后的文件复制到/usr/share/gnome-shell/theme/gnome-shell.css路径下，然后我们的顶部任务栏就变成了半透明了

<center>![](http://img.blog.csdn.net/20151217142210617?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


