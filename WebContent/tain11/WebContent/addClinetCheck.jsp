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
<title>写入数据</title>
</head>
<body> 


    <% 
//链接student数据库
       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=student";
       Connection con=DriverManager.getConnection(connectSQL,"ax","");
       
//写入suer表      
       String sql01="insert into ccc values(?,?)";       
       PreparedStatement zx=con.prepareStatement(sql01);
       
       String userName=request.getParameter("userName");
       String password=request.getParameter("password");
       
       zx.setString(1,userName);
       zx.setString(2,password);
       int a=zx.executeUpdate();
      
       zx.close();
//写入client表   
       String sql02="insert into client values(?,?,?,?,?)";
       PreparedStatement zm=con.prepareStatement(sql02);
       
       String clientName=request.getParameter("clientName");
       String clientSex=request.getParameter("clientSex");
       String clientTeiephone=request.getParameter("clientTeiephone");
       String clientAddress=request.getParameter("clientAddress");
       String clientEmail=request.getParameter("clientEmail");
       
       
       zm.setString(1,clientName);
       zm.setString(2,clientSex);
       zm.setString(3,clientTeiephone);
       zm.setString(4,clientAddress);
       zm.setString(5,clientEmail);
       
       int b=zm.executeUpdate();
             
       
       zm.close();       
       con.close();
    %>
        <p>注册成功</p>
    <%response.sendRedirect("login.jsp");%>    
</body>
</html>