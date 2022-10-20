<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 데이터 수신 ( SessionTest02.jsp 페이지로 부터... )
	// userName, userBirth, userId, userPwd
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// SessionTest02.jsp에서 userName과 userBirth를 받지 않은 경우 
	// getParameter()로는 SessionTest01.jsp에서 넘긴 값을 못 불러오므로
	// getAttribute()를 사용해 받아와야 한다
	// 하지만 SessionTest02.jsp에서 input태그에서 hidden 속성을 쓴다면
	// getParameter() 사용 가능
/* 	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth"); */
	String userName = (String)session.getAttribute("uName");
	String userBirth = (String)session.getAttribute("uBirth");	
	
	//session.removeAttribute("userName");
	//session.removeAttribute("userBirth"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>이름, 생일, 아이디, 패스워드 출력(SessionTest03.jsp)</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=userName %> </h2>
	<h2>생일 : <%=userBirth %></h2>
	<h2>아이디 : <%=userId %></h2>
	<h2>패스워드 : <%=userPwd %></h2>
</div>
</body>
</html>