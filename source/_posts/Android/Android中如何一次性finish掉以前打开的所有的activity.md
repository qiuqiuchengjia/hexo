---
title: Android中如何一次性finish掉以前打开的所有的activity
date: 2016-06-01 14:29:28
tags: [Android,Activity]
categories: Android 
---

```java
public class ActivityManagerApplication extends Application {  
  
    private static Map<String,Activity> destoryMap = new HashMap<>();  
  
    private ActivityManagerApplication() {  
    }  
  
    /** 
     * 添加到销毁队列 
     * 
     * @param activity 要销毁的activity 
     */  
  
    public static void addDestoryActivity(Activity activity,String activityName) {  
        destoryMap.put(activityName,activity);  
    }  
    /** 
    *销毁指定Activity 
    */  
    public static void destoryActivity(String activityName) {  
       Set<String> keySet=destoryMap.keySet();  
        for (String key:keySet){  
            destoryMap.get(key).finish();  
        }  
    }  
}  
```

<!-- more -->