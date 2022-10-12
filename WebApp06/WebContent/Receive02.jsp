<%@page import="java.io.PrintWriter"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 한글 처리를 위한 인코딩 방식 지정(한글 깨짐 방지)
	// 데이터를 꺼내기 전에 바꾸어야 함(아래 request를 하기 전에 입력해야 함)
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	//String kor = request.getParameter("kor");
	int kor = Integer.parseInt(request.getParameter("kor"));
	//String eng = request.getParameter("eng");
	int eng = Integer.parseInt(request.getParameter("eng"));
	//String mat = request.getParameter("mat");
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	int tot = kor + eng + mat;
	double avg = tot / 3.0;

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<span style="font-weight: bold;">
		<%=userName %>
	</span>님, 성적 처리가 완료되었습니다.
	<br>
	회원님의 점수는<br>
	국어 : <span style="font-weight: bold;"><%=kor %></span><br>
	영어 : <span style="font-weight: bold;"><%=eng %></span><br>
	수학 : <span style="font-weight: bold;"><%=mat %></span><br>
	총점 : <span style="font-weight: bold;"><%=tot %></span><br>
	평균 : <span style="font-weight: bold;"><%=String.format("%.1f", avg) %></span><br>
	입니다.
</div>

</body>
</html>