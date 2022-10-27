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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<table class="table">
		<tr>
			<td>이름</td>
			<td>전화번호</td>
			<td>주소</td>
		</tr>
		
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.name }</td>
			<td>${dto.tel }</td>
			<td>${dto.addr }</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>