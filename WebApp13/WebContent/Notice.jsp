<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>
</head>
<body>

	<div>
		<h1>안내</h1>
		<hr>
	</div>

	<div>
		<p>해당 회원의 <span>성적데이터</span>가 이미 등록되어 있으므로 삭제가 불가능합니다</p>
		<p>삭제를 위해서는 해당 회원의 성적 데이터를 삭제한 후 처리하시기 바랍니다</p>
		<br><br>
		
		<a href="MemberSelect.jsp">목록으로 돌아가기</a>
	</div>

</body>
</html>