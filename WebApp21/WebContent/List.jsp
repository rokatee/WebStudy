<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBConn.getConnection();
	
	BoardDAO dao = new BoardDAO(conn);
	int current_page = 1;
	
	int start = (current_page-1);
	int end = (current_page+1);
	
	ArrayList<BoardDTO> list = dao.list(start, end);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>게시판</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<tr>
		<!-- 
			<td>1</td>
			<td>안녕하세요</td>
			<td>홍길동</td>
			<td>2022-10-23</td>
			<td>0</td>
		</tr>
		 -->
		<%
		for(BoardDTO dto : list)
		{
		%>
		<tr>
			<td><%=dto.getNum() %></td>
			<td><%=dto.getSubject() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getCreated() %></td>
			<td><%=dto.getHitCount() %></td>
		</tr>
		<%
		}
		%>
		 
	</table>
</div>

<div>
	<form action="" name="searchForm" method="post">
		<select>
			<option value="subject">제목</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search" class="txt">
		<input type="button" value="검색" class="btn" onclick="sendIt()">
	</form>
</div>

<div>
	<form action="Created.jsp">
		<a href="javascript:createdSubmit()"><button type="button">글쓰기</button></a>
	</form>
</div>

</body>
</html>