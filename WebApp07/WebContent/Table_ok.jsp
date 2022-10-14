<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(Table.jsp)로부터 데이터 이전
	// su1, su2
	
	String su1 = request.getParameter("su1");
	String su2 = request.getParameter("su2");
	
	int garo = Integer.parseInt(su1);
	int sero = Integer.parseInt(su2);
	
	int num = 0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<table border="1">
<!-- 
	<tr>
		<td>123</td>
		<td>456</td>
	</tr>
	<tr>
		<td>789</td>
		<td>012</td>
	</tr>
 -->	
	<%
	for(int i=0; i<sero; i++)
	{
	%>
	<tr>
		<%
		for(int j=0; j<garo; j++)
		{
		%>
		<!-- <td>★</td> -->
		<!-- <td><img src="images/winter_01.jpg" style="width: 200px;"></td> -->
		<td><%=num++ %></td>
		<%
		} 
		%>
	</tr>
	<%
	} 
	%>
</table>
</body>
</html>