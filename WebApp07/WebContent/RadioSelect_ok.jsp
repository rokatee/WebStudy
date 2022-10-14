<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(RadioSelect.jsp)로부터 데이터 이전
	// name, gender, major, hobby
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	if(gender.equals("M"))
		gender="M(남자)";
	else if(gender.equals("F"))
		gender="F(여자)";
	else
		gender="확인불가";
	
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	
	String hobbys = "";
	if(hobby != null)
	{
		for(String item : hobby)
			hobbys += " [" + item + "]";
	}
	else
	{
		hobbys = "선택 사항 없음";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>RadioSelect.jsp → RadioSelect_ok.jsp</h2>
</div>
<div>
<!-- 
	<h3>수신한 데이터</h3>
	<p>이름 : 홍길동</p>
	<p>성별 : M(남자)</p>
	<p>전공 : 국문학</p>
	<p>취미 : [음악감상] [맛집투어]</p>
 -->
	<h3>수신한 데이터</h3>
	<p>이름 : <%=name %></p>
	<p>성별 : <%=gender %></p>
	<p>전공 : <%=major %></p>
	<p>취미 : <%=hobbys %></p>
</div>

</body>
</html>