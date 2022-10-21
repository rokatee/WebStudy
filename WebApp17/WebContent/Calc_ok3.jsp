<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
 <!-- 모든 property를 부르는 방법 → property="*" -->
<jsp:setProperty property="*"  name="ob"/>
<%-- 
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op"  name="ob"/>
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	
	<div>
		<h1>세 번째 방법의 처리 결과</h1>
		<hr>
	</div>
	
	<div>
		<h2><%=ob.result() %></h2>
	</div>
	
</body>
</html>