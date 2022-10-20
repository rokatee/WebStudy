<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	Cookie killCookie = new Cookie("cookieTest", null);
	// 비어있는 내용(null)으로 기존의 쿠키를 덮어쓰기 하는 개념
	
	killCookie.setMaxAge(0);
	
	response.addCookie(killCookie);
	// 처음 쿠키를 구성할 때에도(심어둘 때에도) addCookie() 로 처리하였기 때문에
	// 삭제할 때에도 addCookie() 로 처리해야 안정적으로 삭제가 이루어진다
	
	// ※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다
	//	  한 명의 클라이언트가 쿠키를 삭제했다고 해서
	//	  다른 클라이언트들의 쿠키가 삭제되는 것은 아니며(불가능)
	//	  이 쿠키의 정보는 로컬 PC에서 제어한다
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RemoveCookieTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>쿠키 정보 제거하기</h1>
	<hr>
</div>

<div>
	<h2>성공적으로 쿠키를 지웠습니다</h2>
</div>

<div>
	<a href="SetCookieTest.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	
	<a href="GetCookieTest.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
</div>

</body>
</html>