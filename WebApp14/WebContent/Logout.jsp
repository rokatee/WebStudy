<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// Logout.jsp

	request.setCharacterEncoding("UTF-8");
	
	// 세션의 사용자 이름 삭제
	session.removeAttribute("userName");
	
	// 세션에 저장되어 있는 모든 항목을 제거하고 세션을 초기화
	session.invalidate();
	
	// 클라이언트들에게 다시 SessionTest01.jsp 를 요청할 수 있도록 안내
	response.sendRedirect("SessionTest01.jsp");
	
%>
