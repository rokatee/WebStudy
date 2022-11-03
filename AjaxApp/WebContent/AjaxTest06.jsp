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
<title>AjaxTest06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	
	#search
	{
		width: 500px;
	}
	
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 70px;
		top: 134px;
		
		display: none;
	}
	
	#list.item
	{
		padding: 1px;
	}
	
	#list #footer
	{
		background-color: #ddd;
		text-align: right;
		padding: 2px;
		font-size: 6px;
		
	}
	
</style>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
	
	// 키보드를 누를 때마다
	// 그때까지의 입력된 단어를 서버로 전송하고
	// 그에 맞는 추천 검색어를 받아올 수 있도록 처리
	function search()
	{
		// 데이터 수집(입력된 값 얻어오기)
		var search = document.getElementById("search").value;
		//alert(search);
		
		// ○ 서버로 전송하기 전에 유효성 검사 ----------------
		
		// 검색어로 입력한 내용이 있을 경우에만 전송할 수 있도록 처리
		if (search.replace(" ","") == "")
		{
			document.getElementById("list").style.display="none";
			return;
		}
		
		//완성형 한글인 경우에만 검색 키워드를 전송할 수 있도록 처리하기
        //→ 정규 표현식 사용
		var regEx = /^[가-힣]{1,}$/;
		
		if (!regEx.test(search)) // test()는 있으면 true
		{
			return;
		}
		/*
		else
         {
            alert(search);   
         }
		*/
		
		// ------------------- 서버로 전송하기 전에 유효성 검사
		
		// URL 구성
		var url = "test06.do?search="+search;
		
		// XMLHttpRequest 객체(AJAX객체) 생성
		ajax = createAjax();	//-- ajax.js
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
				{
					// 업무 내용 수행(호출)
					callBack();
				}
		}
		
		ajax.send("");
		
	}
	
	// 추출된 업무 내용
	//-- XML 목록으로
	function callBack()
	{
		// XML 문서 객체
		var doc = ajax.responseXML;
		
		// XML 최상위 엘리먼트 수신 → 지금은 <list>인 상황
		var root = doc.documentElement; //-- list

		// root 를 기반으로 모든 <item> 엘리먼트 수신
		var itemList = root.getElementsByTagName("item");
		
		// items 박스 초기화
		document.getElementById("items").innerHTML = "";
		
		for (var i = 0; i < itemList.length; i++)
		{
			// 태그가 가지는 텍스트 → 태그의 첫 번째 자식
			// 텍스트 노드의 값은 → nodeValue
			
			var word = itemList[i].firstChild.nodeValue;
			
			// items(노출지점)에 추가
			document.getElementById("items").innerHTML
			+= "<div class='item'>" + word + "</div>";
			
		}
		
		// 최종적으로 목록을 화면에 보일 수 있도록 랜더링 → 스타일 제어
		document.getElementById("list").style.display = "block";
		
	}

</script>
</head>
<body>

<div>
	<h1>추천 검색어 관련 실습</h1>
	<hr />
</div>

<div>
	검색어
	<input type="text" id="search" class="control" 
	placeholder="검색어를 입력하세요" onkeyup="search()"/>
</div>

<div id="list">
	<div id="items">
		<div class="item">가다랑어</div>
		<div class="item">가마솥</div>
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 만드는 법</div>
		<div class="item">가방끈 매듭 풀기</div>
	</div>
	
	<div id="footer">
		추천 검색어
	</div>
</div>

</body>
</html>