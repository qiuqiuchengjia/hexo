---
title: Android仿超级课程表的课程界面设计
date: 2016-06-01 14:31:01
tags: [Android,超级课程表,UI]
categories: Android
photos:
- http://img.blog.csdn.net/20150410180333267
---
<center><img src="http://img.blog.csdn.net/20150410180333267" width="480px" height="700px"/></center>
- 接下来先分析页面布局，从上往下看，第一行是显示标题，第二行是显示时间和周几，使用线性布局，第一列是用来显示节次的，宽度跟后面显示周几的7列不一样，可以用DP来设定；后面7列宽度可以用权重来分配，行的高度也用DP设定。 
接着往下看就是课程表了，第一列用来显示节次，每节次的宽度跟上面行显示月份的格子一致，高度应该与显示周几的格子宽度保持一致，在运行时根据手机屏幕宽度计算显示周几格子的实际宽度来设置，并且想到后面如果要自定义多少节次的话，那么节次这一列布局使用了ListView。 
那么显示一门课程的格子如何实现呢？为了以后不跟实现课表背景图片冲突，这里用到了FrameLayout,一门课程用RelativeLayout实现，背景必须用9图，否则不能随意变更宽高度，通过运行时往FrameLayout里添加RelativeLayout,设置一门课程显示的位置,利用周几和起始节来决定,设置RelativeLayout的marginLeft和marginTop;高度由节次来决定。 
但是一般来说课程表是12节，一般手机屏幕都是显示不完的，必须滑动展示，但是节次里用了ListView，已经包含了ScrollView，而课程是在FrameLayout里实现的，那么必须屏蔽掉ListView的ScrollView，把ListView和FrameLayout用ScrollView包括进来，否则拖动屏幕的时候FrameLayout不会随着滑动

```xml
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent" >

    <ScrollView 
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:scrollbars="none">

        <RelativeLayout 
            android:layout_width="match_parent"
            android:layout_height="match_parent">
        <com.hengye.library.view.util.ListViewNoScroll
            android:id="@+id/titlebar_course_table_listview"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:divider="@null">

        </com.hengye.library.view.util.ListViewNoScroll>

        <FrameLayout
            android:id="@+id/titlebar_course_table_framelayout" 
            android:layout_width="match_parent"
            android:layout_height="match_parent">
            <RelativeLayout
                android:layout_width="wrap_content"
                android:layout_height="200dp"
                android:layout_marginLeft="200dp"
                android:background="@drawable/ic_course_bg_huang_multi"
                android:visibility="gone">

                <TextView
                    android:layout_width="match_parent"
                    android:layout_height="match_parent"
                    android:text="中国近现代史纲要@3-102"
                    android:textColor="@color/white"
                    android:gravity="center"/>  
            </RelativeLayout>       
        </FrameLayout>
        </RelativeLayout>
     </ScrollView>         

</RelativeLayout>
```

<!-- more -->

- 自定义屏蔽了ScrollView的ListView:

```java
public class ListViewNoScroll extends ListView {
    public ListViewNoScroll(Context context) {
        super(context);
    }

    public ListViewNoScroll(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int expandSpec = MeasureSpec.makeMeasureSpec(Integer.MAX_VALUE >> 2,
                MeasureSpec.AT_MOST);
        super.onMeasure(widthMeasureSpec, expandSpec);
    }

}
```

- 课程格子宽高度设置部分代码块：

```java
View courseView = getActivity().getLayoutInflater().inflate(R.layout.titlebar_course_item, null);
        RelativeLayout course = (RelativeLayout) courseView.findViewById(R.id.titlebar_course_item_bg);
        TextView courseNameTextView = (TextView) courseView.findViewById(R.id.titlebar_course_item_tx);
                //用来设置边距        
        int margin1Dp = getResources().getDimensionPixelSize(R.dimen.margin1dp);
        //节次的宽度
        int marginLessonDp = getResources().getDimensionPixelSize(R.dimen.listview_course_table_lesson_margin); 
        int lessonWidth = (mScreenWidth - marginLessonDp) / 7;      
        //9图只能通过背景设置拉伸，如果用src方式设置只会当作普通图片处理
//      course.setBackgroundDrawable(getResources().getDrawable(R.drawable.ic_course_bg_zi_multi));

        //设置课程名字
        courseNameTextView.setText(syllabus.getCourcesName() + " " + syllabus.getLocation());

        //设置一门课程的高度和宽度，一节课的高度与宽度保持一致，把dp转换成像素乘以节数,宽度为屏幕减去节次的宽度后的1/7,因为要显示8列，1列是节次，7列是一周的7天;
        int courseWidth = lessonWidth - margin1Dp * 2;
        int courseHeight = lessonWidth * (endLesson - startLesson + 1) - margin1Dp * 2;
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(courseWidth, courseHeight);
        //设置一门课程显示的位置,利用周几和起始节来决定,设置view的marginLeft和marginTop;
        layoutParams.setMargins(lessonWidth * (day - 1) + marginLessonDp + margin1Dp + margin1Dp, (startLesson - 1) * lessonWidth + margin1Dp, 0, 0);
        //Android4.0以下Margin设置失效解决方法 
        layoutParams.gravity = Gravity.TOP|Gravity.LEFT;
        course.setLayoutParams(layoutParams);   
```