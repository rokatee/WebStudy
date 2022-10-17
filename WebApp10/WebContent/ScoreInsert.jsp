<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(ScoreList.jsp)로부터 데이터 이전
	// userName, kor, eng, mat
	String uName = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	Statement stmt = conn.createStatement();
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" 
							+ "VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", uName, kor, eng, mat);
	
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result < 1)
	{
		response.sendRedirect("Error.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}
	
%>
