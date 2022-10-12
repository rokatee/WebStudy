<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	
	String[] userSubject = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	if(userSubject != null)
	{
		for(int i = 0; i<userSubject.length; i++)
		{
			subjectStr += " [" + userSubject[i].toString() + "]";
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
<title>Receive04.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h3>회원가입이 완료되었습니다.</h3>
	<p>아이디 : <%=userId %></p>
	<p>패스워드 : <%=userPwd %></p>
	<p>이름 : <%=userName %></p>
	<p>전화번호 : <%=userTel %></p>
	<p>성별 : <%=userGender %></p>
	<p>지역 : <%=userCity %></p>
	<p>수강과목 : <%=subjectStr %></p>
</div>



</body>
</html>