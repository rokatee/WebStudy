<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCSample01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>MVC 실습</h1>
	<hr>
</div>

<div>
	<!-- EL 을 사용하여 컨트롤러(MVCBegin.java)로 부터 수신한 데이터 처리 -->
	<h2>${message }</h2>
</div>

</body>
</html>