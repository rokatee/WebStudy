<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(Forward10_10.jsp)로부터 넘어온 데이터 수신
	// → resultStr → setAttribute() → getAttribute() → Object 반환 
	
	String result = (String)request.getAttribute("resultStr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<p>사칙 연산 수행(Receive10_01.jsp)</p>
</div>

	<h2>연산 결과 : <%=result %></h2>

</body>
</html>