<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String result = (String)request.getAttribute("result");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습</h1>
	<h2>Receive10.jsp</h2>
	<hr>
</div>

<div>
	<p>정수1 : <%=num1 %></p>
	<p>정수2 : <%=num2 %></p>
	<p>연산자 : <%=op %></p>
	<p>결과 : <%=result %></p>
</div>

</body>
</html>