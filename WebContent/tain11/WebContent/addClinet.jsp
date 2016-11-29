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
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<title>注册页面</title>
</head>
<body>
	<script type="text/javascript" src="js/123.js"></script>
</head>
<body>
	<form action="addClinetCheck.jsp" method="post" onsubmit="return checkAll_02()">
		<h3>您的账户信息：</h3>
		昵　　称：<input type="text" name="userName" id="userName" /><br /> 
		<font>请输入4-12个字符</font><br />
		密　　码：<input type="password" name="password" name="password"  id="password"/><br /> 
		<font>请输入6-16个字符</font><br />
		确认密码：<input type="password" id="password2" /><br /> 
		<font>请再次输入密码</font><br />
		<h3>您的个人信息：</h3>
		姓　　名：<input type="text" name="clientName"name="clientName" id="clientName" /><br /> 
		<font>请输入2-12个字符</font><br />
		性　　别：<input type="text" name="clientSex" id="clientSex" /><br /> 
		<font>请输入男或女</font><br />
		号　　码：<input type="text" name="clientTeiephone"id="clientTeiephone"  /><br /> 
		<font>请输入xxx-xxxxxxxx或xxxx-xxxxxxx</font><br />
		家庭住址：<input type="text" name="clientAddress" id="clientAddress" /><br /> <br /> 
		邮箱地址：<input type="text" name="clientEmail" id="clientEmail"  /><br /> <br />
		<button type="submit" class="btn btn-warning" value="确定">确定</button>
		<button type="reset" class="btn btn-warning" value="清除">清除</button>			
	</form>
    <form action="login.jsp" method="post">
	    <button type="submit" class="btn btn-warning" value="取消">取消</button>
	</form>
</body>
</html>