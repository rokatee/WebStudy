<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String hobby = request.getParameter("hobby");
--%>

<%-- <%=name %>님, 나이는 <%=age %>세이며, 취미는 <%=hobby %> 입니다. --%>

${param.name }님, 나이는 ${param.age }세이며, 취미는 ${param.hobby } 입니다.
