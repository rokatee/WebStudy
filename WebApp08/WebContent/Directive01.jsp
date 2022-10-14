<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%>
<!-- → 기본 default 설정 → 없어도 똑같이 적용됨  -->

<%-- <%@ page buffer="1kb" autoFlush="false" %> --%> 
<!-- 이 경우 for문의 범위가 크면 에러남 → 공간이 1kb밖에 안되며 false 이므로 -->

<%-- <%@ page buffer="10kb" autoFlush="false" %> --%> 
<!-- 이 경우 정상작동 → 10kb로 공간이 넓으므로 -->

<%-- <%@ page buffer="1kb" autoFlush="true" %> --%> 
<!-- 이 경우 정상작동 하지만 권장하지 않음 
     → 1kb는 기억할 수 있는 공간이 작아서 랜더링(?) 하는데 오래 걸린다 -->

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 추가 관찰</h1>
	<hr>
</div>

<div>
	<h1>buffer 및 autoFlush 속성</h1>

	<h3>반복문 구성</h3>
	
	<%--
	for(int i=1; i<=1000; i++)
	{
	--%>		
		<!-- 1234 -->
	<%--
	}
	--%>
	<!-- 위 아래 두 개 차이는 띄어쓰기 -->
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>