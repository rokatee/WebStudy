<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// 이전 페이지(Test2.java)로부터 데이터 수신
	// result 라는 이름의 str 데이터
	// request.setAttribute() → request.getAttribute()
	String str = (String)request.getAttribute("result");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>최종 결과값 수신</h1>
	<hr>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>