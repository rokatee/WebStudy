<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	StringBuffer str = new StringBuffer();
	
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{
		dao = new MemberDAO();
		memberCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// 리스트를 얻어내기 위해 MemberDAO 객체의 list() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for(MemberDTO member : dao.list())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + member.getSid() + "</td>");
			str.append("<td class='record'>" + member.getName() + "</td>");
			str.append("<td class='record'>" + member.getTel() + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg {font-size: small; color: red; display: none;}
	input {width: 200px; border-radius: 6px;}
	button {width: 100%; height: 30px; font-family: 맑은 고딕; font-weight: bold;}
	input:focus {background-color: #ffeeff;}
	th {background: #EEE;}
	#memberCount{font-size:small; color:blue; font-weight:bold;}
</style>
<script type="text/javascript">
	
	function formCheck()
	{
		//alert("함수호출확인");
		
		var uName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(nameMsg.value == "")
		{
			nameMsg.style.display = "inline";
			name.Msg.focus();
			return false;
		}
		
		return true;
	}

</script>

</head>
<body>
	<div>
		<h1>데이터베이스 연동 회원관리 실습</h1>
		<hr>
	</div>
	
	<div>
		<p>DTO, DAO 개념 적용</p>
		<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
			<table>
				<tr>
					<th>이름(*)</th>
					<td>
						<input type="text" id="userName" name="userName" class="txt">
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="userTel" name="userTel" class="txt">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn" id="btnAdd">회원 추가</button>
					</td>
				</tr>
			</table>
		</form>
		<br><br>
		
		<div>
			<!-- 전체 인원 수 -->
			<!-- <span>전체 인원 수 : 10명</span> -->
			<%=memberCount %>

			<!-- 전체 인원 수 -->
			<%=str.toString() %>
			<!-- str → StringBuffer -->
			<!-- str.toString() → String -->
			<!-- 
			<table class="table">
				<tr>
					<th>번호</th><th>이름</th><th>전화번호</th>
				</tr>
				<tr>
					<td>11</td><td>김보경</td><td>010-1100-1100</td>
				</tr>
				<tr>
					<td>12</td><td>한은영</td><td>010-1200-1200</td>
				</tr>
				<tr>
					<td>13</td><td>김태민</td><td>010-1300-1300</td>
				</tr>
			</table>
			 -->
		</div>
	</div>
</body>
</html>