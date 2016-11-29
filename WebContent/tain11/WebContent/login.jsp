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
<title>登录页面</title>
<script type="text/javascript" src="js/123.js">
</script>
</head>
<body>
	<form action="loginCheck.jsp" method="post" onsubmit="checkAll_01()">
		昵　称：<input type="text" name="userName"id="userName" /><br /><br /> 		
		密　码：<input type="password" name="password"id="password" /><br /> <br /> 	
		验证码：<input type="text" id="validationCode" size="6" >
		<%
         int intmethod1=(int)((((Math.random())*11))-1);
         int intmethod2=(int)((((Math.random())*11))-1);
         int intmethod3=(int)((((Math.random())*11))-1);
         int intmethod4=(int)((((Math.random())*11))-1);
         String intsum=intmethod1+""+intmethod2+intmethod3+intmethod4;
        %>
		<input type="hidden" id="validationCode2" value="<%=intsum %>"> 
		<img src="./img/<%=intmethod1 %>.gif"> 
		<img src="./img/<%=intmethod2 %>.gif"> 
		<img src="./img/<%=intmethod3 %>.gif"> 
		<img src="./img/<%=intmethod4 %>.gif"> 
		<br /> <br /> 
		<button type="submit" class="btn btn-warning" value="登录">登录</button>
		<button type="reset" class="btn btn-warning" value="清除">清除</button>				
	</form>
	<form action="addClinet.jsp" method="post">
	    <button type="submit" class="btn btn-warning" value="注册">注册</button>
	</form>
</body>
</html>