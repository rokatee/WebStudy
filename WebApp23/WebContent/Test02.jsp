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
<title>Test02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) if문 실습</h1>
	<hr>
</div>

<div>
	<!-- form 태그의 action 속성 생략 → 데이터 수신처 및 요청 페이지는 자기 자신 -->
	<form method="post">
		정수1 <input type="text" name="su">
		<br><br>
		
		<button type="submit" class="btn"
		 style="width: 120px; font-size: 16pt">결과 확인</button>
	</form>
</div>
<br><br>

<div>
	<%-- <h2>${param.su }</h2> --%>
	<%-- 『<c:if test=""></c:if>』 : JSTL Core if문 --%>
	<%-- 『test=""』 : 조건식 지정. 파라미터로 수신한 su에 값이 있으면 --%>
	<%-- 『param.su』 : EL 을 이용한 폼 전송 데이터를 수신하는 부분--%>
	
	<%-- 1번 if 문 --%>
	<c:if test="${!empty param.su }">
		<%-- <h2>메롱~!!!</h2> --%>
		
		
		<%-- 2번 if 문 --%>
		<c:if test="${param.su % 2 == 0 }">
			<h1>${param.su }은(는) 짝수</h1>
		</c:if>
		
		<%-- JSTL Core if 문에 else 는 없다. --%>
		<%-- 3번 if 문 --%>
		<c:if test="${param.su % 2 != 0 }">
			<h1>${param.su }은(는) 홀수</h1>
		</c:if>
		
	</c:if>


</div>

</body>
</html>