<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(MemberSelect.jsp) 로부터 데이터 수신
	// sid
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid);
		
		int checkCount = dao.refCount(sid);
		// TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		// SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 개수(존재 여부) 확인
		
		// 자식테이블 데이터가 0이면
		if(checkCount == 0)
		{
			// 제거 가능
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else	// 데이터가 0이 아니면
		{
			// 제거하지 못하는 사유를 안내하는 페이지
			// + 리스트로 돌아가는 기능
			strAddr = "Notice.jsp";
			//-- TBL_MEMBERSCORE 테이블의 데이터가 
			//   TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우는
			//   삭제가 불가능한 경우 
		}
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
	
	// 클라이언트가 strAddr 의 주소로 다시 요청할 수 있도록 안내
	response.sendRedirect(strAddr);

%>
