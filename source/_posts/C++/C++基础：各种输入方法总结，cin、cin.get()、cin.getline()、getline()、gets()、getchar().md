---
title: C++基础：各种输入方法总结，cin、cin.get()、cin.getline()、getline()、gets()、getchar()
date: 2016-06-01 18:21:27
tags: C++
categories: C++
---

- 输入原理简述：程序的输入都建有一个缓冲区，即输入缓冲区。每次输入过程是这样的，当一次键盘输入结束时会将输入的数据存入输入缓冲区

- ### cin###

根据cin>>sth 中sth的变量类型读取数据，这里变量类型可以为int，float,char,char*,string等诸多类型。这一输入操作，在遇到结束符（Space、Tab、Enter）就结束，且对于结束符，并不保存到sth中

```cpp
void test_input(){  
    char ch1[10],ch2[10];  
    cout<<"输入两个字符串："<<endl;  
    cin>>ch1;  
    cin>>ch2;  
    cout<<"两个字符串分别为："<<endl;  
    cout<<ch1<<endl;  
    cout<<ch2<<endl;  
}  
```
![](http://img.blog.csdn.net/20140510165644250)

<!-- more -->

- ### cin.get(字符数组名，接收长度，结束符)###

其中结束符意味着遇到该符号结束字符串读取,默认为ENTER，读取的字符个数最多为（长度-1），因为最后一个为"\n"。要注意的是，cin.get()操作遇到结束符停止读取，但并不会将结束符从缓冲区丢弃


- ### cin.getline(字符数组名，接收长度，结束符)###

其用法与cin.get(字符数组名，接收长度，结束符)极为类似。cin.get()当输入的字符串超长时，不会引起cin函数的错误，后面若有cin操作，会继续执行，只是直接从缓冲区中取数据。但是cin.getline()当输入超长时，会引起cin函数的错误，后面的cin操作将不再执行。如下代码：

```cpp
void test_input(){  
    char ch1,ch2[10];  
    cout<<"请输入字符串："<<endl;  
    cin.getline(ch2,6);//在不遇到结束符的情况下，最多可接收6-1=5个字符到ch2中  
    cin>>ch1;  
    cout<<ch2<<endl;  
    cout<<ch1<<"\n"<<(int)ch1<<endl;  
}  
```

测试：如下图，输入zifuchuan[Enter]，长度大于最大长度5，就会导致cin函数错误，其后既没有像cin.get()一样直接从输入缓冲区直接读数据，也没有从键盘输入。所以此处可以注意，考虑在用cin.getline()时，适度设置其最大接受长度大一点

![](http://img.blog.csdn.net/20140511001809093)

- ### getline(istream is,string str,结束符)###

同样，此处结束符为可选参数（默认依然为Enter）。然而，getline()与前面的诸多存在的差别在于，它string库函数下，而非前面的istream流，所有调用前要在前面加入#include<string>。与之对应这一方法读入时第二个参数为string类型，而不再是char*，要注意区别。另外，该方法也不是遇到空格就结束输入的

```cpp
void test_input(){  
    string str;  
    cout<<"请输入string内容："<<endl;  
    getline(cin,str,'a');  
    cout<<str<<endl;  
}  
```

![](http://img.blog.csdn.net/20140511001924250)
![](http://img.blog.csdn.net/20140511001928703)

通过以上第二个图还可以看出，这一方法只有在遇到结束符（此处为‘a’）才结束，对空格甚至回车都不敏感


- ### gets(char *ch)###

gets()方法同样接受一个字符串，但是与getline()不同，它的参数为char*，而不是string，另外若定义char ch[n]，长度为n，则样注意输入的字符串长度不要大于n，否则会报错。同样gets()对空格也不敏感

```cpp
void test_input(){  
    char ch[10];  
    cout<<"请输入char*内容："<<endl;  
    gets(ch);  
    cout<<ch<<endl;  
}  
```

![](http://img.blog.csdn.net/20140511002001531)
![](http://img.blog.csdn.net/20140511002005640)

好吧，就到这里吧，其实还有getchar()、getch()等，这里就不一一赘述了