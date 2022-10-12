<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String dan = request.getParameter("dan");
	int nDan = Integer.parseInt(dan);
	String result = "";
	
	for(int i = 1; i<=9; i++)
	{
		result += String.format("%d * %d = %d<br>", nDan, i, (nDan*i));
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<p><%=result %></p>
</div>
</body>
</html>