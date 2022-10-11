<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer sb = new StringBuffer();
	sb.append("<ul>");
	
	for(int i=1; i<=9; i++)
		sb.append(String.format("<li>5 * %d = %02d</li>", i, 5*i) );
	
	sb.append("</ul>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test007.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>스크립릿과 표현식을 이용하여 구구단 5단을 구성하여 출력하는 JSP 페이지를 작성한다</p>	
		
	<form>
		<div>
			<%=sb.toString() %>
		</div>
	</form>
</div>

</body>
</html>