<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 릿(script let) 영역
	String name = "최동현";
	name += "은 홍길동이 아니다";
	
	int result = 0;
	result = 10 + 20;	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2><%=name %></h2>
	<h3><%=result %></h3>
</div>
	
</body>
</html>