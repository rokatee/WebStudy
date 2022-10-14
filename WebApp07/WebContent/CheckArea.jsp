<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>CheckArea.jsp → CheckArea_ok.jsp</h2>
	
	<form action="CheckArea_ok.jsp" method="post">
		이름
		<br>
		<input type="text" name="name" class="txt">
		<br><br>
		
		메모
		<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형
		<br>
		<label><input type="checkbox" name="checkGroup" value="윈터">윈터</label>
		<label><input type="checkbox" name="checkGroup" value="김민정">김민정</label>
		<label><input type="checkbox" name="checkGroup" value="민둥이">민둥이</label>
		<label><input type="checkbox" name="checkGroup" value="김민둥맨둥">김민둥맨둥</label>
		<br>
		<label><input type="checkbox" name="checkGroup" value="김윈터">김윈터</label>
		<label><input type="checkbox" name="checkGroup" value="민툐링">민툐링</label>
		<label><input type="checkbox" name="checkGroup" value="겨울이">겨울이</label>
		<label><input type="checkbox" name="checkGroup" value="김두부">김두부</label>
		<br><br>
		
		<input type="submit" value="전송" class="btn" style="width: 200px;">
		
	</form>
</div>

</body>
</html>