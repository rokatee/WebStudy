<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--
	// PostTest02ok.jsp
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String resultDiv = "제목 : <b>" + title + "</b><br>내용 : " + content; 

--%>
<%--=resultDiv --%>

제목 : <b>${param.title}</b>
<br />
내용 : ${param.content}