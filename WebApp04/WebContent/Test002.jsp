<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역 → JSP 에서 JAVA 코드를 기술하는(사용하는) 영역
	int a = 10, b = 5, c;
	c = a + b;
	
	// 자바 코드의 실행 결과는
	// 작성된 내용으로 두는 것이 아니라
	// 표현식(%= %) 에 의해 HTML 브라우저 영역에 출력된다

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<%-- 표현식 --%>
	<h2>합 : <%=a %> + <%=b %> = <%=c %></h2>
</div>

<%
	// 스크립릿 영역
	a += 100;
%>

<div>
	<%-- 표현식 --%>
	<h2>a : <%=a %></h2>
</div>

<%
	// 스크립릿 영역
	
	// ※ out : 내장 객체로서 출력 스트림이다
	
	//System.out.print("합 : " + a + " + " + b + " = " + c);
	out.print("합 : " + a + " + " + b + " = " + c);
	// 개행이 되지 않음
	out.print("합 : " + a + " + " + b + " = " + c + "<br>");
	out.print("합 : " + a + " + " + b + " = " + c + "<br>");
	// 개행이 됨
	out.println("합 : " + a + " + " + b + " = " + c);
	out.println("합 : " + a + " + " + b + " = " + c);
	// println()을 쓸 경우 개행이 아니라 공백 한 칸이 생김
	out.println("합 : " + a + " + " + b + " = " + c + "<br>");
	// println()을 쓰더라도 <br>을 붙여야 개행이 이루어짐
	
	/*
	String str = String.format("합 : %d + %d = %d", a, b, c);
	out.print(str);
	out.print(str);
	*/
	
	/*
	// \n 을 사용해도 개행은 되지 않음
	String str = String.format("합 : %d + %d = %d\n", a, b, c);
	out.print(str);
	out.print(str);
	*/
	
	// <br> 을 사용하면 개행은 됨
	String str = String.format("합 : %d + %d = %d<br>", a, b, c);
	out.print(str);
	out.print(str);
	
%>

</body>
</html>