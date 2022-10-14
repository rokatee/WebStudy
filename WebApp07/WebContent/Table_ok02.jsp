<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(Table.jsp)로부터 데이터 이전
	// su1, su2
	
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	
	int n = 0;
	
	
	try
	{
		n1 = Integer.parseInt(su1Str);
		n2 = Integer.parseInt(su2Str);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<table border="1">
	<%
	for(int i=0; i<n2; i++)
	{
	%>
	<tr>
		<%
		for(int j=0; j<n1; j++)
		{
		%>
		<td><%=n++ %></td>
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