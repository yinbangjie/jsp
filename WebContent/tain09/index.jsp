<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更改信息</title>
</head>
<body>
<form action="update.jsp"  method="post">
   <p>要修改的学号：<input name="id" /></p>
   <p>姓名：<input name="name" /></p>
   <p>年龄：<input name="age" /></p>
   <p>专业：<input name="major" /></p>
   <button type="submit"  name="submit">提交</button>
</form>


</body>
</html>