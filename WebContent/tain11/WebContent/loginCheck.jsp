<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>验证登录</title>
</head>
<body> 


    <% 
//链接student数据库
       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=student";
       Connection conn=java.sql.DriverManager.getConnection(connectSQL,"ax","");      
//判断用户名       
       String query_1 ="select * form user where userName = '"+userName+"'"; 
       PreparedStatement ps = conn.prepareStatement(query_1);
//判断密码       
       if(ps.next()){
    	   String query_2 ="select * form user where password = '"+password+"'";
    	   PreparedStatement ps = conn.prepareStatement(query_2);
    	   if(ps.next()){
    		   response.sendRedirect("#");//搜索页面
    	   }else{
    		   response.sendRedirect("login.jsp");
    	   }
       }
       
       ps.close();
       conn.close();
       
%>
</body>
</html>