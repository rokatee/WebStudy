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
<title>AjaxXmlTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 테스트
			//alert("확인");
			
			var params = "title=" + $.trim($("#title").val())
					 + "&content=" + $.trim($("#content").val());
			
			//$.ajax();
			//$.ajax({속성:값, 속성:값, 속성:값});
			/*
			$.ajax(
			{
				type:"POST"
				, url:"AjaxTest02_ok.jsp"
				, data:params
				//, async:false  	//-- 동기
					// 안써도 기본으로 들어가있는 값 → default 값은 true  
					// → true(비동기) / false(동기)
				, dataType:"xml"	// check~!!! 앞에서는 안썼던거
				, success:동작
				// └→ 어떤 형식으로 수신할 지 들어가야 한다.
				, beforeSend:true
				, error:동작
			
			});
			*/
			
			$.ajax(
			{
				type: "POST"
				, url: "AjaxXmlTest01ok.jsp"
				, data: params
				, dataType : "xml"		// check~!!
				, success : function(args)
				{
					var out = "";
					
					out = ">> 게시물 개수 : " + $(args).find("totalDataCount").text() + "<br>";
					
					// check
					// 엘리먼트 속성 접근 방법 check
					$(args).find("comment").each(function()
					{
						/*
						<list>
							<totalDataCount>5</totalDataCount>
							
							<comment num="1">
								<title>민찬우1</title>
								<content>안녕하세요1</content>
							</comment>
							
							<comment num="2">
								<title>민찬우2</title>
								<content>안녕하세요2</content>
							</comment>
						</list>
						→ 이런식으로 5개가 그대로 넘어온다.
						*/
						
						// 각각의 엘리먼트에 접근하는 방법 check
						var item = $(this);			// <comment></comment> 엘리먼트 한 구성씩을 말함
						// item.attr("num")			// <comment> 엘리먼트의 num 속성
						var num = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						// 엘리먼트 내용 접근 방법 check
						out += "<br>=======================";
						out += "<br> 번호 : " + num;
						out += "<br> 제목 : " + title;
						out += "<br> 내용 : " + content;
						out += "<br>=======================<br>";
						
					});

					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
				}
				// title, content 잘 들어있는지 확인
				, beforeSend :showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus();
			
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

<div>
	<h1>jQuery ajax() 관련 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목 <input type="text" id="title" class="txt" />
	<br /><br />
	
	내용 <input type="text" id="content" class="txt" />
	<br /><br />
	
	<input type="button" class="btn" id="sendBtn" value="전송 확인">
	
</div>

<div id="resultDiv">
</div>

</body>
</html>