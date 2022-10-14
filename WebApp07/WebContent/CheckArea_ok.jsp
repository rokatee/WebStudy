<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(CheckArea.jsp)로부터 데이터 이전
	// name, memo, checkbox
	
	String name = request.getParameter("name");
	
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후에서 『replaceAll()』 사용 가능.
	//   『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입.
	
	String[] checkGroup = request.getParameterValues("checkGroup");
	
	String checkGroupStr = "";
	
	if(checkGroup != null)
	{
		/*
		for(int i=0; i < checkGroup.length; i++)
			checkGroupStr += " [" + checkGroup[i].toString() + "]";
		*/
		for(String item : checkGroup)
			checkGroupStr += " [" + item + "]";
	}
	else
	{
		checkGroupStr = "선택 사항 없음";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>CheckArea.jsp → CheckArea_ok.jsp</h2>

	이름 : <%=name %><br>
	<br>
	메모
	<br>
	<div style="border: 1px solid black; width: 500px;">
		<%=memo %>	<!-- <textarea> 태그로 감싸면 굳이 <div> 태그와 -->
	</div>			<!-- 스크립릿 영역에서 replaceAll()을 쓰지 않아도 된다 -->
	<br>
	이상형 : <%=checkGroupStr %><br>
</div>
</body>
</html>