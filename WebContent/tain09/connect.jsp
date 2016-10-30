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
<table>
	<%

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connectSQL = "jdbc:sqlserver://localhost:1433;DatabaseName=Student";
		Connection conn = java.sql.DriverManager.getConnection(connectSQL, "ax", "");

		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from student");
		
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td><a href = 'modify.jsp?id=" + rs.getInt("id") + "'>学号</a><td>");
			out.print("<td>" + rs.getString("name") + "<td>");
			out.print("<td>" + rs.getInt("age") + "<td>");
			out.print("<td>" + rs.getString("major") + "<td>");
			out.print("<tr>");
		}
                st.close();
                conn.close();
	%>
	
	<%=session.getAttribute("info") %>
		</table>
</body>
</html>