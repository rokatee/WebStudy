<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Update_ok.jsp
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
	String strPageNum = request.getParameter("pageNum");
	int pageNum = Integer.parseInt(strPageNum);
	
	dto.setNum(num);
	dto.setIpAddr(request.getRemoteAddr());
	
	int result = dao.updateData(dto);
	// result 값에 따른 분기 처리 가능
	
	DBConn.close();
	
	// 사용자에게 해당 게시물의 Article.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("Article.jsp?pageNum=" + pageNum + "&num=" + num);

%>
