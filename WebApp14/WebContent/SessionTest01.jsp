<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// session 의 userName(key) 에 담겨있는 값(value) 요청
	String userName = (String)session.getAttribute("userName");
	// -- 최초 이 페이지를 요청한 사용자나
	// 	  로그인을 시도했지만 정상적인 로그인 과정을 거치지 못한 사용자는
	// 	  userName 을 얻지 못한 상황이지만
	// 	  정상적인 로그인 과정을 거친 사용자는
	// 	  userName 에 "최동현" 값을 받아서 이 페이지를 방문한 상황
	// 	  즉, SessionTest01_ok.jsp 에서 userName(key) 에 "최동현"(value)을
	// 	  담아서 이 페이지로 돌려보낸 상황
	// -- session.getAttribute() 는
	// 	  Object 타입을 반환하므로 String 타입으로 변환하는 과정 필요 (다운캐스팅)
	
	// ※ 세션 설정 변경 -----------------------------
		
	// ※ 세션 기본 시간(default)은 1800초
	
	session.setMaxInactiveInterval(5);
	// 세션이 유지되는 시간을 5초로 변경하여 설정한 상태
	// 이와 같이 설정을 변경했기 때문에
	// 5초 뒤 새로고침 하면 로그아웃된 상태를 확인
	
	
	// -------------------------------- 세션 설정 변경
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">
<style type="text/css">
   .btn01{font-size: small; width: 100px;}
   .btn02{font-size: small; width: 100px;}
</style>
<script type="text/javascript">
	
	function sendIt()
	{
		//alert("함수호출확인");
		
		//var f = document.getElementById("폼아이디");
		var f = document.myForm;
		
		if (!f.userId.value)
		{
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<a href=""><button type="button" class="btn01" style="width: 100px;">게시판</button></a> |
			</td>
			<td>
				<%
				if (userName == null)
				{
				%>
				<a href=""><button type="button" class="btn02" style="width: 100px;">일정관리</button></a> |
				<%
				}
				else
				{
				%>
				<a href="SessionTest02.jsp"><button type="button" class="btn01" style="width: 100px;">일정관리</button></a> |
				<%
				}
				%>
			</td>
			<td>
				<%
				if (userName == null)
				{
				%>
				<a href=""><button type="button" class="btn02" style="width: 100px;">친구관리</button></a> |
				<%
				}
				else
				{
				%>
				<a href="SessionTest03.jsp"><button type="button" class="btn01" style="width: 100px;">친구관리</button></a> |
				<%
				}
				%>
			</td>
		</tr>
	</table>
	<br><br>
	<table>
		<tr>
			<td>
				<%
				if (userName == null)
				{
				%>
				<form action="SessionTest01_ok.jsp" method="post" name="myForm">
					<table class="table">
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" name="userPwd" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="button" style="width: 100%;" onclick="sendIt()">로그인</button>
							</th>
						</tr>
					</table>
				</form>
				<%
				}
				else
				{
				%>
				<h2><%=userName %>님 환영합니다</h2>
				<h3>이제 일정 관리와 친구 관리 서비스를 이용하실 수 있습니다.</h3>
				<br><br>
				
				<p><a href="Logout.jsp">로그아웃</a>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</div>
</body>	
</html>