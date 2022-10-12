<%@ page contentType="text/html; charset=UTF-8"%>

<%
	//String num1 = request.getParameter("num1");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	//String num2 = request.getParameter("num2");
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	
	// 방법1
	String result = "";
	if(op.equals("+"))
		result = String.valueOf(num1 + num2);
	else if(op.equals("-"))
		result = String.valueOf(num1 - num2);
	else if(op.equals("*"))
		result = String.valueOf(num1 * num2);
	else if(op.equals("/"))
	{	
		//result = String.valueOf(num1/num2);
		//result = String.valueOf(num1/(double)num2);
		result = String.format("%.2f", num1/(double)num2); 
	}
	
	
	/*
	// 방법2
	double result1 = 0.0;
	if(op.equals("+"))
		result1 = num1 + num2;
	else if(op.equals("-"))
		result1 = num1 - num2;
	else if(op.equals("*"))
		result1 = num1 * num2;
	else if(op.equals("/"))
	{
		result1 = num1/(double)num2;
	}
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<!-- 방법1 -->
	입력하신 <span style="font-weight: bold;"><%=num1 %></span> 과 <span style="font-weight: bold;"><%=num2 %></span> 의 <span style="font-weight: bold;"><%=op %></span>  연산 결과는 <span style="font-weight: bold;"><%=result %> </span>입니다.
	<!-- 방법2 -->
	<%-- 입력하신 <span style="font-weight: bold;"><%=num1 %></span> 과 <span style="font-weight: bold;"><%=num2 %></span> 의 연산 결과는 <span style="font-weight: bold;"><%=Math.round(result1 * 100) / 100.0 %> </span>입니다. --%>
</div>

</body>
</html>