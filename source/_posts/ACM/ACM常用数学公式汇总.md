---
title: ' ACM常用数学公式汇总'
date: 2016-06-01 18:48:36
tags: [ACM,数学公式]
categories: ACM
---

- 扇形面积
  S=1/2×弧长×半径，S扇=（n/360）πR²

- 三角函数定义

  <center>![](http://7xstki.com1.z0.glb.clouddn.com/%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F.png)</center>
  
- 三角函数特殊角

<center>![](http://img.blog.csdn.net/20160524155156479)</center>

<!-- more -->

- 正弦定理

对于边长为a,b和c而相应角为A,B和C的三角形，有：
sinA / a = sinB / b = sinC/c
也可表示为：a/sinA=b/sinB=c/sinC=2R
变形：a=2RsinA,b=2RsinB,c=2RsinC
其中R是三角形的外接圆半径。

- 余弦定理

对于边长为a、b、c而相应角为A、B、C的三角形，有：
a² = b² + c²- 2bc·cosA
b² = a² + c² - 2ac·cosB
c² = a² + b² - 2ab·cosC

- 正切定理
对于边长为a,b和c而相应角为A,B和C的三角形，有：
(a+b)/(a-b) = tan[(A+B)/2]/tan[(A-B)/2]

- 三角形面积
    s=a*b*sinC/2

- 多边形面积

计算几何，求多边形的面积，实例：[传送门](http://blog.csdn.net/qq_26891045/article/details/51493840)

只要记住这个公式：

<center>![](http://acm.hdu.edu.cn/data/images/2528-2.jpg)</center>

如果逆时针给出点坐标，值为正，
如果顺时针给出点坐标，值为负。
当i=n-1  i+1就是n所代表的点就是第一个点。

- 圆的摆线留下的面积

摆线留下的面积等于圆的三倍  实例：[传送门](http://blog.csdn.net/qq_26891045/article/details/51407311)

- 点到直线的距离(直线AX+BY+C=0)：

<center>![](http://img.blog.csdn.net/20160524203038020)</center>

- 两平行线之间的距离(直线AX+BY+C=0)：

<center>![](http://img.blog.csdn.net/20160524203059141)</center>

- 两直线的夹角(直线AX+BY+C=0)：

<center>![](http://img.blog.csdn.net/20160524203250663)</center>

- 三角形重心

设某个三角形的重心为G（cx，cy），顶点坐标分别为A1（x1，y1），A2（x2，y2），A3（x3，y3），则有cx = (x1 + x2 + x3)/3.同理求得cy

- 多边形重心

cx = (∑ cx[i]*s[i]) / （3*∑s[i]）;  cy = (∑ cy[i]*s[i] ) / （3*∑s[i]）;其中（cx[i], cy[i]）, s[i]分别是所划分的第i个三角形的重心坐标和面积   示例：[传送门](http://blog.csdn.net/qq_26891045/article/details/51464782)

- 锐角三角形判定公式
  锐角三角形计算公式：a*a+b*b>c*c

- 向量之间的夹角

<center>![](http://img.blog.csdn.net/20160525135016850)</center>

- 三角形的面积

<center>![](http://img.blog.csdn.net/20160525133627281)</center>

- 多边形的面积

<center>![](http://img.blog.csdn.net/20160525133815657)
或
![](http://img.blog.csdn.net/20160525133820958)</center>

- 向量叉积判断多边形凹凸

对于连续的三个点p0,p1,p2，另向量a=p1-p0，b=p2-p1若是凸多边形，那么b相对于a一定是向逆时针方向旋转的
判断两向量的旋转方向，可以使用向量的叉积  a×b ＝ x1×y2 － x2×y1

a×b > 0 b在a的逆时针方向
a×b = 0 b平行于a（共线）
a×b < 0 b在a的顺时针方向
要注意的是，对于最后一个点pn，还要和起始的两个点p0,p1判断一次
