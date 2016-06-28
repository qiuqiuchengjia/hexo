---
title: STL容器总结之deque
date: 2016-06-01 17:26:50
tags: [C++,STL,deque]
categories: C++
---

- deque双向队列是一种双向开口的连续线性空间，可以高效的在头尾两端插入和删除元素，deque在接口上和vector非常相似，下面列出deque的常用成员函数


- ### 构造，析构###

```cpp
deque<Elem> c //创建一个空的deque  
  
deque<Elem> c1(c2) //赋值deque  
  
deque<Elem> c(n) 
//创建deque，含有n个数据，数据均有缺省结构函数产生  
  
deque<Elem> c(n,Elem) //创建一个含有n个Elem拷贝的deque  
  
deque<Elem> c(begin,end) //创建一个以[begin,end)区间的deque  
//利用int数组iArray，创建一个deque对象d  
int iArray[]={1,2,3,4,5,6,7};  
deque<int> d(iArray, iArray+7);  
  
c~deque<Elem>() //销毁所有数据，并释放内存  
```

- ### 赋值###

```cpp
c.assign(begin,end) //将[begin,end)区间中的数据赋值给c  
  
c.assign(n,Elem) //将n个Elem的拷贝赋值给c  
  
c.swap(c2) //将c2和c的元素互换  
```

<!-- more -->

- ### 数据访问###

```cpp
c.at(index) //返回索引index所指定的数据，如果index越界，抛出out_of_ranga  
  
c[index] //返回容器指定位置的元素值  
  
c.front() //返回第一个数据  
  
c.back() //返回最后一个数据  
  
c.begin() //返回指向第一个元素的迭代器  
  
c.end() //返回指向最后一个数据的下一个位置的迭代器  
  
c.rbegin() 
//返回逆向队列的第一个数据,也就是返回容器中倒数第一个元素的迭代器  
  
c.rend() 
//返回指向逆向队列的最后一个数据的下一个位置的迭代器，  
//也就是返回容器中倒数最后一个元素之后的迭代器  
```

- ### 插入数据###

```cpp
c.push_back(Elem) //在尾部加入一个数据  
  
c.push_front(Elem) //在头部插入一个数据  
  
c.insert(pos,Elem) //在pos位置插入一个Elem拷贝，返回新数据的位置  
  
c.insert(pos,n,Elem) //在pos位置插入n个Elem数据，无返回值  
  
c.insert(pos,begin,end)
//在pos位置插入在[begin,end)区间的数据，无返回值
```

- ### 删除数据###

```cpp
c.pop_back() //删除最后一个数据  
  
c.pop_front() //删除头部一个数据  
  
c.erase(pos) //删除pos位置的数据，返回下一个数据的位置  
  
c.erase(begin,end) 
//删除[begin,end)区间的数据，返回下一个数据的位置  
```

- ### 其他操作###

```cpp
c.empty() //判断容器是否为空  
  
c.max_size() //返回容器中最大数据的数量  
  
c.resize(num) //重新指定队列的长度  
  
c.size() //返回容器中实际数据的个数  
  
c1.swap(c2) //将c1和c2元素互换  
swap(c1,c2) //同上  
```

- deque的实现比较复杂，内部会维护一个map（注意！不是STL中的map容器）即一小块连续的空间，该空间中每个元素都是指针，指向另一段（较大的）区域，这个区域称为缓冲区，缓冲区用来保存deque中的数据。因此deque在随机访问和遍历数据会比vector慢。具体的deque实现可以参考《STL源码剖析》，当然此书中使用的SGI STL与VS2008所使用的PJ STL的实现方法还是有区别的。下面给出了deque的结构图：

![](http://hi.csdn.net/attachment/201111/8/0_13207172099IU6.gif)

- ### 示例###

```cpp
#include <deque>  
#include <cstdio>  
#include <algorithm>  
using namespace std;  
/** 
  双端队列queue 
*/  
int main(){  
    //创建一个有20个元素的queue队列  
    deque<int> ideq(20);  
    deque<int>::iterator pos;  
    int i;  
    //使用assign()赋值  assign在计算机中就是赋值的意思  
    for (i = 0; i < 20; ++i)  
        ideq[i] = i;  
  
    //输出deque  
    printf("输出deque中数据:\n");  
    for (i = 0; i < 20; ++i)  
        printf("%d ", ideq[i]);  
    putchar('\n');  
  
    //在头尾加入新数据  
    printf("\n在头尾加入新数据...\n");  
    ideq.push_back(100);  
    ideq.push_front(i);  
  
    //输出deque  
    printf("\n输出deque中数据:\n");  
    for (pos = ideq.begin(); pos != ideq.end(); pos++)  
        printf("%d ", *pos);  
    putchar('\n');  
  
    //查找  
    const int FINDNUMBER = 19;  
    printf("\n查找%d\n", FINDNUMBER);  
    pos = find(ideq.begin(), ideq.end(), FINDNUMBER);  
    if (pos != ideq.end())  
        printf("find %d success\n", *pos);  
    else  
        printf("find failed\n");  
  
    //在头尾删除数据  
    printf("\n在头尾删除数据...\n");  
    ideq.pop_back();  
    ideq.pop_front();  
  
    //输出deque  
    printf("\n输出deque中数据:\n");  
    for (pos = ideq.begin(); pos != ideq.end(); pos++)  
        printf("%d ", *pos);  
    putchar('\n');  
    return 0;  
}  
```

运行结果如下：

![](http://hi.csdn.net/attachment/201111/8/0_1320717228QV1x.gif)

- 另外要注意一点。对于deque和vector来说，尽量少用erase(pos)和erase(beg,end)。因为这在中间删除数据后会导致后面的数据向前移动，从而使效率低下。
