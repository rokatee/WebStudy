<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	#resultDiv
	{
		width: 220px;
		height: 180px;
		border: 2px solid #499bd7;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			var title = $("#title").val();
			var content = $("#content").val();
			
			$.post("PostTest02ok.jsp"
				, {
					//title:$("#title").val(), content:$("#content").val()
					title:title
					, content:content
			}, function(args)
			{
				$("#resultDiv").html(args);
			});
		});
	});

</script>
</head>
<body>

<div>
	<h1>jquery의 post() 메소드 실습</h1>
	<hr />
</div>

<div>
	제목 : <input type="text" id="title" class="txt" />
	<br />
	내용 : <input type="text" id="content" class="txt" />
	<br /><br />
	
	<input type="button" value="보내기" id="sendBtn" class="btn" />
</div>
<br /><br />

<div id="resultDiv">
	<!-- 
	제목 : <b>어쩌구</b>
	<br />
	내용 : 어쩌구
	-->
</div>

</body>
</html>