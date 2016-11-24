<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./css/001.css"/>
<title></title>
</head>

<body>

<jsp:useBean id="Status" class="com.sccc.Status" scope="session"/>
<h1>预警！</h1>
<form action="showInfo.jsp" method="post">
 
  <%
     String test = Status.getZhuangTai().get(0);
     ArrayList<String> xuanXiang = Status.getTiMu().get(test);
     out.println("<h1>" + test + "应该怎么回答？！！想清楚！</h1>");

    for(int i=0;i<4;i++){
	String neiRong=xuanXiang.get(i);
	String num=String.valueOf(i);
	out.print("<p><input type='radio' name='phone' value='+"+num+"'>"+neiRong+"</input></p>");
	
   }
 %>
<button>提交</button>
</form>

</body>
