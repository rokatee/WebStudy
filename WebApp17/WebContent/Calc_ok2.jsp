<%@ page contentType="text/html; charset=UTF-8"%>

<%
	/*
	String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1);
	String strSu2 = request.getParameter("su2");
	int su2 = Integer.parseInt(strSu2);
	*/
%>

<%
	/*
	// 이전 페이지(Calc.jsp)로부터 데이터 수신
	// su1, op, su2
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op     = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	
	String str = "";
	
	if (strSu1 == null || strSu2 == null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해 객체 생성
		Calc ob = new Calc();
		// → 이클립스 자동 완성 기능을 사용하여 구문을 작성할 경우
		//	  %@page import="com.test.Calc"% 구문도 함께 처리됨
		//    혹은, 자동 완성 기능을 사용하지 않을 경우도
		//    %@page import="com.test.Calc"% 이와 같은 구문을
		//    직접 작성해서 해당 클래스를 사용할 수 있도록 처리해야 함
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
	}
	*/
	
%>
<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 이 구문은 스크립릿 영역에서
     com.test.Calc ob = new com.test.Calc();
     을 작성하여 처리한 것과 마찬가지의 효과를 적용시키게 된다 -->

<!-- request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터를
     Calc 객체 ob 에 넘겨주기 위한 속성 지정 -->

<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- 이 구문은 스크립릿 영역에서
     ob.setSu1(su1); 과 같은 구문 -->
     
<%-- <jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/> --%>
<%-- <jsp:setProperty property="op"  name="ob" value="<%=op %>"/> --%>

<!-- check!!! -->
<!-- 속성 이름과 동일한 파라미터인 경우
     getParameter() 메소드 없이 바로 받을 수 있다 -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op"  name="ob"/>






     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	
	<div>
		<h1>두 번째 방법의 처리 결과</h1>
		<hr>
	</div>
	
	<div>
		<h2><%=ob.result() %></h2>
	</div>
	
</body>
</html>