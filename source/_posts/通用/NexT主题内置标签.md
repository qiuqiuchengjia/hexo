---
title: NexT主题内置标签
date: 2016-06-17 17:38:40
tags: hexo
categories: 通用
photos:
 - http://7xstki.com1.z0.glb.clouddn.com/NexT%E4%B8%BB%E9%A2%98%E5%86%85%E7%BD%AE%E6%A0%87%E7%AD%BE.jpg
 - http://theme-next.iissnan.com/uploads/tags/blockquote-center.png
---

- 具体用法参考NexT文档 [传送门](http://theme-next.iissnan.com/tag-plugins.html)

### 文本居中的引用###

此标签将生成一个带上下分割线的引用，同时引用内文本将自动居中。 文本居中时，多行文本若长度不等，视觉上会显得不对称，因此建议在引用单行文本的场景下使用。 例如作为文章开篇引用 或者 结束语之前的总结引用

#### 使用方式####
- HTML方式：使用这种方式时，给 img 添加属性 class="blockquote-center" 即可

- 标签方式：使用 centerquote 或者 简写 cq

> 此标签要求 NexT 的版本在 0.4.5 或以上。 若你正在使用的版本比较低，可以选择使用 HTML 方式

```html
<!-- HTML方式: 直接在 Markdown 文件中编写 HTML 来调用 -->
<!-- 其中 class="blockquote-center" 是必须的 -->
  <blockquote class="blockquote-center">blah blah blah</blockquote>

  <!-- 标签 方式，要求版本在0.4.5或以上 -->
{% centerquote %}blah blah blah{% endcenterquote %}

  <!-- 标签别名 -->
{% cq %} blah blah blah {% endcq %}
```

效果示例:

<center>![](http://theme-next.iissnan.com/uploads/tags/blockquote-center.png)</center>

<!-- more -->

### 突破容器宽度限制的图片###

当使用此标签引用图片时，图片将自动扩大 26%，并突破文章容器的宽度。 此标签使用于需要突出显示的图片, 图片的扩大与容器的偏差从视觉上提升图片的吸引力。 此标签有两种调用方式（详细参看底下示例）：


#### 使用方式####

- HTML方式：使用这种方式时，为 img 添加属性 class="full-image"即可。

- 标签方式：使用 fullimage 或者 简写 fi， 并传递图片地址、 alt 和 title 属性即可。 属性之间以逗号分隔


> 此标签要求 NexT 的版本在 0.4.5 或以上。 若你正在使用的版本比较低，可以选择使用 HTML 方式。
如果要在图片下显示图片的标题，请使用 标签方式 并给定 title 属性


```html
<!-- HTML方式: 直接在 Markdown 文件中编写 HTML 来调用 -->
<!-- 其中 class="full-image" 是必须的 -->
<img src="/image-url" class="full-image" />

    <!-- 标签 方式，要求版本在0.4.5或以上 -->
{% fullimage /image-url, alt, title %}

<!-- 别名 -->
{% fi /image-url, alt, title %}
```

效果示例:

<center><img src="http://theme-next.iissnan.com/uploads/tags/full-image.jpg" class="full-image" /></center>
