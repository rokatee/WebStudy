<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// GetTest02ok.jsp
	String username = request.getParameter("username").toString();
	//-- toString()을 붙이는 이유
	//   어떤 타입인지 확신할 수 없기 때문에 (문자열이라는 보장이 없음)
	
	String resultDiv = username + "님, 점심은 <br />뭐 드실 건가요?";
%>
<%-- <%=username %>님, 점심은 <br />뭐 드실 건가요? --%>
<%--= resultDiv --%>

${param.username}