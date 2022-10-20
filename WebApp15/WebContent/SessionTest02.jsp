<%@ page contentType="text/html; charset=UTF-8"%>

<%
	//데이터 수신( SessionTest01.jsp 페이지로부터... )
	
	request.setCharacterEncoding("UTF-8"); //-- 한글 깨짐 방지처리
	
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	session.setAttribute("uName", userName);
	session.setAttribute("uBirth", userBirth);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>
</head>
<body>
<div>
	<h1>아이디와 패스워드(SessionTest02.jsp)</h1>
	<hr>
</div>

<div>
	<form action="SessionTest03.jsp" method="post">
		<%-- 
		<input type="hidden" name="userName" value="<%=userName %>">
		<input type="hidden" name="userBirth" value="<%=userBirth %>">
		 --%>
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>	
					<input type="text" name="userId" class="txt" size="10">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>	
					<input type="text" name="userPwd" class="txt" size="10">
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<button type="button" onclick="sendIt()" class="btn" 
					style="width: 400px; height: 40px; font-size: 17px;">
					다음 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
	
</div>
</body>
</html>