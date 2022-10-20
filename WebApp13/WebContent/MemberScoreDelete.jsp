<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	//MemberScoreDelete.jsp
	
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터 수신
	// sid
	String sid = request.getParameter("sid");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		dao.remove(sid);
		
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
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

	response.sendRedirect("MemberScoreSelect.jsp");
	
%>
