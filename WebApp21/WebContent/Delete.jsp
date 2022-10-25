<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Delete.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	try
	{
		int result = dao.deleteData(num);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	DBConn.close();
	
	// 사용자에게 List.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect(cp + "/List.jsp?pageNum" + pageNum);

%>