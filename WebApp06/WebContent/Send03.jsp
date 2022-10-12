<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--  
	○ 데이터 송수신 실습 03
	   - 두 개의 정수와 선택한 연산자를 서버로 전송하여
	     (Send03.jsp)
	     
	     해당 연산에 대한 결과를 받을 수 있는 JSP 페이지를 작성한다
	   
	   
	        정수1   	     연산자			   정수2 
	     [ textbox ]      [ 더하기▼ ]      [ textbox ]
	          ↑             빼기               ↑
	          45            곱하기              32
	                        나누기
	                          
	     <연산결과> → submit <취소> → button
	     
	   - 연산결과 버튼 클릭 시
	     『입력하신 48과 32의 연산 결과는 77 입니다.』
	     라는 내용을 출력하는 JSP 페이지를 구성하여
	     데이터를 전달할 수 있도록 한다.
	     (Receive03.jsp)
	   
	   - 사용자의 최초 요청 주소는
	     『http://localhost:8090:/WebApp06/Send03.jsp』
	     로 한다.
	     
	   - 즉, 두 개의 정수와 연산자를 서버로 전송하여
	     합, 차, 곱, 몫(나누기 연산)을 계산하여
	     결과를 처리하는 JSP 페이지를 작성한다.
	                      
-->

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<form action="Receive03.jsp" method="get">
	<div>
		정수1<input type="text" name="num1">

		<select name="op" style="text-align: center;">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
	</div>

	<div>
		정수2<input type="text" name="num2">
	</div>
	
	<div>
		<button class="btn">연산결과</button>
		<button type="reset" class="btn">다시입력</button>
	</div>
</form>

</body>
</html>