<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// LoadingTest01ok.jsp
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	try
	{
		Thread.sleep(5000);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>

<!-- 버튼 클릭하자마자 결과보여지듯 시간 별로 걸리지 않았다. -->
<!-- ==> 그래서 의도적으로 처리 시간 지연시킬 거임 -->
이름 : <%=name %>
<br>
내용 : <%=content %>
<br>
