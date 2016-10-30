<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connectSQL = "jdbc:sqlserver://localhost:1433;DatabaseName=Student";
		Connection conn = java.sql.DriverManager.getConnection(connectSQL, "ax", "");

		Statement st = conn.createStatement();
		String id = request.getParameter();
		String sql = "select * from student where id = " + id;
		ResultSet rs = st.executeQuery(sql);
		
		String name = "";
		int age = 0;
		String major = "";
		
		while(rs.next()){
			name = rs.getString("name");
			age = rs.getInt("age");
			major = rs.getString("major");
		}
                rs.close();
                conn.close();
%>

<form action="update.jsp"  method="post">
   <p>要修改的学号：<input name="id" /></p>
   <p>姓名：<input name="name" /></p>
   <p>年龄：<input name="age" /></p>
   <p>专业：<input name="major" /></p>
   <button type="submit"  name="submit">提交</button>
</form>
</body>
</html>