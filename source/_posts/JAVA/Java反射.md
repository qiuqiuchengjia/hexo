---
title: Java反射
date: 2016-07-29 16:18:26
tags: JAVA
categories: JAVA
---

### 什么是反射###

“__反射（Reflection）能够让运行于JVM中的程序检测和修改运行时的行为。__”这个概念常常会和内省（Introspection）混淆，以下是这两个术语在Wikipedia中的解释：

- 内省用于在运行时检测某个对象的类型和其包含的属性

- 反射用于在运行时检测和修改某个对象的结构及其行为

从它们的定义可以看出，内省是反射的一个子集。有些语言支持内省，但并不支持反射，如C++

- 内省示例：instanceof 运算符用于检测某个对象是否属于特定的类

```java
if (obj instanceof Dog) {
    Dog d = (Dog) obj;
    d.bark();
}
```

- 反射示例：Class.forName()方法可以通过类或接口的名称（一个字符串或完全限定名）来获取对应的Class对象。forName方法会触发类的初始化

```java
// 使用反射
Class<?> c = Class.forName("classpath.and.classname");
Object dog = c.newInstance();
Method m = c.getDeclaredMethod("bark", new Class<?>[0]);
m.invoke(dog);
```

- 在Java中，反射更接近于内省，因为你无法改变一个对象的结构。虽然一些API可以用来修改方法和属性的可见性，但并不能修改结构
<!-- more -->

### 为什么需要反射###

反射能够让我们：

- 在运行时检测对象的类型

- 动态构造某个类的对象

- 检测类的属性和方法

- 任意调用对象的方法

- 修改构造函数、方法、属性的可见性

- 以及其他

__反射是框架中常用的方法__

- 例如，[JUnit](http://www.programcreek.com/2012/02/junit-tutorial-2-annotations/) 通过反射来遍历包含 @Test 注解的方法，并在运行单元测试时调用它们。（这个连接中包含了一些[JUnit](http://www.programcreek.com/2012/02/junit-tutorial-2-annotations/) 的使用案例）

对于Web框架，开发人员在配置文件中定义他们对各种接口和类的实现。通过反射机制，框架能够快速地动态初始化所需要的类

- 例如，Spring框架使用如下的配置文件：

```html
<bean id="someID" class="com.programcreek.Foo">
    <property name="someField" value="someValue" />
</bean>
```
- 当Spring容器处理<bean>元素时，会使用Class.forName("com.programcreek.Foo")来初始化这个类，并再次使用反射获取<property>元素对应的setter方法，为对象的属性赋值

- Servlet也会使用相同的机制：

```html
<servlet>
    <servlet-name>someServlet</servlet-name>
    <servlet-class>com.programcreek.WhyReflectionServlet</servlet-class>
<servlet>
```

### 处理泛型###

- Java 5中引入了泛型的概念之后，Java反射API也做了相应的修改，以提供对泛型的支持。由于类型擦除机制的存在，泛型类中的类型参数等信息，在运行时刻是不存在的。JVM看到的都是原始类型。对此，Java 5对Java类文件的格式做了修订，添加了Signature属性，用来包含不在JVM类型系统中的类型信息。 在运行时刻，JVM会读取Signature属性的内容并提供给反射API来使用。
比如在代码中声明了一个域是List类型的，虽然在运行时刻其类型会变成原始类型List，但是仍然可以通过反射来获取到所用的实际的类型参数

```java
Field field = Pair.class.getDeclaredField("myList"); //myList的类型是List 
Type type = field.getGenericType(); 
if (type instanceof ParameterizedType) {     
    ParameterizedType paramType = (ParameterizedType) type;     
    Type[] actualTypes = paramType.getActualTypeArguments();     
    for (Type aType : actualTypes) {         
        if (aType instanceof Class) {         
            Class clz = (Class) aType;             
            System.out.println(clz.getName()); //输出java.lang.String         
        }     
    } 
}
```

### Class类###
在程序运行期间，Java运行时系统始终为所有的对象维护一个被称为运行时的类型标识。这个信息跟踪着这个对象所属的类。可以通过专门的Java类访问这些信息，保存这些信息的类被称为**Class类**。
获取Class对象的三种方法：
1. 通过调用Object类中的getClass()方法返回一个Class对象
```java
Object myObject = new Object();
Class myObjectClass = myObject.getClass();
```

2. 通过调用静态方法forName获得类名对应的Class对象
```java
String className = "java.util.Date";
Class cl = Class.forName(className);
```
注意：在使用`Class.forName()`方法时，必须提供一个类的全名，这个全名包括类所在的包的名字。

3. 如果在调用该方法时，没有找到该路径的类，将会抛出ClassNotFoundException。
获得Class对象的第三种方法非常简单，如果`T`是任意的Java类型，`T.class`将代表匹配的类对象
```java
Class cl1 = Date.class;
Class cl2 = int.class;
```
补充：可通过下面方式访问类的父类
```java
Object myObject = new Object();
Class myObjectClass = myObject.getSuperclass();
```

### 获取类名###
通过Class对象可以获取两个版本的类名：
1. 通过getName()方法返回类的全限定类名(包含包名)：
```java
Class aClass = ... //获取Class对象
String className = aClass.getName();
```
2. 通过getSimpleName()方法返回类名(不包含包名)
```java
Class aClass = ... //获取Class对象
String className = aClass.getSimpleName();
```

### 获取修饰符###
可以通过Class对象的`getModifiers()`方法来访问一个类的修饰符，该方法通过返回一个整型数值，用不同的位开关描述public/private/static等修饰符的使用状况。
```java
Class aClass = ... //获取Class对象
int modifiers = aClass.getModifiers();
```
还可以使用Modifier类中的isPublic、isPrivate或isFinal判断方法或构造器是否是public、private或final。
```java
Modifier.isAbstract(int modifiers);
Modifier.isFinal(int modifiers);
Modifier.isInterface(int modifiers);
Modifier.isNative(int modifiers);
Modifier.isPrivate(int modifiers);
Modifier.isProtected(int modifiers);
Modifier.isPublic(int modifiers);
Modifier.isStatic(int modifiers);
Modifier.isStrict(int modifiers);
Modifier.isSynchronized(int modifiers);
Modifier.isTransient(int modifiers);
Modifier.isVolatile(int modifiers);
```
### 获取包信息###
可通过以下方式获取包信息：
```java
...
Object object = new Object();
Class cl = object.getClass();
System.out.println(cl.getPackage());
...
/*output
package java.lang, Java Platform API Specification, version 1.7
*/
```
### 获取实现的接口集合
可通过调用Class对象的`getInterfaces()`方法获取一个类实现的接口集合
```java
Class aClass = ... //获取Class对象
Class[] interfaces = aClass.getInterfaces();
```
注意：getInterfaces()方法仅仅只返回当前类所实现的接口，不包括当前类的父类所实现的接口。

### 获取构造器
可通过调用Class对象的`getConstructors()`方法获取一个类的构造函数
```java
Class aClass = ... //获取Class对象
Constructor[] constructors = aClass.getConstructors();
```
返回的Constructor数组包含每一个声明为`public`的构造方法。

----------
还可以通过给定的构造方法的参数类型获取指定的构造方法，如下：返回的构造方法的方法参数为String类型
```java
Class aClass = ... //获取Class对象
Constructor constructor = aClass.getConstructor(new Class[]{String.class});
```
注意：如果没有指定的构造方法能匹配给定的方法参数，则会抛出`NoSuchMethodException`异常。

----------
还可以获取指定构造方法的方法参数信息
```java
Constructor constructor = ... //获取Constructor对象
Class[] parameterTypes = constructor.getParameterTypes();
```

----------
利用Constructor对象实例化一个类
```java
Constructor constructor = ... //获取Constructor对象
Class[] parameterTypes = constructor.getParameterTypes();
```

### 获取方法
可通过调用Class对象的`getMethods()`方法获取一个类的所有方法
```java
Class aClass = ...//获取Class对象
Method[] methods = aClass.getMethods();
```
返回的Method对象数组包含了指定类中声明为public的所有变量集合。

----------
还可以通过具体的参数类型来获取指定的方法
```java
Class  aClass = ...//获取Class对象
Method method = aClass.getMethod("doSomething", new Class[]{String.class});
```
注意：如果根据给定的方法名称以及参数类型无法匹配到相应的方法，则会抛出NoSuchMethodException

----------
获取指定方法的方法参数以及返回类型
```java
Method method = ... //获取Class对象
Class[] parameterTypes = method.getParameterTypes();
Class returnType = method.getReturnType();
```

----------
通过Method对象调用方法
```java
//获取一个方法名为doSomesthing，参数类型为String的方法
Method method = MyObject.class.getMethod("doSomething", String.class);
Object returnValue = method.invoke(null, "parameter-value1");
```

### 获取变量
可通过调用Class对象的`getFields()`方法获取一个类的成员变量
```java
Class aClass = ... //获取Class对象
Field[] method = aClass.getFields();
```
返回的Field对象数组包含了指定类中声明为`public`的所有变量集合

----------
还可以通过具体的变量名称获取指定的变量
```java
Class aClass = ... //获取Class对象
Field[] method = aClass.getFields("someField");
```
注意：在调用`getField()`方法时，如果根据给定的方法参数没有找到对应的变量，那么就会抛出`NoSuchFieldException`

----------
通过调用`Field`对象的`getName()`方法获取它的变量名称
```java
Field field = ... //获取Field对象
String fieldName = field.getName();
```

----------
通过调用`Field`对象`getType()`方法来获取一个变量的类型（如String, int等等）
```java
Class aClass = ... //获取Class对象
Field field = aClass.getField("someField");
Object fieldType = field.getType();
```

----------
通过调用`Field.get()`或`Field.set()`方法获取或设置(get/set)变量值
```java
Class  aClass = MyObject.class
Field field = aClass.getField("someField");

MyObject objectInstance = new MyObject();

Object value = field.get(objectInstance);

field.set(objetInstance, value);
```

### 获取指定类的getters和setters
- Getter：Getter方法的名字以get开头，没有方法参数，返回一个值
- Setter：Setter方法的名字以set开头，有一个方法参数

一个获取getter方法和setter方法的例子:
```java
public static void printGettersSetters(Class aClass){
  Method[] methods = aClass.getMethods();

  for(Method method : methods){
    if(isGetter(method)) System.out.println("getter: " + method);
    if(isSetter(method)) System.out.println("setter: " + method);
  }
}

public static boolean isGetter(Method method){
  if(!method.getName().startsWith("get"))      return false;
  if(method.getParameterTypes().length != 0)   return false;
  if(void.class.equals(method.getReturnType()) return false;
  return true;
}

public static boolean isSetter(Method method){
  if(!method.getName().startsWith("set")) return false;
  if(method.getParameterTypes().length != 1) return false;
  return true;
}
```

### 获取私有变量
可以通过调用`Class.getDeclaredField(String name)`方法或者`Class.getDeclaredFields()`方法获取私有变量和受保护变量，不包括超类的成员；`Class.getField(String name)`和`Class.getFields()`只会返回公有变量，其中包括超类的公有变量，而无法获取私有变量。
```java
public class PrivateObject {

  private String privateString = null;

  public PrivateObject(String privateString) {
    this.privateString = privateString;
  }
}
/**********************************************************************/
PrivateObject privateObject = new PrivateObject("The Private Value");

Field privateStringField = PrivateObject.class.
            getDeclaredField("privateString");

privateStringField.setAccessible(true);

String fieldValue = (String) privateStringField.get(privateObject);
System.out.println("fieldValue = " + fieldValue);
```
这个例子会输出"fieldValue = The Private Value"，`The Private Value`是`PrivateObject`实例的`privateString`私有变量的值，注意调用`PrivateObject.class.getDeclaredField("privateString")`方法会返回一个私有变量，这个方法返回的变量是定义在`PrivateObject`类中的而不是在它的父类中定义的变量。
注意：`privateStringField.setAccessible(true)`这行代码，通过调用`setAccessible()`方法会关闭指定类Field实例的反射访问检查，这行代码执行之后不论是私有的、受保护的以及包访问的作用域，你都可以在任何地方访问，即使你不在他的访问权限作用域之内。但是你如果你用一般代码来访问这些不在你权限作用域之内的代码依然是不可以的，在编译的时候就会报错。

### 获取私有方法
可以通过调用`Class.getDeclaredMethod(String name, Class[] parameterTypes)`或者`Class.getDeclaredMethods()`方法获取私有方法，不包括超类的成员；`Class.getMethod(String name, Class[] parameterTypes)`和`Class.getMethods()`方法，只会返回公有的方法，其中包括超类的公有方法，而无法获取私有方法。
```java
public class PrivateObject {

  private String privateString = null;

  public PrivateObject(String privateString) {
    this.privateString = privateString;
  }

  private String getPrivateString(){
    return this.privateString;
  }
}
/*******************************************************************/
PrivateObject privateObject = new PrivateObject("The Private Value");

Method privateStringMethod = PrivateObject.class.
        getDeclaredMethod("getPrivateString", null);

privateStringMethod.setAccessible(true);

String returnValue = (String)
        privateStringMethod.invoke(privateObject, null);

System.out.println("returnValue = " + returnValue);
```
这个例子会输出`"returnValue = The Private Value"`，`The Private Value`是`PrivateObject`实例的`getPrivateString()`方法的返回值。`PrivateObject.class.getDeclaredMethod("privateString")`方法会返回一个私有方法，这个方法是定义在`PrivateObject`类中的而不是在它的父类中定义的。
注意：Method.setAcessible(true)这行代码，通过调用setAccessible()方法会关闭指定类的Method实例的反射访问检查，这行代码执行之后不论是私有的、受保护的以及包访问的作用域，你都可以在任何地方访问，即使你不在他的访问权限作用域之内。但是你如果你用一般代码来访问这些不在你权限作用域之内的代码依然是不可以的，在编译的时候就会报错。

### 获取注解
**什么是注解？**
注解是Java 5的一个新特性。注解是插入你代码中的一种注释或者说是一种元数据（meta data）。这些注解信息可以在编译期使用预编译工具进行处理（pre-compiler tools），也可以在运行期使用Java反射机制进行处理。
下面是一个类注解的例子：
```java
@MyAnnotation(name="someName",  value = "Hello World")
public class TheClass {
}
```
在TheClass类定义的上面有一个@MyAnnotation的注解。注解的定义与接口的定义相似，下面是MyAnnotation注解的定义：
```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)

public @interface MyAnnotation {
  public String name();
  public String value();
}
```
在interface前面的@符号表名这是一个注解，一旦你定义了一个注解之后你就可以将其应用到你的代码中。
> 说明：在注解定义中的两个指示@Retention(RetentionPolicy.RUNTIME)和@Target(ElementType.TYPE)，说明了这个注解该如何使用。
> 1. @Retention(RetentionPolicy.RUNTIME)表示这个注解可以在运行期通过反射访问。如果你没有在注解定义的时候使用这个指示那么这个注解的信息不会保留到运行期，这样反射就无法获取它的信息。
> 2. @Target(ElementType.TYPE) 表示这个注解只能用在类型上面（比如类跟接口）。你同样可以把Type改为Field或者Method，或者你可以不用这个指示，这样的话你的注解在类，方法和变量上就都可以使用了。

----------
**类注解**
下是一个访问类注解的例子
```java
Class aClass = TheClass.class;
Annotation[] annotations = aClass.getAnnotations();

for(Annotation annotation : annotations){
    if(annotation instanceof MyAnnotation){
        MyAnnotation myAnnotation = (MyAnnotation) annotation;
        System.out.println("name: " + myAnnotation.name());
        System.out.println("value: " + myAnnotation.value());
    }
}
```
你还可以像下面这样指定访问一个类的注解
```java
Class aClass = TheClass.class;
Annotation annotation = aClass.getAnnotation(MyAnnotation.class);

if(annotation instanceof MyAnnotation){
    MyAnnotation myAnnotation = (MyAnnotation) annotation;
    System.out.println("name: " + myAnnotation.name());
    System.out.println("value: " + myAnnotation.value());
}
```

----------
**方法注解**
下面是一个方法注解的例子
```java
public class TheClass {
  @MyAnnotation(name="someName",  value = "Hello World")
  public void doSomething(){}
}
```
你可以像这样访问方法注解：
```java
Method method = ... //获取方法对象
Annotation[] annotations = method.getDeclaredAnnotations();

for(Annotation annotation : annotations){
    if(annotation instanceof MyAnnotation){
        MyAnnotation myAnnotation = (MyAnnotation) annotation;
        System.out.println("name: " + myAnnotation.name());
        System.out.println("value: " + myAnnotation.value());
    }
}
```
你可以像这样访问指定的方法注解
```java
Method method = ... // 获取方法对象
Annotation annotation = method.getAnnotation(MyAnnotation.class);

if(annotation instanceof MyAnnotation){
    MyAnnotation myAnnotation = (MyAnnotation) annotation;
    System.out.println("name: " + myAnnotation.name());
    System.out.println("value: " + myAnnotation.value());
}
```

----------
**参数注解**
方法参数也可以添加注解，就像下面这样
```java
public class TheClass {
  public static void doSomethingElse(
        @MyAnnotation(name="aName", value="aValue") String parameter){
  }
}
```
你可以通过Method对象来访问方法参数注解
```java
Method method = ... //获取方法对象
Annotation[][] parameterAnnotations = method.getParameterAnnotations();
Class[] parameterTypes = method.getParameterTypes();

int i=0;
for(Annotation[] annotations : parameterAnnotations){
  Class parameterType = parameterTypes[i++];

  for(Annotation annotation : annotations){
    if(annotation instanceof MyAnnotation){
        MyAnnotation myAnnotation = (MyAnnotation) annotation;
        System.out.println("param: " + parameterType.getName());
        System.out.println("name : " + myAnnotation.name());
        System.out.println("value: " + myAnnotation.value());
    }
  }
}
```
需要注意的是Method.getParameterAnnotations()方法返回一个注解类型的二维数组，每一个方法的参数包含一个注解数组。

----------
**变量注解**
下面是一个变量注解的例子
```java
public class TheClass {

  @MyAnnotation(name="someName",  value = "Hello World")
  public String myField = null;
}
```
你可以像这样来访问变量的注解
```java
Field field = ... //获取方法对象</pre>
<pre>Annotation[] annotations = field.getDeclaredAnnotations();

for(Annotation annotation : annotations){
 if(annotation instanceof MyAnnotation){
 MyAnnotation myAnnotation = (MyAnnotation) annotation;
 System.out.println("name: " + myAnnotation.name());
 System.out.println("value: " + myAnnotation.value());
 }
}
```
你可以像这样访问指定的变量注解
```java
Field field = ...//获取方法对象</pre>
<pre>
Annotation annotation = field.getAnnotation(MyAnnotation.class);

if(annotation instanceof MyAnnotation){
 MyAnnotation myAnnotation = (MyAnnotation) annotation;
 System.out.println("name: " + myAnnotation.name());
 System.out.println("value: " + myAnnotation.value());
}
```
### 参考资料

1. [Java Reflection教程](http://ifeve.com/java-reflection/)