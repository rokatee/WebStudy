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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 테스트
			//alert("확인");
			
			// data 구성
			// jQuery 에 $.trim() 함수 존재한다.
			// value 값 얻어온거 trim() 안에 넣으면 양 쪽 공백 제거됨
			var params = "name=" + $.trim($("#name").val())
				+ "&content=" + $.trim($("#content").val());
			
			// check~!!!
			// 사용법이 여태까지 사용한 함수와 쫌 다르니 주의깊게 봐두기!!
			// jQuery 의 ajax() 함수 사용(호출)
			/*
			$.ajax(
			{
				type:"POST"					//-- "GET", "POST" 중 선택
				, url:"AjaxTest01_ok.jsp"
				, data:params 				//-- AjaxTest01_ok.jsp 에서 수신하게 되는 데이터를 의미한다.
				, success:동작				//-- 데이터요청 및 전달이 성공했을 때 처리
											//   callBack() 함수랑 똑같다고 생각하면 됨
				, beforeSend:반환값확인		//-- 요청 전 확인해야 할 항목 처리(true/false) 
											//   우리 submit할 때 true면 submit되고, false면 안되는 거 같이 동작
				, error:동작				//-- 처리 과정에서 문제가 발생했을 때
			});
			*/
			
			$.ajax(
			{
				type:"POST"					
				, url:"AjaxTest01ok.jsp"
				, data:params 				
				, success: function(args)
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}			
				, beforeSend:showRequest 	// true/false	 // check~!!!
				  //-- ※ 함수 이름만 넘겨주면 된다!!!
				  //      showRequest() [Ⅹ]
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
			
		});
	});
	
	// beforeSend:반환값확인
	// → 이 함수 독립적으로 빼서 진행했음
	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>
<!--  	
	load(), get(), post()
	=> 비동기방식으로 처리하는 jQuery함수들 
	
	jQuery에서 ajax() 라는 함수를 독립적으로 지원함
-->

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<hr />
</div>

<div>
	이름 <input type="text" id="name" class="txt" /><br /><br />
	내용
	<textarea id="content" cols="50" rows="3"></textarea>
	<br /><br />
	
	<input type="button" value="등록하기" id="sendBtn" />
</div>
<br /><br />

<div id="resultDiv">
</div>

</body>
</html>