<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<%
	String str = "";

	if(ob.getIdelType() != null)
	{
		for(String temp : ob.getIdelType())
		{
			str += temp + " ";
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<h2>등록 수신결과 확인</h2>
	
	<h3>이름 : <%=ob.getName() %></h3>
	<h3>나이 : <%=ob.getAge() %></h3>
	<h3>성별 : <%=ob.getGender() %></h3>
	<h3>친구이상형 : <%=str %></h3>
	
</div>

</body>
</html>