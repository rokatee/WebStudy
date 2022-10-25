<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Create_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 수신한 데이터로 구성된 dto
	//  - jspBean을 통해
	//    Create.jsp 에서 dto 의
	//	  name, pwd, subject, email, content 는 받았지만
	//    num, ipAddr 은 받지 못했다 (누락된 데이터)
	//	  ( → created 와 hitCount는 디폴트값을 사용하고 있으므로 필요 없음)
	
	// 1. 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 2. 확보한 게시물 번호 최대값에 1을 더해서 다시 set 하기
	dto.setNum(maxNum + 1);
	
	// 3. IP Address set 하기
	// 테스트
	//String ipTest = request.getRemoteAddr();
	dto.setIpAddr(request.getRemoteAddr());
	
	// 데이터베이스 insert 액션을 수행하기 위한 메소드 호출
	dao.insertData(dto);
	
	DBConn.close();
	
	// 클라이언트에 List.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("List.jsp");


%>
<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!-- 최대값 잘 받아지는지 확인(Line 27) -->
<%=maxNum %>

<!-- IP 잘 받아지는지 확인 (Line 35) -->
<%=ipTest %>
</body>
</html>
 --%>