---
title: STL容器总结之stack和queue
date: 2016-06-01 17:42:28
tags: [C++,STL,stack,queue]
categories: C++
---

- stack是一个比较简单的容器，它的使用也很简单，stack是LIFO容器，就是后进先出，最后添加进去的元素，第一个取出来


- ### stack初始化###

```cpp
std::stack<int> first;  
  
std::stack<int> second(first);  
  
std::stack<int, std;:vector<int>> third; //使用vector初始化stack  
```


- ### stack常用方法###

```cpp
empty();//判断是否为空  
  
push(Elem e);//栈顶压入一元素  
  
pop();//弹出栈顶元素  
  
top();//返回栈顶元素  
  
size();//返回栈中元素个数  
```

<!-- more -->

- queue是一个比较简单的容器，它的使用也很简单，stack是先进先出容器，最先加进去的元素最先出来

- ### queue常用方法###

```cpp
push(x) //将x压入队列的末端  
  
pop() //弹出队列的第一个元素(队顶元素)，注意此函数并不返回任何值  
  
front() //返回第一个元素(队顶元素)  
  
back() //返回最后被压入的元素(队尾元素)  
  
empty() //当队列为空时，返回true  
  
size() //返回队列的长度  
```