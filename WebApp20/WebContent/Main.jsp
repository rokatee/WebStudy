<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="font-size: 9pt;">

<div>
	<table style="width: 600px;" border= "1">
		<tr>
			<td colspan="2">
				<!-- 1번 영역 -->
				<jsp:include page="Top.jsp" flush="false"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width: 200px;">
				<!-- 2번 영역 -->
				<jsp:include page="Left.jsp" flush="false"></jsp:include>
			</td>
			<td>
				메인 화면 영역<br>
				- 직접 내용 구성 가능<br>
				- 혹은 다른 jsp에서 가져올 수 있음<br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- 3번 영역 -->
				<jsp:include page="Bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</div>

</body>
</html>