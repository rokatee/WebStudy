<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	StringBuffer str = new StringBuffer();
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th class='telTh'>전화번호</th>");
		str.append("<th style='width: 200px;'>회원관리</th>");
		str.append("</tr>");
		
		for(MemberDTO member : dao.list())
		{
			str.append("<tr>");
			str.append("<td>" + member.getSid() +"</td>");
			str.append("<td>" + member.getName() +"</td>");
			str.append("<td>" + member.getTel() +"</td>");
			str.append("<td>");
			
			str.append("<a><button type='button' class='btn01'>수정</button></a>");
			str.append("<a><button type='button' class='btn01'>삭제</button></a>");
			
			str.append("</td>");
			str.append("</tr>");
			
		}
		
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">
</head>
<body>
	<div>
		<h1>회원 명단 관리 및 출력 페이지</h1>
		<hr>
	</div>
	
	<div>
		<a href="MemberScoreSelect.jsp"><button type="button" class="btn">회원 성적 관리</button></a>
		<a href="MemberInsertForm.jsp"><button type="button" class="btn">신규 회원 등록</button></a>
		<br><br>
	</div>
	
	<div>
		<!-- 리스트 출력 -->
		<%=str.toString() %>
		<!-- 	
		<table class="table">
			<tr>
				<th class="numTh">번호</th>
				<th class="nameTh">이름</th>
				<th class="telTh">전화번호</th>
				<th style="width: 200px;">회원관리</th>
			</tr>
			<tr>
				<td>1</td>
				<td>조현하</td>
				<td>010-1111-1111</td>
				<td>
					<a><button type="button" class="btn01">수정</button></a>
					<a><button type="button" class="btn01">삭제</button></a>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>임시연</td>
				<td>010-2222-2222</td>
				<td>
					<a><button type="button" class="btn01">수정</button></a>
					<a><button type="button" class="btn01">삭제</button></a>
				</td>
			</tr>
		</table>
	 	-->	
	</div>
</body>
</html>