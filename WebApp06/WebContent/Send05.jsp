<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function pageChange(obj)
	{
		//alert("함수호출확인");
		
		obj.submit();
		
	}

</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 05
	   - 구구단 결과를 출력하는 JSP 페이지를 구성한다.
	   - 원하는 단수를 입력받아 화면에 출력해주는 형태의 페이지로 구현한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	     (Send05.html)
	   
	     단 수 선택 	[ 1단  ▼] → select
	                      2단
	                      3단
	                       :
	                      9단
	                      
	   - select box 선택 시
	     해당 단의 구구단 내용을 출력하는 JSP 페이지로
	     데이터를 전달하여 내용을 구성할 수 있도록 한다.
         (Receive05.jsp)
	     
	   - 사용자의 최초 요청 주소는
	     『http://localhost:8090/WebApp06/Send05.html』 로 한다.
 -->

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 입력</h2>
	<div>
		<form action="Receive05.jsp" method="get">
			<!-- <select name="dan" onchange="this.form.submit()"> -->
			<!-- → 위의 방식은 자바스크립트 함수가 필요 없음 -->
			<select name="dan" onchange="pageChange(this.form)">
				<option>==단수 선택==</option>
				<!-- "단수 선택"을 골랐을 때 에러 안뜨게 하는 방법은? -->
				<!-- 자스 함수에서 처리해야 하나? -->
				<option value="1" style="text-align: center;">1단</option>
				<option value="2" style="text-align: center;">2단</option>
				<option value="3" style="text-align: center;">3단</option>
				<option value="4" style="text-align: center;">4단</option>
				<option value="5" style="text-align: center;">5단</option>
				<option value="6" style="text-align: center;">6단</option>
				<option value="7" style="text-align: center;">7단</option>
				<option value="8" style="text-align: center;">8단</option>
				<option value="9" style="text-align: center;">9단</option>
			</select>
		</form>
	</div>
</div>


</body>
</html>