<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	StringBuffer str = new StringBuffer();
	
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>");
		
		// 리스트를 얻어내기 위해 ScoreDAO 객체의 list() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for(ScoreDTO score : dao.list())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + score.getAvg() + "</td>");
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
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input {width: 200px;}
	button {width: 210px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	th {background: #EEE;}
	#scoreCount{font-size:small; color:blue; font-weight:bold;}
</style>
<script type="text/javascript">
	
	function formCheck()
	{
		//alert("함수호출확인");
		
		var uName  = document.getElementById("userName");
		var nMsg   = document.getElementById("nameMsg");
		var korStr = document.getElementById("kor");
		var kor    = Number(korStr.value);
		var korMsg = document.getElementById("korMsg");
		var engStr = document.getElementById("eng");
		var eng    = Number(engStr.value);
		var engMsg = document.getElementById("engMsg");
		var matStr = document.getElementById("mat");
		var mat    = Number(matStr.value);
		var matMsg = document.getElementById("matMsg");
		
		nMsg.style.display  = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}	
		if(isNaN(korStr.value) == true || korStr.value == "" || kor < 0 || kor > 100)
		{
			korMsg.style.display = "inline";
			korStr.focus();
			return false;
			
		}
		if(isNaN(engStr.value) == true || engStr.value == "" || eng < 0 || eng > 100)
		{
			engMsg.style.display = "inline";
			engStr.focus();
			return false;
			
		}
		if(isNaN(matStr.value) == true || matStr.value == "" || mat < 0 || mat > 100)
		{
			matMsg.style.display = "inline";
			matStr.focus();
			return false;
			
		}
		
		return true;
		
	}

</script>
</head>
<body>
	<div>
		<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
			<table>
				<tr>
					<th>이름(*)</th>
					<td>
						<input type="text" id="userName" name="userName" class="txt">
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td>
						<input type="text" id="kor" name="kor" class="txt">
						<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td>
						<input type="text" id="eng" name="eng" class="txt">
						<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td>
						<input type="text" id="mat" name="mat" class="txt">
						<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해야 합니다</span>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" id="btnAdd" class="btn">성적 데이터 등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br><br>
	
	<div>
		<%=scoreCount %>
		<!-- <span id="scoreCount">전체 인원 수 : 10명</span> -->
		
		
		<%=str.toString() %>
		<!-- 
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어점수</th>
				<th>영어점수</th>
				<th>수학점수</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<tr>
				<td>1</td>
				<td>김태민</td>
				<td>90</td>
				<td>80</td>
				<td>70</td>
				<td>xxx</td>
				<td>xx.x</td>
			</tr>
			<tr>
				<td>2</td>
				<td>최동현</td>
				<td>90</td>
				<td>80</td>
				<td>70</td>
				<td>xxx</td>
				<td>xx.x</td>
			</tr>
		</table>
		 -->
	</div>
</body>
</html>