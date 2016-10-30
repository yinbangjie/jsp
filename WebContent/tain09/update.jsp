<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>提交处理</title>
</head>
<body>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    String connectSQL = "jdbc:sqlserver://localhost:1433;DatabaseName=student";
    Connection conn = java.sql.DriverManager.getConnection(connectSQL,"ax","");
    
    String sql = "update student set name = ?, age = ?, major=? where id=?";
    PreparedStatement st = conn.prepareStatement(sql);
    
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String major = request.getParameter("major");
    
    st.setString(1, name);
    st.setInt(2, Integer.parseInt(age));
    st.setString(3, major);
    st.setInt(4, Integer.parseInt(id));
    st.executeUpdate();
    
    st.close();
    conn.close();
%>
<h1>您的信息已经提交成功</h1>
</body>
</html>