<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">
<!-- <style type="text/css">
	input {width: 200px;}
	button {width: 210px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	th {background: #EEE;}
	#scoreCount{font-size:small; color:blue; font-weight:bold;}

</style> -->
<script type="text/javascript">
	
	function memberSubmit()
	{
		//alert("함수호출확인");
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
	  	var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
		
	}
	
	function memberReset()
	{
		//alert("함수호출확인");
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		uName.focus();
	}
	
</script>
</head>
<body>
	<div>
		<h1>회원 명단 관리 및 입력 페이지</h1>
		<hr>
	</div>
	
	<div>
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
		<br><br>
	</div>
	
	<div>
		<form action="MemberInsert.jsp" method="post" id="memberForm">
			<table class="table">
				<tr>
					<th>이름(*)</th>
					<td>
						<input type="text" id="uName" name="uName">
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="uTel" name="uTel">
					</td>
				</tr>
			</table>
			<br>
			
			<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
			<a href="javascript:memberReset()"><button type="button">다시입력</button></a>
			<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
			
		</form>
	</div>
</body>
</html>