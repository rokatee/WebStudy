<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Gugudan.jsp)로부터 데이터 수신
	// dan
	
	//int n = Integer.parseInt(request.getParameter("dan"));
	String str = request.getParameter("dan");
	
	int n = 0;
	
	try
	{
		n = Integer.parseInt(str);
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
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>Gugudan.jsp → Gugudan_ok.jsp</h2>
<%-- 
	<%
	// 스크립릿 영역
	for (int i=1; i<=9; i++)
	{
	%>	
		<%=n %> * <%=i %> = <%=(n*i) %><br>
	<%
	// 스크립릿 영역
	}
	%>
--%>

	<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>\n");
	}
	%>
</div>

</body>
</html>