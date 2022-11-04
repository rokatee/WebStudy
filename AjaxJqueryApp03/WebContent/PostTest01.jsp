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
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	
	.txtNum
	{
		width: 100px;
		text-align: right;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	// ○ 『$.post(url, data, callBack);』
	//	  - 매개변수로 넘겨받은 url 을 사용하여 서버에 대한 POST 요청을 전송한다
	//	  - 매개변수
	//      ·url      : (String) POST 메소드로 연결하는 서버 측 URL
	//      ·data     : (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체
	//				     미리 구성 및 인코딩 된 쿼리 스트링
	//      ·callBack : (Function) 요청이 완료되면 호출되는 함수
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// post 방식으로 처리
			$.post("PostTest01ok.jsp"
			, {
				su1 : su1
				, su2 : su2
				, oper : oper
			}
			, function(args)
			{
				$("#resultDiv").html(args);
				
			});
			
			
			
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>jquery의 post() 메소드 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="su1" class="txt txtNum" />
		
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>

	<input type="text" id="su2" class="txt txtNum" />

	<input type="button" value=" = " id="sendBtn" class="btn" />

</div>
<br />

<div id="resultDiv">
	<!-- 10 + 20 = 30 -->
</div>
<br /><br />

</body>
</html>