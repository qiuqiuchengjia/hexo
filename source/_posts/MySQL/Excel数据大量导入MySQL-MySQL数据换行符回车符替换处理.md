---
title: Excel数据大量导入MySQL--MySQL数据换行符回车符替换处理
date: 2016-06-01 15:17:41
tags: [Excel,MySQL]
categories: MySQL
photos:
- http://img.blog.csdn.net/20160415165437777?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center
---

### 在Excel中可以大量数据导入MySQL中###

- 首先打开需要导入的表格，然后另存为，选择文本文件(制表符分隔)

<center>![](http://img.blog.csdn.net/20160415165437777?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


<!-- more -->

- 得到一个文本文件

<center>![](http://img.blog.csdn.net/20160415165625530?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)</center>


- 然后打开phpmyadmin，执行下面语句（需要自己根据实际情况修改表名）:

```sql
load data local infile 'D:\data.txt' into table exceltomysql fields terminated by '\t';  
```


- 导入的文件有可能会有换行和回车，对我们操作数据库带来了不便，所以我们执行下面语句来替换换行和回车符

```sql
UPDATE table_name set field_name=REPLACE(REPLACE(field_name,char(10),'<br>'),char(13),'<br>'); 
```
 
  制表符  char(9)
  换行符  char(10)
  回车符  char(13)