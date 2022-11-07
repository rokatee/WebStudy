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
<title>LoadingTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("버튼클릭확인");
			
			var params = "name=" + $("#name").val()
					   + "&tel=" + $("#tel").val()
					   + "&telMid=" + $("#telMid").val()
					   + "&telLast=" + $("#telLast").val()
					   + "&loc=" + $("#loc").val();
			
			$.ajax(
			{
				type:"POST"
				, url:"LoadingTest02ok.jsp"
				, data:params
				, dataType:"json"
				, success:function(args)
				{
					var out = "";
					
					for (var idx = 0; idx < args.length; idx++)
					{
						var num = args[idx].num;
						var name = args[idx].name;
						var tel = args[idx].tel;
						var telMid = args[idx].telMid;
						var telLast = args[idx].telLast;
						var loc = args[idx].loc;
						
						out += "<br>=====================";
						out += "<br>번호 : " + num;
						out += "<br>이름 : " + name;
						out += "<br>전화번호 : " + tel + "-" + telMid + "-" + telLast;
						out += "<br>지역 : " + loc;
						out += "<br>=====================";
					}
					
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#tel").val("");
					$("#telMid").val("");
					$("#telLast").val("");
					$("#loc").val("");
					$("#name").focus();
					
				}
				, beforeSend:showRequest
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		$(document).ajaxStart(function()
		{
			$("#loading").show();
			$("#resultDiv").hide();
			
		}).ajaxComplete(function()
		{
			$("#loading").hide();
			$("#resultDiv").show();

		});
		
		
	});
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		if($("#tel").val()=="#")
		{
			alert("전화번호 앞자리를 선택해야 합니다.");
			$("#tel").focus();
			
			return false;
		}
		if(!$.trim($("#telMid").val()))
		{
			alert("전화번호 가운데 자리를 입력해야 합니다.");
			$("#telMid").focus();
			
			return false;
		}
		if(!$.trim($("#telLast").val()))
		{
			alert("전화번호 뒷자리를 입력해야 합니다.");
			$("#telLast").focus();
			
			return false;
		}
		if($("#loc").val()=="#")
		{
			alert("지역을 선택해야 합니다.");
			$("#loc").focus();
			
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>

<!-- 이름, 전화번호,	 		지역  -->
<!-- [  ]  [010 ▼]-[  ]-[  ]  [  ▼] -->
<!-- 단일데이터, 배열로도 만들고, 로딩 지연시켜서도 만들기 -->
<div>
	이름 : <input type="text" id="name" class="txt" />
	<br /><br />
	
	전화번호 : <select id="tel" style="text-align: center;">
		<option value="#">===선택하세요===</option>
		<option value="010">010</option>
		<option value="011">011</option>
	</select>
	-
	<input type="text" id="telMid" class="txt"/>
	-
	<input type="text" id="telLast" class="txt"/>
	<br /><br />

	지역 : <select id="loc" style="text-align: center;">
		<option value="#">===선택하세요===</option>
		<option value="seoul">서울</option>
		<option value="busan">부산</option>
	</select>
	<br /><br />
	
	<input type="button" value="등록하기" id="sendBtn" class="btn" />
	<br /><br />
	
	<div id="loading" style="text-align: center; display: none;">
		<img src="<%=cp %>/images/loading.gif" alt="loading" />
	</div>
	<br /><br />
	
	<div id="resultDiv">
	<!-- 
	이름 : 김인교<br>
	전번 : 010-1234-1234<br>
	지역 : 경기<br>
	<br>
	-->
	</div>
</div>


</body>
</html>