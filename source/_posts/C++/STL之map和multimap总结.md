---
title: ' STL之map和multimap总结'
date: 2016-06-01 18:40:49
tags: [C++,STL,map,multimap]
categories: C++
---

- map和multimap都是有序关联容器，所有元素都会根据元素的键值自动被排序,包含具有唯一键的键值对。键使用比较函数Compare比较来进行排序。搜索，删除和插入操作具有对数复杂性。map和multimap通常实现为红黑树。multimap相对map来说能够允许重复值的存在


- ### 构造，赋值，析构###

```cpp
map c //默认构造函数；创建一个空map/multimap  
  
map c(op) //创建一个空map/multimap，并以op原则作为排序准则  
  
map c(c2) //复制构造函数；创建一个新的map/multimap
//作为c2的副本（所有元素都被复制）  
  
map c = c2 //复制构造函数；创建一个新的map
//作为c2的副本（所有元素都被复制）  
  
map c(rv) //移动构造函数；使用右值对象rv创建一个新map/multimap  
  
map c = rv //移动构造函数；使用右值对象rv创建一个新map/multimap  
  
map c(beg,end) //创建一个map/multimap，并使用
//beg到end范围内的值进行初始化  
  
map c(beg,end,op) //创建一个map/multimap，
//并使用beg到end范围内以op原则排序后的值进行初始化  
  
map c(initlist) 
//创建一个map/multimap，并使用初始化列表进行初始化  
  
map c = initlist 
//创建一个map/multimap，并使用初始化列表进行初始化  
  
c.~map() //销毁所有元素并释放内存  
```

<!-- more -->

- 在这里map可能是如下的一种：

```cpp
map<Key,Val> //以less<>为排序准则的map  
  
map<Key,Val,Op> //以op为排序准则的map  
  
multimap<Key,Val> //以less<>为排序准则的multimap  
  
multimap<Key,Val,Op> //以op为排序准则的multimap  
```

- ### 非变动性操作###

```cpp
c.key_comp() //返回比较准则  
  
c.value_comp() //返回对值比较的标准 (与key_comp()相同)  
  
c.empty() //判断容器是否为空，与size()==0相同，但可能更快  
  
c.size() //返回当前元素数量  
  
c.max_size() //返回可容纳的元素最大数量  
  
c1 == c2 //判断c1与c2是否相等  
  
c1 != c2 //判断c1与c2是否不相等，等同于!(c1==c2)  
  
c1 < c2 //判断c1是否小于c2  
  
c1 > c2 //判断c1是否大于c2  
  
c1 <= c2 //判断c1是否小于等于c2  
  
c1 >= c2 //判断c1是否大于等于c2  
```


- ### 特殊查询操作###

```cpp
c.count(key) //返回键值为key的元素个数  
  
c.find(key) //返回第一个键值为key的位置，若没找到返回end()  
  
c.lower_bound(key) //返回键值为key的第一个可插入的
//位置，也就是键值 >= key的第一个元素位置  
  
c.upper_bound(key) //返回键值为key的最后一个可插入的位置，
//也就是键值 > key的第一个元素位置  
  
c.equal_range(key) //返回键值为key的可插入的第一个位置和最后一个位置的区间，
//也就是键值 == key的元素区间  
```

- ### 赋值### 

```cpp
c = c2 //将c2所有元素赋值给c  
  
c = rv //将右值对象rv的所有元素移动赋值给c  
  
c = initlist //使用初始化列表进行赋值  
  
c1.swap(c2) //交换c1和c2的数  
  
swap(c1,c2) //交换c1和c2的数  
```

- ### 迭代器相关函数###

```cpp
c.begin() //返回一个双向迭代器，指向第一个元素  
  
c.end() //返回一个双向迭代器，指向最后一个元素  
  
c.cbegin() //返回一个双向常迭代器，指向第一个元素  
  
c.cend() //返回一个双向常迭代器，指向最后一个元素  
  
c.rbegin() //返回一个逆向迭代器，指向逆向迭代的第一个元素  
  
c.rend() //返回一个逆向迭代器，指向逆向迭代的最后一个元素  
  
c.crbegin() //返回一个逆向常迭代器，指向逆向迭代的第一个元素  
  
c.crend() //返回一个逆向常迭代器，指向逆向迭代的最后一个元素  
```

- ### 插入和移除元素###

```cpp
c.insert(val) //插入一个val的副本，返回新元素位置（对map来说不论成功与否）  
  
c.insert(pos,val) //插入一个val副本，返回新元素位置（pos应该是插入的搜寻起点）  
  
c.insert(beg,end) //将范围beg到end的所有元素的副本插入到c（无返回值）  
  
c.insert(initlist) //插入初始化列表的所有元素的副本（无返回值）  
  
c.emplace(args...) //插入一个使用args初始化的元素副本，返回新元素位置（对map来说不论成功与否）  
  
c.emplace_hint(pos,args...) //插入一个使用args初始化的元素副本，返回新元素
//位置（pos应该是插入的搜寻起点）  
  
c.erase(val) //移除所有与val值相等的元素，并返移除的元素个数  
  
c.erase(pos) //移除迭代器位置的元素，并返回下个元素的位置  
  
c.erase(beg,end) //移除beg到end范围内的所有元素，并
//返回下个元素的位置  
  
c.clear() //移除所以元素，清空容器  
```


- ### 键值对转递###

```cpp
//使用value_type  
std::map<std::string,float> coll;  
  
coll.insert(std::map<std::string,float>::value_type("otto",22.3));  
  
//使用pair<>  
std::map<std::string,float> coll;  
  
coll.insert(std::pair<std::string,float>("otto",22.3));  
  
//使用make_pair()  
std::map<std::string,float> coll;  
  
coll.insert(std::make_pair("otto",22.3));  
```

- 当作关联数组使用

```cpp
c[key] //返回一个指向键值为key的元素的引用，如果不存在就插入这个元素  
  
c.at(key) //返回一个指向键值为key的元素的引用  
```


- ### 实例：map集合的插入和遍历###

```cpp
#include <map>  
#include <string>  
#include <iostream>  
#include <stdio.h>  
#include <algorithm>  
using namespace std;  
/** 
   map集合的插入和遍历 
*/  
int main(){  
    map<string,int> coll;  
    coll.insert(pair<string,int>("1",12));  
    coll.insert(pair<string,int>("2",10));  
    coll.insert(pair<string,int>("3",11));  
     for(map<string,int>::iterator
     it=coll.begin();it!=coll.end();it++){  
         int len=distance(coll.begin(),it);  
         printf("元素在集合中的位置=%d\n",len);  
         pair<string,int> p=*it;  
         printf("元素的值=%d\n",p.second);  
         printf("元素的键=");  
         cout<<p.first<<endl;  
         printf("\n");  
     }  
    return 0;  
}  
```