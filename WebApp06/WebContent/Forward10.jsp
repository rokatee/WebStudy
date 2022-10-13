<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(Send10.jsp)로부터 데이터 수신
	// num1, num2, op
	
	request.setCharacterEncoding("UTF-8");

	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	
	String result = "";
	
	if(op.equals("덧셈"))
	{
		result = String.valueOf(num1 + num2);
	}
	if(op.equals("뺄셈"))
	{
		result = String.valueOf(num1 - num2);
	}
	if(op.equals("곱셈"))
	{
		result = String.valueOf(num1 * num2);
	}
	if(op.equals("나눗셈"))
	{
		result = String.format("%.2f", num1/(double)num2);
	}
	
	request.setAttribute("result", result);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습</h1>
	<h2>Forward10.jsp</h2>
	<hr>
</div>

<div>
	<jsp:forward page="Receive10.jsp"></jsp:forward>
</div>
</body>
</html>