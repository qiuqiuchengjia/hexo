---
title: C++ string类型详解
date: 2016-06-01 16:16:30
tags: [C++,STL,string]
categories: C++
---

- string是非常强大的类型，很好的封装了字符串的操作，有些时候我们可以把string当做字符的容器，string也支持大多数容器操作，下面就列出string类型所支持的所有操作，本文并不是为了讲解string的用法和应用，而是希望作为string类型的参考文档，每个函数皆在注释后有详细说明，需要用时查阅即可

- ### 构造函数###

```cpp
string();//空串  
  
string(size_type length,char ch);
//以length为长度的ch的拷贝（即length个ch）  
  
string(const char *str);//以str为初值 (长度任意)  
  
string(const char *str,size_type length);
//同上，长度不限，但注意不要越界，以免发生不可预知问题  
  
string(string &str, size_type index, size_type length);  
//以index为索引开始的子串，长度为length, 或者小于length  
  
string(input_iterator begin, input_iterator end);
//以从start到end的元素为初值  
```

<!-- more -->


- ### 支持的操作符###

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2c++string%E7%B1%BB%E5%9E%8B%E8%AF%A6%E8%A7%A3%E5%9B%BE%E7%89%87.png)</center>
    
- ### 追加文本（append）###

```cpp
basic_string &append(const basic_string &str);
//在字符串的末尾添加str  
  
basic_string &append(const char *str);
//在字符串末尾添加str所指向的c风格字符串  
  
basic_string &append(const basic_string &str,size_type index,size_type len);  
//在字符串的末尾添加str的子串,子串以index索引开始，长度为len  
  
basic_string &append(const char *str,size_type num);
//在字符串的末尾添加str中的num个字符  
  
basic_string &append(size_type num,char ch);
//在字符串的末尾添加num个字符ch  
  
basic_string &append(input_iterator start,input_iterator end);  
//在字符串的末尾添加以迭代器start和end表示的字符序列  
  
push_back('k');
//把一个字符连接到当前字符串的结尾  
```

    
- ### 赋值（assign)###


```cpp
basic_string &assign(const basic_string &str);
//用str为字符串赋值  
  
basic_string &assign(const char *str);
//用str c风格为字符串赋值  
  
basic_string &assign(const char *str,size_type num);
//用str的开始num个字符为字符串赋值  
  
basic_string &assign(const basic_string &str,size_type index,size_type len);  
//用str的子串为字符串赋值,子串以index索引开始，长度为len  
  
basic_string &assign(size_type num,char ch);
//用num个字符ch为字符串赋值  
  
string &assign(const_iterator begin,const_itertor end);  
//把first和last迭代器之间的部分赋给字符串  
```


- ### 比较（compare）###

```cpp
int compare(const basic_string &str);//比较自己和str  
  
int compare(size_type index,size_type length,
const basic_string &str);  
//比较自己的子串和str,子串以index索引开始，长度为length  
  
int compare(size_type index,size_type length,
const basic_string &str,size_type  index2,
size_type length2);  
//比较自己的子串和str的子串，其中index2
//和length2引用str，index和length引用自己  
  
int compare(const char *str);//比较自己和str  
  
int compare(int pos, int n,const char *s)  
//比较自己的子串，从pos开始，n个字符，和s进行比较  
  
int compare(size_type index,size_type length
,const char *str,size_type length2);  
//比较自己的子串和str的子串，其中str的
//子串以索引0开始，长度为length2，自己的子串  
//以index开始，长度为length  
```

<center>![](http://7xstki.com1.z0.glb.clouddn.com/hexo%E5%8D%9A%E5%AE%A2C++string%E7%B1%BB%E5%9E%8B%E8%AF%A6%E8%A7%A3%E5%9B%BE%E7%89%87.png)</center>

- ### 删除（erase）###

```cpp
iterator erase(iterator first, iterator last);  
//删除[first，last）之间的所有字符，返回删除后迭代器的位置  
  
iterator erase(iterator it);
//删除it指向的字符，返回删除后迭代器的位置  
  
string &erase(int pos = 0, int n = npos);
//删除pos开始的n个字符，返回修改后的字符串  
```

- ### 插入（insert）###

```cpp
iterator insert(iterator i,const char &ch);
//在迭代器i表示的位置前面插入一个字符ch  
  
basic_string &insert(size_type index,const basic_string &str);
//在字符串的位置index插入字符串str  
  
basic_string &insert(size_type index,const char *str);
//在字符串的位置index插入字符串str  
  
basic_string &insert(size_type index1,const basic_string
&str,size_type index2,size_type num);  
//在字符串的位置index插入字符串str的子串(从index2开始，长num个字符)  
  
basic_string &insert(size_type index,
const char *str,size_type num);  
//在字符串的位置index插入字符串str的num个字符  
  
basic_string &insert(size_type index,size_type num,char ch );  
//在字符串的位置index插入num个字符ch的拷贝  
  
void insert(iterator i,size_type num,const char &ch);  
//在迭代器i表示的位置前面插入num个字符ch的拷贝  
  
void insert(iterator i,iterator begin,iterator end );  
//在迭代器i表示的位置前面插入一段字符，从start开始，以end结束  
```


- ### 替换（replace）###

```cpp
basic_string &replace(size_type index,size_type num
,const basic_string &str);  
//用str中的num个字符替换本字符串中的字符,从index开始  
  
replace(size_type index1,size_type num1,
const basic_string &str,size_type index2,size_type num2);  
//用str中的num2个字符（从index2开始）替换本字符串中的字符
//，从index1开始，最多num1个字符  
  
basic_string &replace(size_type index,size_type num,
const char *str);  
//用str中的num个字符（从index开始）替换本字符串中的字符  
  
basic_string &replace(size_type index,size_type num1,
const char *str,size_type num2);  
//用str中的num2个字符（从index2开始）替换本字符串
//中的字符，从index1开始，num1个字符  
  
basic_string &replace(size_type index,size_type num1,
size_type num2,char ch);  
//用num2个ch字符替换本字符串中的字符，从index开始，num1个字符  
  
basic_string &replace(iterator start,iterator end,
const basic_string &str);  
//用str中的字符替换本字符串中的字符,迭代器start和end指示范围  
  
basic_string &replace(iterator start,iterator end,
const char *str);  
//用str替换本字符串中的内容,迭代器start和end指示范围  
  
basic_string &replace(iterator start,iterator end,
const char *str,size_type num );  
//用str中的num个字符替换本字符串中的内容,迭代器start和end指示范围  
  
basic_string &replace(iterator start,iterator end,
size_type num,char ch );  
//用num个ch字符替换本字符串中的内容，迭代器start和end指示范围  
```

- ### 查找###

```cpp
函数 find:  
  
size_type find( const basic_string &str, size_type index );  
//返回str在字符串中第一次出现的位置（从index开始查找）  
  
size_type find( const char *str, size_type index );  
//返回str在字符串中第一次出现的位置（从index开始查找）  
  
size_type find( const char *str, size_type index, 
size_type length );  
//返回str在字符串中第一次出现的位置（从index开始查找，长度为length）  
  
size_type find( char ch, size_type index );  
//返回字符ch在字符串中第一次出现的位置（从index开始查找）  
  
  
函数 find_first_of:查找在字符串中第一个与str中的某个字符匹配的字符  
  
    size_type find_first_of( const basic_string &str, size_type index = 0);  
  
    size_type find_first_of( const char *str, size_type index = 0 );  
  
    size_type find_first_of( const char *str, size_type index, size_type num );  
  
    size_type find_first_of( char ch, size_type index = 0 );  
  
函数 find_first_not_of:在字符串中查找第一个与str中的字符都不匹配的字符  
  
    size_type find_first_not_of( const basic_string &str, size_type index = 0 );  
  
    size_type find_first_not_of( const char *str, size_type index = 0 );  
  
    size_type find_first_not_of( const char *str, size_type index, size_type num );  
  
    size_type find_first_not_of( char ch, size_type index = 0 );  
  
函数 find_last_of:在字符串中查找最后一个与str中的某个字符匹配的字符  
  
  size_type find_last_of( const basic_string &str, size_type index = npos );  
  
  size_type find_last_of( const char *str, size_type index = npos );  
  
  size_type find_last_of( const char *str, size_type index, size_type num );  
  
  size_type find_last_of( char ch, size_type index = npos );  
  
函数 find_last_not_of:在字符串中查找最后一个与str中的字符都不匹配的字符  
  
    size_type find_last_not_of( const basic_string &str, size_type index = npos );  
  
    size_type find_last_not_of( const char *str, size_type index = npos);  
  
    size_type find_last_not_of( const char *str, size_type index, size_type num );  
  
    size_type find_last_not_of( char ch, size_type index = npos );  
  
rfind函数  
  
  size_type rfind( const basic_string &str, size_type index );  
  //返回最后一个与str中的某个字符匹配的字符，从index开始查找  
  
  size_type rfind( const char *str, size_type index );  
  //返回最后一个与str中的某个字符匹配的字符，从index开始查找  
  
  size_type rfind( const char *str, size_type index, 
  size_type num );  
  //返回最后一个与str中的某个字符匹配的字符，从index开始查找,最多查找num个字符  
  
  size_type rfind( char ch, size_type index );  
  //返回最后一个与ch匹配的字符，从index开始查找  
```

- ### 其他函数###

```cpp
at函数  
     reference at( size_type index );  
     //at()函数返回一个引用，指向在index位置的字符. 如果index  
     //不在字符串范围内, at() 将报告"out of range"错误，并抛出out_of_range异常  
  
begin函数  
    iterator begin();
    //begin()函数返回一个迭代器,指向字符串的第一个元素  
  
end函数  
    iterator end();
    //返回一个迭代器，指向字符串的末尾(最后一个字符的下一个位置)  
  
c_str函数  
    const char *c_str();
    //返回一个指向正规C字符串的指针, 内容与本字符串相同  
  
capacity函数  
    size_type capacity();
    //返回在重新申请更多的空间前字符串可以  
    //容纳的字符数. 这个数字至少与 size()一样大  
  
copy函数  
    size_type copy( char *str, size_type num, size_type index );  
    //拷贝自己的num个字符到str中（从索引index开始）。返回值是拷贝的字符数  
  
data函数  
    const char *data();//返回指向自己的第一个字符的指针  
  
empty函数  
    bool empty();
    //如果字符串为空则empty()返回真(true)，否则返回假(false)  
  
get_allocator函数  
    allocator_type get_allocator();//返回本字符串的配置器  
  
length函数  
    size_type length();
    //返回字符串的长度. 这个数字应该和size()返回的数字相同  
  
max_size  
    size_type max_size();//返回字符串能保存的最大字符数  
  
rbegin函数  
    rbegin();//返回一个逆向迭代器，指向最后一个字符  
  
rend函数  
    rend();
    //返回一个逆向迭代器，指向第一个元素的前一个位置  
  
reserve函数  
    reserve( size_type num );
    //保留一定容量以容纳字符串（设置capacity值）  
  
resize函数  
  void resize( size_type num );
  //改变本字符串的大小到num, 新空间的内容不确定  
  
  void resize( size_type num, char ch );
  //也可以指定用ch填充  
  
size函数  
    size();//返回字符串中字符的数量  
  
substr函数  
     basic_string substr( size_type index, size_type num = npos );  
     //返回本字符串的一个子串，从index开始，
     //长num个字符。如果没有指定，  
     //将是默认值 string::npos。这样，
     //substr()函数将简单的返回从index开始的剩余的字符串  
  
swap函数  
    void swap( basic_string &str );//把str和本字符串交换  

```


- ### 示例###

```cpp
#include <iostream>  
#include <string>  
#include <sstream>  
using namespace std;  
int main(){  
    //1.string类重载运算符operator>>用于输入，
    //同样重载运算符operator<<用于输出操作  
    string str1;  
    cin >> str1;//当用cin>>进行字符串的输入的时候，
    //遇到空格的地方就停止字符串的读取输入  
    cout << str1 << endl;  
    cin.get();//这个的作用就是读取cin>>输入的结束符，
    //不用对getline的输入产生影响！  
    getline(cin, str1);//字符串的行输入  
    cout << str1 << endl;  
  
    //2.string类的构造函数  
    string str2 = "aaaaa";//最简单的字符串初始化  
    cout << str2 << endl;  
  
    char *s = "bbbbb";  
    string str3(s);//用c字符串s初始化  
    cout << str3 << endl;  
  
    char ch = 'c';  
    string str4(5, ch);//用n个字符ch初始化  
    cout << str4 << endl;  
  
    //3.string类的字符操作  
    string str5 = "abcde";  
    ch = str5[3];//operator[]返回当前字符串中第n个字符的位置  
    cout << ch << endl;  
  
    string str6 = "abcde";  
    ch = str6.at(4);
    //at()返回当前字符串中第n个字符的位置,
    //并且提供范围检查，当越界时会抛出异常！  
    cout << ch << endl;  
  
    //4.string的特性描述  
    string str7 = "abcdefgh";  
    int size;  
    size = str7.capacity();//返回当前容量  
    cout << size << endl;  
    size = str7.max_size();
    //返回string对象中可存放的最大字符串的长度  
    cout << size << endl;  
    size = str7.size();//返回当前字符串的大小  
    cout << size << endl;  
    size = str7.length();//返回当前字符串的长度  
    cout << size << endl;  
    bool flag;  
    flag = str7.empty();//判断当前字符串是否为空  
    cout << flag << endl;  
    int len = 10;  
    str7.resize(len, ch);
    //把字符串当前大小置为len，并用字符ch填充不足的部分  
    cout << str7 << endl;  
  
    //5.string的赋值  
    string str8;  
    str8 = str7;//把字符串str7赋给当前字符串  
    cout << str8 << endl;  
    str8.assign(str7);//把字符串str7赋给当前字符串  
    cout << str8 << endl;  
    str8.assign(s);//用c类型字符串s赋值  
    cout << str8 << endl;  
    str8.assign(s, 2);//用c类型字符串s开始的n个字符赋值  
    cout << str8 << endl;  
    str8.assign(len, ch);//用len个字符ch赋值给当前字符串  
    cout << str8 << endl;  
    str8.assign(str7, 0, 3);//把字符串str7中从0开始的3个字符赋给当前字符串  
    cout << str8 << endl;  
    string str9 = "0123456789";  
    str8.assign(str9.begin(), str9.end());//把迭代器之间的字符赋给字符串  
    cout << str8 << endl;  
  
    //6.string的连接  
    string str10;  
    str10 += str9;//把字符串str9连接到当前字符串的结尾  
    cout << str10 << endl;  
    str10.append(s);//把c类型字符串s连接到当前字符串的结尾  
    cout << str10 << endl;  
    str10.append(s, 2);
    //把c类型字符串s的前2个字符连接到当前字符串的结尾  
    cout << str10 << endl;  
    str10.append(str9.begin(), str9.end());
    //把迭代器之间的一段字符连接到当前字符串的结尾  
    cout << str10 << endl;  
    str10.push_back('k');//把一个字符连接到当前字符串的结尾  
    cout << str10 << endl;  
  
    //7.string的比较  
    flag = (str9 == str10);//判断两个字符串是否相等  
    cout << flag << endl;  
    flag = (str9 != str10);//判断两个字符串是否不相等  
    cout << flag << endl;  
    flag = (str9 > str10);//判断两个字符串是否大于关系  
    cout << flag << endl;  
    flag = (str9 < str10);//判断两个字符串是否为小于关系  
    cout << flag << endl;  
    flag = (str9 >= str10);//判断两个字符串是否为大于等于关系  
    cout << flag << endl;  
    flag = (str9 <= str10);//判断两个字符串否为小于等于关系  
    cout << flag << endl;  
  
    //以下的3个函数同样适用于c类型的字符串，
    //在compare函数中>时返回1，<时返回-1，=时返回0  
    flag = str10.compare(str9);
    //比较两个字符串的大小，通过ASCII的相减得出！  
    cout << flag << endl;  
    flag = str10.compare(6, 12, str9);
    //比较str10字符串从6开始的12个字符组成的字符串与str9的大小  
    cout << flag << endl;  
    flag = str10.compare(6, 12, str9, 3, 5);
    //比较str10字符串从6开始的12个字符组成的字符串
    //与str9字符串从3开始的5个字符组成的字符串的大小  
    cout << flag << endl;  
  
    //8.string的字串  
    string str11;  
    str11 = str10.substr(10, 15);
    //返回从下标10开始的15个字符组成的字符串  
    cout << str11 << endl;  
  
    //9.string的交换  
    str11.swap(str10);//交换str11与str10的值  
    cout << str11 << endl;  
  
    //10.string的查找，查找成功时返回所在位置，
    //失败时返回string::npos的值，即是-1  
    string str12 = "abcdefghijklmnopqrstuvwxyz";  
    int pos;  
    pos = str12.find('i', 0);
    //从位置0开始查找字符i在当前字符串的位置  
    cout << pos << endl;  
    pos = str12.find("ghijk", 0);
    //从位置0开始查找字符串“ghijk”在当前字符串的位置  
    cout << pos << endl;  
    pos = str12.find("opqrstuvw", 0, 4);
    //从位置0开始查找字符串“opqrstuvw”前4个字符
    //组成的字符串在当前字符串中的位置  
    cout << pos << endl;  
    pos = str12.rfind('s', string::npos);
    //从字符串str12反向开始查找字符s在字符串中的位置  
    cout << pos << endl;  
    pos = str12.rfind("klmn", string::npos);
    //从字符串str12反向开始查找字符串“klmn”在字符串中的位置  
    cout << pos << endl;  
    pos = str12.rfind("opqrstuvw", string::npos, 3);
    //从string::pos开始从后向前查找字符串s中前n个字符
    //组成的字符串在当前串中的位置  
    cout << pos << endl;  
  
    string str13 = "aaaabbbbccccdddeeefffggghhhiiijjjkkllmmmandjfaklsdfpopdtwptioczx";  
    pos = str13.find_first_of('d', 0);
    //从位置0开始查找字符d在当前字符串第一次出现的位置  
    cout << pos << endl;  
    pos = str13.find_first_of("eefff", 0);
    //从位置0开始查找字符串“eeefff“在当前字符串中第一次出现的位置  
    cout << pos << endl;  
    pos = str13.find_first_of("efff", 0, 3);
    //从位置0开始查找当前串中第一个在字符串”efff“的
    //前3个字符组成的数组里的字符的位置  
    cout << pos << endl;  
    pos = str13.find_first_not_of('b', 0);
    //从当前串中查找第一个不在串s中的字符出现的位置  
    cout << pos << endl;  
    pos = str13.find_first_not_of("abcdefghij", 0);
    //从当前串中查找第一个不在串s中的字符出现的位置  
    cout << pos << endl;  
    pos = str13.find_first_not_of("abcdefghij", 0, 3);
    //从当前串中查找第一个不在由字符串”abcdefghij”的
    //前3个字符所组成的字符串中的字符出现的位置  
    cout << pos << endl;  
    //下面的last的格式和first的一致，只是它从后面检索！  
    pos = str13.find_last_of('b', string::npos);  
    cout << pos << endl;  
    pos = str13.find_last_of("abcdef", string::npos);  
    cout << pos << endl;  
    pos = str13.find_last_of("abcdef", string::npos, 2);  
    cout << pos << endl;  
    pos = str13.find_last_not_of('a', string::npos);  
    cout << pos << endl;  
    pos = str13.find_last_not_of("abcdef", string::npos);  
    cout << pos << endl;  
    pos = str13.find_last_not_of("abcdef", string::npos, 3);  
    cout << pos << endl;  
  
    //11.string的替换  
    string str14 = "abcdefghijklmn";  
    str14.replace(0, 3, "qqqq");
    //删除从0开始的3个字符，然后在0处插入字符串“qqqq”  
    cout << str14 << endl;  
    str14.replace(0, 3, "vvvv", 2);
    //删除从0开始的3个字符，然后在0处插入字符串“vvvv”的前2个字符  
    cout << str14 << endl;  
    str14.replace(0, 3, "opqrstuvw", 2, 4);
    //删除从0开始的3个字符，然后在0处插入
    //字符串“opqrstuvw”从位置2开始的4个字符  
    cout << str14 << endl;  
    str14.replace(0, 3, 8, 'c');
    //删除从0开始的3个字符，然后在0处插入8个字符 c  
    cout << str14 << endl;  
    //上面的位置可以换为迭代器的位置，操作是一样的，
    //在这里就不再重复了！  
  
    //12.string的插入，下面的位置处亦可以用迭代器
    //的指针表示，操作是一样的  
    string str15 = "abcdefg";  
    str15.insert(0, "mnop");//在字符串的0位置开始处，插入字符串“mnop”  
    cout << str15 << endl;  
    str15.insert(0, 2, 'm');
    //在字符串的0位置开始处，插入2个字符m  
    cout << str15 << endl;  
    str15.insert(0, "uvwxy", 3);
    //在字符串的0位置开始处，插入字符串“uvwxy”中的前3个字符  
    cout << str15 << endl;  
    str15.insert(0, "uvwxy", 1, 2);
    //在字符串的0位置开始处，插入从字符串“uvwxy”的1位置开始的2个字符  
    cout << str15 << endl;  
  
    //13.string的删除  
    string str16 = "gfedcba";  
    string::iterator it;  
    it = str16.begin();  
    it++;  
    str16.erase(it);
    //删除it指向的字符，返回删除后迭代器的位置  
    cout << str16 << endl;  
    str16.erase(it, it+3);
    //删除it和it+3之间的所有字符，返回删除后迭代器的位置  
    cout << str16 << endl;  
    str16.erase(2);
    //删除从字符串位置3以后的所有字符，返回位置3前面的字符  
    cout << str16 << endl;  
  
    //14.字符串的流处理  
    string str17("hello,this is a test");  
    istringstream is(str17);  
    string s1,s2,s3,s4;  
    is>>s1>>s2>>s3>>s4;
    //s1="hello,this",s2="is",s3="a",s4="test"  
    ostringstream os;  
    os<<s1<<s2<<s3<<s4;  
    cout<<os.str() << endl;  
  
    //system("pause");  
}  
```