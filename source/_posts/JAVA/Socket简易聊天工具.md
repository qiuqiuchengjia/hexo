---
title: Socket简易聊天工具
date: 2016-06-27 19:41:56
tags: [JAVA,Socket]
categories: JAVA
---

### 演示###

- 代码运行如图，看起来还不错，哈哈哈

<center>![](http://o99dg8ap9.bkt.clouddn.com/socket%E8%81%8A%E5%A4%A9%E5%B7%A5%E5%85%B7%E5%95%8A.png)</center>


<!-- more -->


### 服务端###

```java
package qiu;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.print.Printable;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *  简单聊天软件的服务器
 * */
public class MyServer extends JFrame implements ActionListener{
    
	JTextArea jTextArea =null;//用来显示纯文本的单行区域
	JTextField jTextField=null;//可以允许用来编辑单行文本
	JButton sendButton=null;
	JPanel jPanel=null;
	JScrollPane jScrollPane =null;
	//把信息发给客户端对象
	PrintWriter printWriter =null;
/**
  *  服务端的主函数
  * */
public static void main(String[] args) {
	// TODO Auto-generated method stub
       new MyServer();
}
/**
 *  服务端的构造函数,用来进行初始化
 * */
public MyServer(){
	//这里是对GUI的初始化
	jTextArea = new JTextArea();
	jTextField= new JTextField(20);
	sendButton= new JButton("发送");
	sendButton.addActionListener(this);
	sendButton.setActionCommand("send");
	jScrollPane= new JScrollPane(jTextArea);
	jPanel = new JPanel();
	jPanel.add(jTextField);//添加编辑框
	jPanel.add(sendButton);//添加按钮
		
	//将两个面板添加布局
	this.add(jScrollPane,BorderLayout.CENTER);
	this.add(jPanel,BorderLayout.SOUTH);
		
	this.setSize(400,300);
	this.setTitle("聊天服务器");
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//设置退出按钮
	this.setVisible(true);
    this.setResizable(true);	
        
    //下面是socket服务器的搭建
    try {
		//服务器监听
       	ServerSocket ss = new ServerSocket(9988);
		//等待客户端连接
       	Socket socket = ss.accept();
       	//获得客户端发送过来的数据的流
       	BufferedReader br = new BufferedReader
      			(new InputStreamReader(socket.getInputStream()));
       	printWriter = new PrintWriter(socket.getOutputStream(),true);
       	//读取从客户端发送过来的信息
       	while(true){
      		String info = br.readLine();
       		jTextArea.append("客户端 "+getTime()+"\r\n"+info+"\r\n");
       	}
			
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}   }
/**
 * 用来获取当前的时间
 * @return 当前的时间
 */
public String getTime(){
	//可以对每个单独时间域进行修改
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);//获取小时
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);
		
	return hour+":"+minute+":"+second;	
   }
	
/**
 * 当button被点击的时候调用
 */
@Override
public void actionPerformed(ActionEvent e) {
	// TODO Auto-generated method stub
	//当按钮按下的时候调用
	if(e.getActionCommand().equals("send")){
		//把服务器在jTextField写的内容发送给客户端
		String info= jTextField.getText();
		jTextArea.append("服务器 "+getTime()+"\r\n"+info+"\r\n");
		printWriter.println(info);
		//清楚发送框内容
		jTextField.setText("");
			
		}	
	}
}
```

### 客户端###

```java
package qiu;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 * 简单聊天软件的客户端
 * */
public class MyClient extends JFrame implements ActionListener{
    
	JTextArea jTextArea=null;
	JTextField jTextField=null;
	JPanel jPanel=null;
	JScrollPane jScrollPane=null;
	JButton sendButton=null;
	PrintWriter printWriter=null;
	
/**
  *  客户端的主函数
  * */
public static void main(String[] args) {
	// TODO Auto-generated method stub
      new MyClient();
}
/**
 * 客户端构造函数用来初始化
 * */
public MyClient(){
	//GUI初始化
	jTextArea= new JTextArea();
	jTextField=new JTextField(20);
	sendButton= new JButton("发送");
	sendButton.addActionListener(this);
	sendButton.setActionCommand("send");
	jScrollPane=new JScrollPane(jTextArea);
	jPanel=new JPanel();
	
	jPanel.add(jTextField);
	jPanel.add(sendButton);
		
	this.add(jScrollPane,BorderLayout.CENTER);
	this.add(jPanel,BorderLayout.SOUTH);
		
	this.setSize(400, 300);
	this.setTitle("聊天客户端");
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	this.setVisible(true);
    this.setResizable(true);	
        
    //socket通信代码
     try {
    	Socket s= new Socket("127.0.0.1",9988);
		BufferedReader br = new BufferedReader
				(new InputStreamReader(s.getInputStream()));
		printWriter= new PrintWriter(s.getOutputStream(),true);
        while(true){
          	//不停的读取服务器发过来的信息
            String string=br.readLine();
            jTextArea.append("服务器 "+getTime()+"\r\n"+string+"\r\n");
            }
			
	} catch (UnknownHostException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

/**
  * 用来获取当前的时间
  * @return 当前的时间
  */
public String getTime(){
	//可以对每个单独时间域进行修改
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);//获取小时
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);
		
	return hour+":"+minute+":"+second;	
}
/**
  * 当button被点击的时候调用
  */
@Override
public void actionPerformed(ActionEvent e) {
	// TODO Auto-generated method stub
	if(sendButton.getActionCommand().equals("send")){
		String info= jTextField.getText();
		//将客户端发送的信息发送给服务端
		jTextArea.append("客户端 "+getTime()+"\r\n"+info+"\r\n");
		printWriter.println(info);
		jTextField.setText("");
		}
	}
}
```
