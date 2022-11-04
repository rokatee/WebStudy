<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxXmlTest01ok.jsp → XML 구성
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	response.setContentType("text/xml");
	//-- AJAX 객체에 데이터를 반환할 때
	//   브라우저가 이 데이터를 XML 로 인식해야 하기 때문에
	//   MIME 타입을 XML 로 선언한다
	
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<totalDataCount>5</totalDataCount>
	<%
	for (int i = 1; i <= 5; i++)
	{
	%>
	<comment num="<%=i %>">
		<title><%=title + i %></title>
		<content><%=content + i %></content>
	</comment>		
	<%
	}
	%>
</list>


<%-- 
<list>
	<totalDataCount>5</totalDataCount>
	<comment num="1">
		<title>민찬우1</title>
		<content>안녕하세요1</content>
	</comment>
	
	<comment num="2">
		<title>민찬우2</title>
		<content>안녕하세요2</content>
	</comment>
</list>
→ 이런식으로 5개가 그대로 넘어온다.
--%>