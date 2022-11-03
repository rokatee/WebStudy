<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제시어</title>
<style type="text/css">
.suggest {
	display: none;
	position: absolute;
	left: 11px;
	top: 131px;
}
</style>
<script type="text/javascript" src="<%=cp%>/js/httpRequest.js"></script>
<script type="text/javascript">
	function sendKeyword()
	{

		var userKeyword = document.myForm.userKeyword.value;
		if (userKeyword == "")
		{
			hide();//검색창이 비워져있으면 숨김
			return;
		}
		var params = "userKeyword=" + userKeyword;
		sendRequest("suggestClient_ok.jsp", params, displaySuggest, "POST");
	}

	function displaySuggest()
	{
		if (httpRequest.readyState == 4)
		{
			if (httpRequest.status == 200)
			{//서버응답 정상처리인 경우
				var resultText = httpRequest.responseText;//resposne로 넘어온 텍스트 할당
				//alert(resultText);
				//5|abc,ajax,abc마트
				var resultArray = resultText.split("|"); //{5, {abc,ajax,abc} } 로 나눔
				var count = parseInt(resultArray[0]);//5
				var keywordList = null;
				if (count > 0)
				{
					keywordList = resultArray[1].split(",");
					var html = "";
					for (var i = 0; i < keywordList.length; i++)
					{
						html += "<a href=\"javascript:select('"
								+ keywordList[i] + "');\">" + keywordList[i]
								+ "</a><br/>";
						//<a href="javascript:select('ajax');">ajax</a><br/>
					}
					var suggestListDiv = document
							.getElementById("suggestListDiv");
					suggestListDiv.innerHTML = html;
					show();
				} else
				{
					//count==0
					hide();
				}
			} else
			{
				//status!=200
				hide();
			}
		} else
		{
			//readyState!=4
			hide();
		}
	}//function..end

	//사용자가 제시어중에서 클릭한 키워드
	function select(selectKeyword)
	{
		//클릭한 제시어를 inputbox에 넣어줌
		document.myForm.userKeyword.value = selectKeyword;
		hide();//다른 제시어 감춤
	}
	function show()
	{
		var suggestDiv = document.getElementById("suggestDiv");
		suggestDiv.style.display = "block";
	}
	function hide()
	{
		var suggestDiv = document.getElementById("suggestDiv");
		suggestDiv.style.display = "none";
	}
	//처음 DOM이 로드되었을때 보이지 않도록
	window.onload = function()
	{
		hide();
	}
</script>
</head>
<body>
	<h1>제시어</h1>
	<hr />
	<br />
	<form action="" name="myForm">
		<input type="text" name="userKeyword" onkeyup="sendKeyword();" /> <input
			type="button" value="검색" />
		<div id="suggestDiv" class="suggest">
			<div id="suggestListDiv"></div>
		</div>
	</form>
</body>
</html>