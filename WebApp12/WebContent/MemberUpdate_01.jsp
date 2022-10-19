<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();	
		
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
		
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
	
	response.sendRedirect("MemberSelect.jsp");
	
%>

