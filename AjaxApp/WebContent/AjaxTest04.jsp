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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #f33;
	}

	p
	{
		margin: 0px;
	}
</style>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
	
	function check()
	{
		//alert("함수호출확인");
		
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test04.do?id=" + id;
		
		// AJAX 객체 생성(XMLHttpRequest 객체 생성)
		ajax = createAjax();
		
		// 환경 설정(『open("메소드방식", "URL", 비동기/동기)』)
		ajax.open("GET", url, true);
		
		// readystatechange
		// ajax.readystatechange
		// ajax.onreadystatechange
		// ajax.onreadystatechange = function name(){}
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					// 업무 처리
					//-- 아이디 중복 검사의 결과를 통보받아
					//   사용자에게 메세지 출력(안내)
					callBack();
				}
			}
		}
		
		ajax.send("");
		
	} // close check()
	
	function callBack()
	{
		// 1. 서버에서 응답한 데이터가 텍스트일 경우 (단일 데이터)
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		if(data==0)
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		
	}
	
</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<h2>아이디 중복검사</h2>
	<hr />
	
	<p>- AjaxTest04.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- com.test.ajax.Test04.java</p> <!-- Servlet (중복검사를 맡는 곳)-->
	<p>- Test04Ok.jsp</p>
	<p>- web.xml</p>
	<p>- URL : test04.do</p>
	<p>- DB 연동 → 자료구조 대체 활용<!--  → admin, superman은 등록되어 있다 가정 --></p>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control txt"/>
			<input type="button" value="중복 검사" class="control btn" onclick="check()" />
			<span id="result">
				<!-- 중복 검사에 대한 결과 처리 -->
				<!-- → 사용 가능한 아이디 입니다. -->
				<!-- → 이미 사용중인 아이디 입니다. -->
			</span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control txt" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control txt" />
		</td>
	</tr>
	
</table>
<br /><br />

<div style="text-align : center;">
   :<br>
   :<br>
   :<br>
</div>


</body>
</html>