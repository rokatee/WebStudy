<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxXmlTest02ok.jsp
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String hobby = request.getParameter("hobby");
	int count = Integer.parseInt(request.getParameter("count"));
	
	response.setContentType("text/xml");
	//-- AJAX 객체에 데이터를 반환할 때
	//   브라우저가 이 데이터를 XML 로 인식해야 하기 때문에
	//   MIME 타입을 XML 로 선언한다

%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<%
	for (int i = 1; i <= count; i++)
	{
	%>
	<records id="<%=i %>">
		<name><%=name + i %></name>
		<age><%=age %></age>
		<hobby><%=hobby + i %></hobby>
	</records>
	<%
	}
	%>
</root>

<!-- 
<root>
	<records id="1">
		<name>민찬우1</name>
		<age>28세</age>
		<hobby>코딩1</hobby>
	</records>
	
	<records id="2">
		<name>민찬우2</name>
		<age>28세</age>
		<hobby>코딩2</hobby>
	</records>
	
</root>
→ 아이템에 개수를 입력하면 이런식으로 출력된다

-->
