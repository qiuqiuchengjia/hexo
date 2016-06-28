---
title: ' STL之priority_queue（优先队列）'
date: 2016-06-01 17:46:11
tags: [C++,STL,priority_queue,优先队列]
categories: C++
---

- 构造，析构

```cpp
priority_queue() //默认构造函数，生成一个空的排序队列  
  
priority_queue(const queue&);  //拷贝构造函数  
  
priority_queue(const Compare& comp);
//构造生成一个空的priority_queue对象，
//使用comp作为priority_queue的comparison  
  
priority_queue(const value_type* first, const value_type* last); 
//带有两个参数的构造函数，  
//使用默认的Comparison作为第三个参数  
  
priority_queue& operator=(const priority_queue &);   
//赋值运算符重载  
  
c.~priority_queue() //销毁所有元素并释放内存  
```

- ### 常用函数###

```cpp
empty();//判断是否为空  
  
push(Elem e);//队列尾部增加一元素  
  
pop();//队列头部数据出队  
  
top();//返回头部数据  
  
size();//返回栈中元素个数 
```

<!-- more -->

- ### 改变排列顺序###

priority_queue < Type, Container, Functional \>
 如果我们把后面俩个参数缺省的话，优先队列就是大顶堆，
 队头元素最大。在很多时候，我们需要的不一定是最大值，
 也有可能是最小值。这是就需要我们来改变priority_queue中的顺序。
 方法有两种： 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.如果加入优先队列的是基本类型，那么我们就可以这样，我们以int为例：
```cpp
   //注意greater<int> >这之间有一个空格    
priority_queue<int, vector<int>, greater<int> >Q;   
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.对于自定义数据类型的话，我们不论是要改变排序方式，还是不改变都要这样 --  重载 小于( < ) 运算符：
        因为，如果你不重载比较运算符的话，编译器无法比较自定义数据类型的大小关系。然而又因为在priority_queue的内部，只需用到 小于号（<），所以我们只需要重载小于号即可。当然对于自定义数据类型来说，也是必须重载，否则将无法使用priority_queue。重载小于号，我们可以有两种方式，一种用成员函数，一种使用友元函数（这里就不多说了，不会的同学，自己在好好复习复习C++）
        
        
- ### 优先队列的使用范例###

```cpp
#include <queue>  
#include <list>  
#include <cstdio>  
using namespace std;  
/** 
  优先级队列的使用范例 
*/  
int main(){  
    //优先队列默认是使用vector作为容器  
    priority_queue<int> a;  
   // priority_queue<int,list<int>> b;//可以这样定义，但无法使用  
   int i;  
   //压入数据  
   for(i=0;i<10;i++){  
      a.push(i*2-5);  
      //b.push(i);//编译错误  
   }  
   printf("优先队列的大小=%d\n",a.size());  
   while(!a.empty()){  
        printf("%d\n",a.top());  
        a.pop();//出队  
   }  
   putchar('\n');  
    return 0;  
}  
```

- ### 优先队列带比较函数示例（针对结构体）###

下面程序是针对结构体的，对数据的比较是通过对结构体重载operator()。
程序功能是模拟排队过程，每人有姓名和优先级，优先级相同则比较姓名，开始有5个人进入队列，然后队头2个人出队，再有3个人进入队列，最后所有人都依次出队，程序会输出离开队伍的顺序
        
        
```cpp
#include <queue>  
#include <cstring>  
#include <cstdio>  
using namespace std;  
/** 
  结构体 
*/  
struct Node{  
    char szName[20];//人名  
    int  priority;//优先级  
    //构造函数  
    Node(int nri, char *pszName){  
        strcpy(szName, pszName);  
        priority = nri;  
    }  
};  
/** 
  结构体的比较方法 改写operator() 
*/  
struct NodeCmp{  
//重写operator()方法,注意这里重写的写法，operator()(参数1，...)  
    bool operator()(const Node &na, const Node &nb){  
        if (na.priority != nb.priority)  
            return na.priority <= nb.priority;  
        else  
            return strcmp(na.szName, nb.szName) > 0;  
    }  
};  
/** 
  打印节点 
*/  
void PrintfNode(Node na){  
    printf("%s %d\n", na.szName, na.priority);  
}  
int main(){  
    //优先级队列默认是使用vector作容器，底层数据结构为堆。  
    priority_queue<Node, vector<Node>, NodeCmp> a;  
  
    //有5个人进入队列  
    a.push(Node(5, "小谭"));  
    a.push(Node(3, "小刘"));  
    a.push(Node(1, "小涛"));  
    a.push(Node(5, "小王"));  
  
    //队头的2个人出队  
    PrintfNode(a.top());  
    a.pop();  
    PrintfNode(a.top());  
    a.pop();  
    printf("--------------------\n");  
  
    //再进入3个人  
    a.push(Node(2, "小白"));  
    a.push(Node(2, "小强"));  
    a.push(Node(3, "小新"));  
  
    //所有人都依次出队  
    while (!a.empty()){  
        PrintfNode(a.top());  
        a.pop();  
    }  
    return 0;  
}  
```
        
      



 
