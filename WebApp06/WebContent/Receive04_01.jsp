<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (Send04.html → Receive04.jsp)
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = "확인불가"; 
	userGender = request.getParameter("userGender");
	String userCity = "확인불가"; 
	userCity = request.getParameter("userCity");
	
	// check~!!!
	// - 다중 선택 제어
	// - 배열 수신
	String[] userSubject = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if (userSubject != null)
	{
		for (int i=0; i<userSubject.length; i++)
		{
			subjectStr += " [" +  userSubject[i].toString() + "]";
		}
	}
	else if (userSubject == null)
	{
		subjectStr = "선택 과목 없음";
	}
	
	// ※ 추후에는 수신된 데이터를.. 쿼리문을 통해 DB에 입력하는
	//    과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 045</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	
	<!-- <p>아이디(*)  	[ textbox ]</p> -->
	<p>아이디  :	<%=userId %></p>
	
	<!-- <p>패스워드(*)    [ password ]</p> -->
	<p>패스워드  :	<%=userPwd %></p>
	<p>이름  :	<%=userName %></p>
	<p>전화번호  :	<%=userTel %></p>
	<p>성별 : <%=userGender %></p>
	<p>지역 : <%=userCity %></p>
	<p>수강과목 : <%=subjectStr%></p>
</div>

</body>
</html>