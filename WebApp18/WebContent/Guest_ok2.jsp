<%@page import="com.test.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String str1 = "";
	String str2 = "";
	String str3 = "";
	
	GuestDTO dto = new GuestDTO();
	
	dto.setUserName(userName);
	dto.setSubject(subject);
	dto.setContent(content);
	
	str1 = dto.getUserName();
	str2 = dto.getSubject();
	str3 = dto.getContent();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습_2</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인_2</h2>
	
	<h3>이름 : <%=str1 %></h3>
	<h3>제목 : <%=str2 %></h3>
	<h3>내용<br>
	<%=str3.replaceAll("\n",	"<br>").replaceAll(" ", "&nbsp;") %>
	</h3>
	
</div>

</body>
</html>