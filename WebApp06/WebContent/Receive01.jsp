<%@page import="java.io.PrintWriter"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
/* 	
	PrintWriter outt = response.getWriter(); 
	
	outt.print("<!DOCTYPE html>");
	outt.print("<html>");
	outt.print("<head>");
	outt.print("<title>");
	outt.print("Receive01.jsp");
	outt.print("</title>");
	outt.print("</head>");
	   
	outt.print("<body>");
       
	outt.print("<div>");
	outt.print("<h1>");
	outt.print("데이터 송수신 관련 실습01");
	outt.print("</h1>");
	outt.print("<hr>");
	outt.print("</div>");
       
	outt.print("<div>");
	outt.print("<span style='font-weight: bold;'>" + userName + "</span>" + "님, 회원가입이 완료되었습니다.<br> 회원님께서 등록하신 전화번호는 " + "<span style='font-weight: bold;'>" + userTel + "</span>" + " 입니다.");
	outt.print("</div>");
	   
	outt.print("</body>");
	outt.print("</html>");	 
*/
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<span style="font-weight: bold;">
		<%=userName %>
	</span>"님, 회원가입이 완료되었습니다.
	<br>
	회원님께서 등록하신 전화번호는 
	<span style="font-weight: bold;">
		<%=userTel %>
	</span>입니다.
	
</div>

</body>
</html>