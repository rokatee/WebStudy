<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	//MemberInsert.jsp
	// 데이터 입력 액션 전담 처리 페이지
	
	// 이전 페이지(MemberInsert.jsp) 로부터 데이터 수신
	// userName, userTel
	
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		//MemberDTO 구성
		MemberDTO member = new MemberDTO();
		//member.setSid(); // → 디비에서 시퀀스로 들어감
		member.setName(name);
		member.setTel(tel);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		/*
		// add() 메소드의 반환 결과에 따른 분기 처리 가능
		int result = dao.add(member);
		
		if (result < 1)
		{
			response.sendRedirect("Error.jsp");
		}
		else
		{
			response.sendRedirect("MemberList.jsp");
		}
		*/
		
	}
	catch (Exception e)
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
	
	// URL 주소가 적혀있는 쪽지를 사용자에게 전달
	// 즉, 사용자가 다시 요청할 페이지를 안내
	response.sendRedirect("MemberList.jsp");

%>