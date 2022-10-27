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
<title>MemberInsertForm2.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

	<div>
		<form action="MemberInsert2.jsp" method="post" name="myForm">
			<c:forEach var="inwon" begin="1" end="5" step="1">
				${inwon }이름 : <input type="text" name="name${inwon }" id="name" class="txt"><br>
				번호 : <input type="text" name="tel${inwon }" id="tel" class="txt"><br>
				주소 : <input type="text" name="addr${inwon }" id="addr" class="txt"><br>
				<br><br>
			</c:forEach>
			
			<button type="submit" class="btn" >입력</button>
			<br><br>
		</form>
	</div>
	
</body>
</html>