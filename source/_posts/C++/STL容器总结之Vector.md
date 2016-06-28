---
title: STL容器总结之Vector
date: 2016-06-01 16:45:37
tags: [STL,C++,Vector]
categories: C++
---

- vector 是一种序列容器，是对大小可变数组的封装

![](http://img.blog.csdn.net/20160406151211233)

数组中的元素是连续存储的，所以除了能够通过迭代器访问外，还可以通过常规的指针偏移量访问元素。换句话说，可以将指向 vector 元素的指针传入以指向数组元素的指针作为参数的函数。

vector 会在需要时自动调整所占内存的大小。与对应的静态数组相比，vector 所占的内存通常要更多，因为它还分配了额外的内存以应对将来可能的扩张。于是，vector 就不必在每次插入元素时都重新分配一次内存了，除非这块预留的内存用尽。已分配内存的总大小可以通过 capacity() 函数查询。所占的额外的内存可以通过调用 shrink_to_fit() 返还给系统。

从性能方面考虑，内存重分配操作的代价通常很大。如果事先知道元素个数，可以使用 reserve() 函数消除重新分配操作。
针对 vector 的各种常见操作的复杂度（效率）如下：
随机访问 - 常数 O(1)
在尾部增删元素 - 平摊（amortized）常数 O(1)
增删元素 - 至 vector 尾部的线性距离 O(n)


- ### 头文件及构造，析构，复制###

头文件

```cpp
#include <vector>       //头文件包含    
using namespace std;  //或者using std::vector;   
```

<!-- more -->

   构造，复制，析构

```cpp
vector<int>v1;              //空的vector，元素类型为int，执行的是默认初始化    
    
vector<int>v2(v1);   //拷贝覆盖，v2与v1中元素个数、值都相同    
    
vector<int>v3=v1;   //同上    
    
vector<int>v4(5,3);  //v4包含了5个重复元素，元素值为3    
    
vector<int>v5(10);  //v5包含10个重复元素，执行的是默认初始化    
    
//列表初始化，是C++11提供的新标准    
vector<int>v6{1,2,3,4}; //v6包含4个元素，其值为{...}中的元素    
    
vector<int>v7={1,2,3,4};    //同上    
    
c.~vector() //销毁所有元素并释放内存   
```


- ### 非变动性操作###

```cpp
c.empty() //判断容器是否为空，与size()==0相同，但可能更快  
  
c.size() //返回当前元素数量  
  
//重新设定容器大小，c.size()会发生改变。  
resize()  
//c.size()<n时，扩大容器，多余的元素追加在末尾，
//执行默认初始化；反之，则将容器截断，保留前面n个元素  
c.resize(n);  
//c.size()<n时，扩大容器，多余的元素追加在末尾，
//其值都为val；反之，则将容器截断，保留前面n个元素  
c.resize(n,val);  
  
c.max_size() //返回可容纳的元素最大数量  
  
c.capacity() //返回在不重新分配的情况下可容纳的元素的最大数量  
  
c.reserve(num) //如果容量不够，进行扩大  
  
c.shrink_to_fit() //按要求根据元素的数量去缩小容量  
  
c1 == c2 //判断c1与c2是否相等  
  
c1 != c2 //判断c1与c2是否不相等，等同于!(c1==c2)  
  
c1 < c2 //判断c1是否小于c2  
  
c1 > c2 //判断c1是否大于c2  
  
c1 <= c2 //判断c1是否小于等于c2  
  
c1 >= c2 //判断c1是否大于等于c2  
```

- ### 赋值###

```cpp
c = c2 //将c2所有元素赋值给c  
  
c = rv //将右值对象rv的所有元素移动赋值给c  
  
c = initlist //使用初始化列表进行赋值  
  
c.assign(initlist) //使用初始化列表进行赋值  
  
c.assign(n,elem) //使用n个elem元素进行赋值  
  
c.assign(beg,end) //使用beg到end范围内的元素进行赋值  
  
c1.swap(c2) //交换c1和c2的数  
  
swap(c1,c2) //交换c1和c2的数  
```

- ### 元素存取###

```cpp
c[idx] //返回索引idx所标示的元素，不进行范围检查  
  
c.at(idx) //返回索引idx所标示的元素，如果越界，抛出range-error  
  
c.front() //返回第一个元素，不检查第一个元素是否存在  
  
c.back() //返回最后一个元素，不检查最后一个元素是否存在  
```

- ### 迭代器相关函数###

```cpp
c.begin() //返回一个随机存取迭代器，指向第一个元素  
  
c.end() //返回一个随机存取迭代器，指向最后一个元素  
  
c.cbegin() //返回一个随机存取常迭代器，指向第一个元素  
  
c.cend() //返回一个随机存取常迭代器，指向最后一个元素  
  
c.rbegin() //返回一个逆向迭代器，指向逆向迭代的第一个元素  
  
c.rend() //返回一个逆向迭代器，指向逆向迭代的最后一个元素  
  
c.crbegin() //返回一个逆向常迭代器，指向逆向迭代的第一个元素  
  
c.crend() //返回一个逆向常迭代器，指向逆向迭代的最后一个元素  
```


- ### 移除和插入元素###

```cpp
c.push_back(elem) //在末尾添加一个elem副本  
  
c.pop_back() //移除末尾元素（但不回传）  
  
c.insert(pos,elem) //在迭代器位置前面插入一个elem副本，并返回新元素的位置  
  
c.insert(pos,n,elem)
//在迭代器位置前面插入n个elem副本，并返回第一个
//新元素的位置；若无新插入值，返回原位置  
  
c.insert(pos,beg,end) //在迭代器位置前面插入范围beg到end的所有元素的副本，
//并返回第一个新元素的位置；若无新插入值，返回原位置  
  
c.insert(pos,initlist) //在迭代器位置前面插入初始化列表的所有元素的副本，
//并返回第一个新元素的位置；若无新插入值，返回原位置  
  
c.emplace(pos,args...) //在迭代器位置前面插入一个使用args初始化的元素副本，
//并返回新元素的位置  
  
c.emplace_back(args...) //在末尾添加一个使用args初始化的元素副本，无返回值  
  
c.erase(pos) //移除迭代器位置的元素，并返回下个元素的位置  
  
c.erase(beg,end) 
//移除beg到end范围内的所有元素，并返回下个元素的位置  
  
c.resize(num) 
//将元素数量设为num（如果size()增大，多出来的元素
//使用默认构造函数创建）  
  
c.resize(num,elem) //将元素数量设为num（如果size()增大，多出来的元素都是elem的副本）  
  
c.clear() //移除所以元素，清空容器  
```

- ### 例子###

```cpp
#include<iostream>  
#include<stdio.h>  
#include<vector>  
using namespace std;  
int main(){  
  //构造两个vector  
  vector<int> c;  
  vector<int> c1;  
  vector<int> c2;  
  //在尾部插入元素  
  c.push_back(1);  
  c.push_back(2);  
  c.push_back(3);  
  c.push_back(4);  
  c.push_back(5);  
  c1=c;//将c赋值给c1  
  c2=c1;//将c1赋值给c2  
  //输出两个集合的大小，验证赋值操作  
  printf("c=%d  c1=%d\n",c.size(),c1.size());  
  c1.clear();//清除所有元素  
  c1.~vector();//将所有元素销毁并释放内存  
  printf("最大容量=%d\n",c.max_size());
  //返回可容纳的元素的最大容量  
  
  for(int i=0;i<c.size();i++){  
    printf("赋值前%d= %d\n",i,c.at(i));  
  }  
  c.assign(1,12);//将c的第一个元素赋值为12  
  for(int i=0;i<c.size();i++){  
    printf("赋值后%d= %d\n",i,c.at(i));  
  }  
  c.push_back(1);  
  c.push_back(2);  
  c.push_back(3);  
  c.push_back(4);  
  c.push_back(5);  
  //返回索引所对应的元素  
  printf("索引是0的元素=%d\n",c[0]);  
  //返回第一个元素  
  printf("第一个元素=%d\n",c.front());  
  //返回最后一个元素  
  printf("最后一个元素=%d\n",c.back());  
  for(int i=0;i<c.size();i++){  
    printf("插入前%d= %d\n",i,c.at(i));  
  }  
  //插入元素,在第一个位置之前  
  c.insert(c.begin(),10);  
  for(int i=0;i<c.size();i++){  
    printf("插入后%d= %d\n",i,c.at(i));  
  }  
  //删除第一个元素  
  c.erase(c.begin());  
   for(int i=0;i<c.size();i++){  
    printf("删除第一个元素%d= %d\n",i,c.at(i));  
  }  
  c.erase(c.begin(),c.begin()+2);  
   for(int i=0;i<c.size();i++){  
    printf("删除第一和二个元素%d= %d\n",i,c.at(i));  
  }  
  
}  
```