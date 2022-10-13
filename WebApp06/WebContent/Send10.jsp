<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- ○ 포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습 -->
<!-- 
		1. 사칙연산 수행을 위한 정수 입력 페이지를 구성한다. 
		
		2. 연산자를 함께 입력받을 수 있도록 페이지를 구성한다
		   (Send10.jsp)
		   
		3. 사용자의 최초 요청 페이지
		   → http://localhost:8090/WebApp06/Send10.jsp
		
		4. 연산 전용 페이지를 구성한다 → 후에 이 부분을 JAVA → Servlet 으로
		   (Forward10.jsp)				  만드는 것을 고려함이다
		   ※ 스크립릿 코드만 존재 → JAVA 코드(+ jsp:forward 액션 태그)
		
		5. 최종 결과 출력 페이지를 구성한다
		   (Receive10.jsp)
-->

<div>
	<h1>포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습</h1>
	<h2>Send10.jsp</h2>
	<hr>
</div>

<form action="" method="post">
	<div>	
		정수1<input type="text" name="num1">
		<select name="op" style="text-align: center;">
			<option value="덧셈">덧셈</option>
			<option value="뺄셈">뺄셈</option>
			<option value="곱셈">곱셈</option>
			<option value="나눗셈">나눗셈</option>
		</select>
	</div>	
	<div>
		정수2<input type="text" name="num2">
	</div>
	<br><br>
	
	<button type="submit" class="btn" onclick="this.form.action='Forward10.jsp'">포워드</button>	
</form>

</body>
</html>