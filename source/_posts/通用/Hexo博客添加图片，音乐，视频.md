---
title: Hexo博客添加图片，音乐，视频
date: 2016-06-07 14:37:58
tags: [hexo]
categories: 通用
---

- 插入外部链接图片

```markdown
![“图片描述”](“图片地址”)
```

- 添加本地图片

在\hexo\source目录下新建文件夹，命名为images或者其他你喜欢的名字，然后编辑你的md博文，插入下面的代码样式：

```markdown
![“图片描述”](/images/你的图片名字.JPG)
```

- 插入音乐

比如网易云音乐，找到喜欢的歌曲，点击分享按钮，把里面的代码复制下来，直接粘贴到博文中即可

```html
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 
	src="http://music.163.com/outchain/player?type=2&id=25706282&auto=0&height=66">
</iframe>
```

<center>
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 
	src="http://music.163.com/outchain/player?type=2&id=25706282&auto=0&height=66">
</iframe>	
</center>

- 插入视频

```html
Idina Menze和Caleb Hyles激情对唱Let It Go：
<iframe 
	height=498 width=510 
	src="http://player.youku.com/embed/XNjcyMDU4Njg0" 
	frameborder=0 allowfullscreen>
</iframe>
```

<center>
Idina Menze和Caleb Hyles激情对唱Let It Go：
<iframe 
	height=498 width=510 
	src="http://player.youku.com/embed/XNjcyMDU4Njg0" 
	frameborder=0 allowfullscreen>
</iframe>
</center>

<!-- more -->

参考博客：[传送门](http://blog.wleyuan.me/2015/07/18/Hexo-AddSoundPicMovie/)