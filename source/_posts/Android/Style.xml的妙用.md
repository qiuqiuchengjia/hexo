---
title: Style.xml的妙用
date: 2016-06-01 15:55:46
tags: [Style,Android]
categories: Android
---

- Style.xml的妙用

<font color='RED'>Style.xml之于Android犹如css之于Jsp</font>

- 妙用

```xml
<?xml version="1.0" encoding="utf-8"?>  
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"  
    android:layout_width="match_parent"  
    android:layout_height="match_parent"  
    android:orientation="vertical" >  
  
    <TextView  
        android:id="@+id/sensor"  
        android:layout_width="match_parent"  
        android:layout_height="match_parent" />  
  
</LinearLayout>  

```

这样的布局文件是很正常的。但是不如这样好

<!-- more -->



```xml
<?xml version="1.0" encoding="utf-8"?>  
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"  
    style="@style/all_match"  
    android:orientation="vertical" >  
  
    <TextView  
        android:id="@+id/sensor"  
        style="@style/all_fill" />  
  
</LinearLayout>  
```

省时省力，一眼还能看出是什么布局方式。只需要在Style.xml 中添加 这些代码即可

```xml
<style name="all_fill" >  
       <item name="android:layout_width">fill_parent</item>  
       <item name="android:layout_height">fill_parent</item>  
   </style>  
   <style name="all_match" >  
       <item name="android:layout_width">match_content</item>  
       <item name="android:layout_height">match_content</item>  
   </style>  
   <style name="width_fill" >  
       <item name="android:layout_width">fill_parent</item>  
       <item name="android:layout_height">match_content</item>  
   </style>  
   <style name="height_fill" >  
       <item name="android:layout_width">match_content</item>  
       <item name="android:layout_height">fill_parent</item>  
   </style>  

```