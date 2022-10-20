<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = (String)session.getAttribute("userName");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{	
		// 테스트 
		//alert("함수호출확인");
		
		var f = document.forms[0];
		//alert(f);
		
		if(!f.userName.value)
		{
			alert("이름을 입력해야 합니다.");
			f.userName.focus();
			return;
		}
		
		if(!f.userBirth.value)
		{
			alert("생일을 입력해야 합니다");
			f.userBirth.focus();
			return;
		}
		
		f.submit();
		
	}
</script>
</head>
<body>
<!-- 
      ○ SessionTest01 에서 이름과 생일을 입력받아 전송 받아서
         SessionTest02로 전송   
         
         SessionTest02 에서 사용자로부터  아이디와 패스워드를 입력받고
         앞에서 전달받은 이름과 생일을 함께
         SessionTest03 으로 전송
         
         TestSession03 에서 
         전달받은 이름, 생일, 아이디, 패스워드 출력
         
         01------------------------ 02------------------------- → 03
         이름, 생일              아이디, 패스워드              이름, 생일, 아이디, 패스워드
         입력                    입력                      출력
                           - getParameter()               - getAttribute()
        
         ※ 즉, 01 에서 02 로 넘겨줄 땐 getParameter
            02 에서 03 으로 넘겨줄 땐 getParameter 와 getAttribute 로 세션 활용
            01 에서 03 으로 넘겨줄 수 없기 때문에 세션에 저장
            
         ※ session 외에 hidden 태그를 이용한 정보 전달 가능 hidden도 되는데 session을 써봐라
 -->
<div>
	<h1>이름과 생일(SessionTest01.jsp)</h1>
	<hr>
</div>

<div>
	<form action="SessionTest02.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" class="txt" size="10">
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="text" name="userBirth" class="txt" size="10">
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<button type="button" onclick="sendIt()" class="btn" 
					style="width: 400px; height: 40px; font-size: 17px;">
					다음 페이지로 전송</button>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>