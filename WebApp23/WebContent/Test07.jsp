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
<title>Test07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) import문 실습</h1>
	<hr>
</div>

<div>
	<p> 『c:import』 는 URL 처리에 관여하며,
	URL 을 사용하여 다른 자원의 처리 결과를 삽입할 때 사용한다</p>
</div>

<!-- 변수 지정(url) -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<c:import url="${url }" var="impt">
	<c:param name="dan" value="9"></c:param>
</c:import>

<!-- 결과 화면 출력 -->
<!-- → 결과 화면 출력 과정에서 HTML 코드를 함께 출력하는 구문
     → 『escapeXml=""』 속성의 기본값(default)은 true 로 설정되어 있다 -->
<c:out value="${impt }" escapeXml="false"></c:out>

</body>
</html>