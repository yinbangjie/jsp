﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   response.setContentType("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入数据</title>
</head>
<body>   
    <h1>数据库的所有内容：</h1>
    <%
       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
       String url="jdbc:sqlserver://localhost:1433;DatabaseName=xs";
       Connection con=DriverManager.getConnection(url,"ax","");
       Statement z=con.createStatement();
       ResultSet m=z.executeQuery("select * from Student");
       while(m.next()){
    	   out.print(m.getInt("id"));
    	   out.print(m.getString("name"));
    	   out.print(m.getInt("age")+"  ");
    	   out.print(m.getString("major"));
    	   out.print("</br>");
       }
       %>
       <h1>插入信息后：</h1>
       <%
       String cx="insert into Student01 values(?,?,?,?)";
       PreparedStatement zm=con.prepareStatement(cx);
       int id=Integer.parseInt(request.getParameter("id"));
       String name=request.getParameter("name");
       int age=Integer.parseInt(request.getParameter("age"));
       String zy=request.getParameter("major");
       zm.setInt(1,id);
       zm.setString(2,name);
       zm.setInt(3,age);
       zm.setString(4,zy);
       int a=zm.executeUpdate();
       System.out.print(zm.toString());
       %>
       <% 
        z=con.createStatement();
        m=z.executeQuery("select * from Student");
       while(m.next()){
    	   out.print(m.getInt("id"));
    	   out.print(m.getString("name"));
    	   out.print(m.getInt("age")+"  ");
    	   out.print(m.getString("major"));
    	   out.print("</br>");
       }
       m.close();
       zm.close();
       z.close();
       con.close();
    %>
        <p>插入成功</p>
</body>
</html>