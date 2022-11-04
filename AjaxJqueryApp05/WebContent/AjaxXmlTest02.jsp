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
<title>AjaxXmlTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			var params = "name=" + $.trim($("#name").val())
					   + "&age=" + $.trim($("#age").val())
					   + "&hobby=" + $.trim($("#hobby").val())
					   + "&count=" + $.trim($("#count").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"AjaxXmlTest02ok.jsp"
				, data:params
				, dataType:"xml"
				, success:function(args)
				{
					var out = "";
					
					// 엘리먼트 속성 접근 방법 check
					$(args).find("records").each(function()
					{
						/*
						아이템 개수 : 2 를 입력했다 가정...
						<root>
							<records id="1">
								<name>민찬우1</name>
								<age>28세</age>
								<hobby>코딩1</hobby>
							</records>
							
							<records id="2">
								<name>민찬우2</name>
								<age>28세</age>
								<hobby>코딩2</hobby>
							</records>
							
						</root>
						→ 아이템에 개수를 입력하면 이런식으로 출력된다
						*/
						
						// 각각의 엘리먼트에 접근하는 방법 check
						var item = $(this);
						var id = item.attr("id");
						var name = item.find("name").text();
						var age = item.find("age").text();
						var hobby = item.find("hobby").text();
						
						// 엘리먼트 내용 접근 방법 check
						out += "<br>======================";
						out += "<br>>> id=" + id;
						out += "<br>- 이름 : " + name;
						out += "<br>- 나이 : " + age;
						out += "<br>- 취미 : " + hobby;
						out += "<br>======================<br>";
						
					});
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#age").val("");
					$("#hobby").val("");
					$("#count").val("");
					$("#name").focus();
				}
				, beforeSend:showRequest
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다");
			$("#name").focus();
			return false;
		}
		if(!$.trim($("#age").val()))
		{
			alert("나이를 입력해야 합니다");
			$("#age").focus();
			return false;
		}
		if(!$.trim($("#hobby").val()))
		{
			alert("취미를 입력해야 합니다");
			$("#hobby").focus();
			return false;
		}
		if(!$.trim($("#count").val()))
		{
			alert("아이템 개수를 입력해야 합니다");
			$("#count").focus();
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
	이름 : <input type="text" id="name" class="txt" />
	<br /><br />
	
	나이 : <input type="text" id="age" class="txt" />
	<br /><br />
	
	취미 : <input type="text" id="hobby" class="txt" />
	<br /><br />
	
	아이템 개수 : <input type="text" id="count" class="txt" />
	<br /><br />
	
	<input type="button" class="btn" id="sendBtn" value="전송 확인">
</div>
<br /><br />

<!-- 아이템 개수 3을 입력했다면 -->

<div id="resultDiv">

<!-- 
>> id=1<br>
- 이름 : 민찬우1<br>
- 나이 : 28세<br>
- 취미 : 코딩1<br>

>> id=2<br>
- 이름 : 민찬우2<br>
- 나이 : 28세<br>
- 취미 : 코딩2<br>

>> id=3<br>
- 이름 : 민찬우3<br>
- 나이 : 28세<br>
- 취미 : 코딩3<br>
-->
 
</div>

</body>
</html>