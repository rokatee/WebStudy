<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// MemberUpdate.jsp
	
	// 이전 페이지(MemberUpdateForm.jsp)로부터 데이터 수신
	// uName, uTel(변경해야할 값), sid(필요한 값)

	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		// dao의 modify() 메소드를 호출하는 과정에서 인자로 넘겨야 하는
		// MemberDTO 객체가 필요하다
		MemberDTO member = new MemberDTO();
		
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트가 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberSelect.jsp");
	
%>
