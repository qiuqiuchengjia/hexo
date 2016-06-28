---
title: ' STL之set和multiset总结'
date: 2016-06-01 18:28:58
tags: [C++,set,multiset,STL]
categories:
---

- 使用set或multiset之前，必须加入头文件<set>
- Set、multiset都是集合类，差别在与set中不允许有重复元素，multiset中允许有重复元素。
- sets和multiset内部以平衡二叉树实现


- ### 构造，析构###

```cpp
set c  //创建空集合,不包含任何元素  
  
set c(op)  //以op为排序准则，产生一个空的set  
  
set c1(c2)  //复制c2中的元素到c1中  
  
set c(const value_type *first, const value_type* last)  
//复制[first, last)之间元素构成新集合  
  
set c(const value_type *first, const value_type* last,op)  
//以op为排序准则，复制[first, last)之间元素构成新集合。  
  
c.~set()  
//销毁所有元素，释放内存  
  
multiset mc  //创建空集合,不包含任何元素  
  
multiset mc(op)  //以op为排序准则，产生一个空的set  
  
multiset c1(c2)  //复制c2中的元素到c1中  
  
multiset c(const value_type *first, const value_type* last)  
//复制[first, last)之间元素构成新集合  
  
multiset c(const value_type *first, const value_type* last,op)  
//以op为排序准则，复制[first, last)之间元素构成新集合。  
  
c.~set()  //销毁所有元素，释放内存  
```

<!-- more -->


- ### 支持的操作符###

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2set%E5%9B%BE%E7%89%87.png)</center>

- ### 其他函数###

```cpp
c.size() //返回有容器中有多少元素  
  
c.max_size()  //返回容器可以存放的最大数据的个数  
  
int size() const  //返回容器元素个数  
  
bool empty() const  //判断容器是否为空，若返回true，表明容器已空  
```

- ### 增加删除###

```cpp
pair<iterator,bool> insert( x)  //插入元素x  
  
iterator insert(iterator it,x)  //在迭代器it处插入元素x  
  
void insert(const value_type *first,const value_type *last) 
//插入[first, last)之间元素  
  
iterator erase(iterator it)  //删除迭代器指针it处元素  
  
iterator erase(iterator first,iterator last)  
//删除[first, last)之间元素  
  
size_type erase(const Key& key)  //删除元素值等于key的元素  
  
c.clear()  //移除所有元素，使得容器变为空  
```

- set和multiset提供的这两个插入函数返回值有所不同
set提供的插入函数

```cpp
pair<iterator,bool> insert(const value_type& elem);  
  
iterator  insert(iterator pos_hint, const value_type& elem);  
```

- multiset提供的插入函数：

```cpp
iterator  insert(const value_type& elem);  
  
iterator  insert(iterator pos_hint, const value_type& elem);  
```

- ### 迭代器相关函数###

```cpp
iterator begin()  //返回首元素的迭代器指针  
  
iterator end()  //返回尾元素的迭代器指针  
  
reverse_iterator rbegin()  //返回尾元素的逆向迭代器指针  
  
reverse_iterator rend()  //返回首元素前一个位置的迭代器指针  
```

- ### 查找###

```cpp
const_iterator lower_bound(const Key& key)  //返回容器中大于等于key的迭代器指针  
  
const_iterator upper_bound(const Key& key)  //返回容器中大于key的迭代器指针  
  
int count(const Key& key) const  
//返回容器中元素等于key的元素的个数  
  
s.equal_range(elem)  
//返回 elem 可以安插的第一个位置和最后一个位置，
//也就是(元素值 == elem) 的元素区间  
  
//因为 set 不允许重复，面 multiset 允许重复，
//所以他们的 insert 操作有不有同的返回值  
//set 提供的接口  
pair<iterator, bool> insert(const value_type& elem); 
//返回 pair<>  
//因为 set 不允许元素重复，所以如果插入相同的元素，将会返回失败。  
//Pari 的 secode 成员表示插入是否成功。  
//Pair 的 first 成员返回新元素的位置。  
  
const_iterator find(const Key& key) const  
//查找功能，返回元素值等于key的迭代器指针  
```

- ### 赋值###

```cpp
c1==c2  //将c2所有的元素赋给c1  
  
void swap(set& s)  //交换集合元素  
  
void swap(multiset& s)  //交换多集合元素  
```

- ### 实例###

```cpp
#include <cstdio>  
#include <iostream>  
#include <stdio.h>  
#include <string>  
#include <set>  
using namespace std;  
struct haha{  
    int a,b;  
    char s;  
    //重写了operator方法  
    friend bool operator<(struct haha a,struct haha b){  
        return a.s<b.s;  
    }  
};  
struct compare//自定义排序方式  
{  
    bool operator ()(string s1,string s2)  
    {  
        return s1>s2;  
    }
    //自定义一个仿函数  
};  
/** 
  用来打印set集合的元素 
*/  
void printSet(set<int>s){  
    set<int>::iterator i;  
    printf("集合元素=");  
    for(i=s.begin(); i!=s.end(); i++)  
        printf("%d ",*i);  
    cout<<endl;  
}  
int main(){  
    /***************set集合元素插入实例****************************/  
    printf(" /***************set集合元素插入实例*****
    ***********************/\n");  
        set<int> s1; //创建空的set对象，元素类型为int，  
        for (int i = 0; i < 5; i++)  
          s1.insert(i*10);  
        //打印集合元素  
        printSet(s1);  
        cout<<"s1再次插入20"<<endl;;  
        if (s1.insert(20).second)//再次插入20  
            cout<<"插入成功！"<<endl;  
        else  
            cout<<"插入失败！"<<endl;  
        cout<<"s1再次插入50"<<endl;  
        if (s1.insert(50).second){  
            cout<<"插入成功！"<<endl;  
            printSet(s1);  
        }  
        else  
            cout<<"插入失败！"<<endl;  
        pair<set<int>::iterator, bool> p;  
        p = s1.insert(60);  
        if (p.second){  
            cout<<"插入成功!"<<endl; printSet(s1);  
       printf("60插入的位置=%d\n",distance(s1.begin(),s1.end()));  
        }  
        else  
            cout<<"插入失败!"<<endl;  
  
  
     /***************set集合删除特定值实例***********
     *****************/  
     printf("/***************set集合删除特定值实例*****
     ***********************/\n");  
     printf("原始集合s1\n");  
     printSet(s1);  
    while (!s1.empty()){  
       cout <<" "<< *s1.begin();  
       //删除集合开头的元素  
       s1.erase(s1.begin());  
    }  
    printf("\n删除之后的元素\n");  
    if(s1.size()==0){  
       printf("集合为空\n");  
    }else{  
       printSet(s1);  
    }  
  
    /***************set集合结构体使用实例********
    ********************/  
    printf("\n/***************set集合结构体使用实例*****
    ***********************/\n");  
    set<struct haha>element;  
    struct haha a,b,c,d,t;  
    a.a=1; a.s='b';  
    b.a=2; b.s='c';  
    c.a=4; c.s='d';  
    d.a=3; d.s='a';  
    element.insert(d);  
    element.insert(b);  
    element.insert(c);  
    element.insert(a);  
    set<struct haha>::iterator it;  
    for(it=element.begin(); it!=element.end();it++)  
        cout<<(*it).a<<" ";  
    cout<<endl;  
    for(it=element.begin(); it!=element.end();it++)  
        cout<<(*it).s<<" ";  
}  
```

运行结果：

<center>![](http://img.blog.csdn.net/20160523221836216)</center>


