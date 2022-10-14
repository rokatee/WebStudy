<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String result = request.getParameter("result");
	
	// 아래 if문이 없으면 결과창에서 op(연산자)를 value 값으로 받는 바람에 
	// 어떤 연산자인지 사용자가 보기 힘들어 만듦
	if(op.equals("0"))
	{
		op="연산자 미선택";
		result="연산 불가";
	}
	//if(result.equals("0"))
	//	result="연산 불가";
	if(op.equals("1"))
		op="덧셈";
	if(op.equals("2"))
		op="뺄셈";
	if(op.equals("3"))
		op="곱셈";
	if(op.equals("4"))
		op="나눗셈";
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습</h1>
	<h2>Receive11.jsp</h2>
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