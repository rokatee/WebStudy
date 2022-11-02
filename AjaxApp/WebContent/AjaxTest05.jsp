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
<title>AjaxTest05.jsp</title>
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
	
	function search()
	{
		//alert("함수호출확인");
		
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		// URL 준비
		var url = "test05.do?addr=" + addr;
		
		// XMLHttpRequest 객체 생성(AJAX 객체) → ajax.js
		ajax = createAjax();
		
		// 설정
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
				callBack2();
		}
		
		ajax.send("");
	}
	
	// 추출한 업무
	//-- 우편번호 검색 결과를 통보 받아서 사용자에게 안내해줄 수 있도록 처리
	function callBack2()
	{
		// XML 문서 전체의 참조 객체(흔히 XML 문서 객체라고 한다)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트
		//-- 현재 우리가 수신한 XML 문서의 최상위 엘리먼트는 『<list>』
		var root = doc.documentElement;
		
		// root(즉, <list> 엘리먼트) 하위의
		// 모든 <item> 엘리먼트들을 받아내기(반환받기)
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if (itemList.length == 0)
		{
			document.getElementById("addrResult").innerHTML
					= "<option>주소를 검색하세요.</option>";
		} 
		else
		{
			document.getElementById("addrResult").innerHTML
					= "<option value='0'>주소를 선택하세요.</option>";
		}
		
		// 검색 결과가 존재할 경우... 반복문을 순환하며 각 데이터 가져오기
		for (var i = 0; i < itemList.length; i++)
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는
			//    태그의 첫 번째 자식이고
			//    텍스트 노드의 값은
			//    nodeValue 로 가져온다
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select box 에 아이템 추가
			document.getElementById("addrResult").innerHTML
					+= "<option value='" + zipcodeText + "/" + addressText
					+ "'>[" + zipcodeText +"] " + addressText + "</option>";
		}
	}
	
</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<h2>우편번호 검색</h2>
	<hr />
	<!-- 
	<p>- AjaxTest05.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- com.test.ajax.Test05.java</p> Servlet (중복검사를 맡는 곳)
	<p>- Test05Ok.jsp</p>
	<p>- web.xml</p>
	<p>- URL : test05.do</p>
	<p>- DB 연동 → 자료구조 대체 활용 → admin, superman은 등록되어 있다 가정</p>
	 -->
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
			<input type="text" id="addr" class="control txt" placeholder="동 입력"/>
			<input type="button" value="검색하기" class="control btn" onclick="search()"/>
			<br />
			<select id="addrResult" class="control">
				<option>주소를 입력하세요</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control doNot" readonly="readonly"
			style="width: 200px;"/>
			<br />
			<input type="text" id="addr2" class="control doNot" readonly="readonly"
			style="width: 400px;"/>
			<br />
			<input type="text" id="addr3" class="control txt" placeholder="상세주소를 입력하세요"
			style="width: 400px;"/>
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