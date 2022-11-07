<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// LoadingTest02ok.jsp
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String telMid = request.getParameter("telMid");
	String telLast = request.getParameter("telLast");
	String location = request.getParameter("loc");
	
	String result = "";
	
	for (int i = 1; i <= 5; i++)
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + i + "\"");
		sb.append(", \"name\":\"" + name + "\"");
		sb.append(", \"tel\":\"" + tel + "\"");
		sb.append(", \"telMid\":\"" + telMid + "\"");
		sb.append(", \"telLast\":\"" + telLast + "\"");
		sb.append(",  \"loc\":\"" + location + "\"},");
		
		result += sb.toString();
	}
	
	result = result.substring(0, result.length()-1);
	
	result = "[" + result + "]";
	
	out.print(result);
	
	try
	{
		Thread.sleep(5000);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
%>
<%-- 
이름 : <%=name %><br>
전화번호 : <%=tel %>-<%=telMid %>-<%=telLast %><br>
지역 : <%=location %><br>
<br>
--%>