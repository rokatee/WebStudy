<%@ page contentType="text/html; charset=UTF-8"%>

<% 
	String dan = request.getParameter("gugudan");
	int nDan = Integer.parseInt(dan);
	
	String danResult = "";
	for(int i = 1; i<=9; i++)
	{
		danResult += String.format("%d * %d = %d<br>", nDan, i, (nDan*i) ); 
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<%=danResult %>
</body>
</html>