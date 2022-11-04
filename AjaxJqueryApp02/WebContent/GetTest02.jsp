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
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	#resultDiv
	{
		width: 180px;
		height: 180px;
		border: 2px solid #499bd7;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$("#loadBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			var username = $("#username").val();
			
			$.get("GetTest02ok.jsp"
				, {
					//"username":username
					username:username
				},	function(args)
				{
					// 인자에 대한 처리 → 업무 처리
					$("#resultDiv").html(args);
			});
		});	
		
		$("#resetBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			$("#resultDiv").empty();
			
		})
		
	});
	
	
</script>
</head>
<body>

<div>
	<h1>jquery의 get() 메소드 실습</h1>
	<hr />
</div>

<form>
	<div>
		<input type="text" id="username" class="txt" />
		<br /><br />
		<button type="button" id="loadBtn" class="btn">눌러보자</button>
		<button type="button" id="resetBtn" class="btn">리셋</button>
	</div>
</form>
<br /><br />

<div id="resultDiv">
	<!-- 
	민찬우님, 점심은 <br />
	뭐 드실 건가요?
	-->
</div>

</body>
</html>