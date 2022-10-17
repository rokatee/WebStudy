<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String str = "";
	
	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, ROUND(((KOR + ENG + MAT)/3.0),1) AS AVG FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th class='numTitle'>번호</th>";
	str += "<th class='nameTitle'>이름</th>";
	str += "<th class='korTitle'>국어점수</th>";
	str += "<th class='engTitle'>영어점수</th>";
	str += "<th class='matTitle'>수학점수</th>";
	str += "<th class='totTitle'>총점</th>";
	str += "<th class='avgTitle'>평균</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("KOR") + "</td>";
		str += "<td>" + rs.getString("ENG") + "</td>";
		str += "<td>" + rs.getString("MAT") + "</td>";
		str += "<td>" + rs.getString("TOT") + "</td>";
		str += "<td>" + rs.getString("AVG") + "</td>";
		
		str += "</tr>";
		
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
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
	td {text-align: center;}
	
	
	
</style>
<script type="text/javascript">
	function formCheck()
	{
		//return true;
		//return false;
		
		// 이름 
		var uName = document.getElementById("userName");
		// 이름 유효성 메세지
		var nMsg = document.getElementById("nameMsg");
		
		// 이름 유효성 검사
		var nameRegExp = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]*$/;
		//var nameRegExp = /[ㄱ-힣]/;	// 한글만
		var nMsgRegExp = document.getElementById("nMsgRegExp");
		
		// if문이 작동 되기전에 항상 초기화
		nMsg.style.display = "none";
		nMsgRegExp.style.display = "none";

		// 점수를 String으로
		var korStr = document.getElementById("kor");
		var engStr = document.getElementById("eng");
		var matStr = document.getElementById("mat");
		
		// String으로 받아온 점수를 int형으로
		var kor = Number(korStr.value);
		var eng = Number(engStr.value);
		var mat = Number(matStr.value);
		
		// 각 과목별 유효성 메세지
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");

		// if문이 작동 되기전에 항상 초기화
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// 이름 공백
		if(uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		// 이름은 한글 및 영문만
		if(!nameRegExp.test(uName.value))
		{
			nMsgRegExp.style.display = "inline";
			uName.focus();
			return false;
		}
		
		
		// 점수칸에 
		//   숫자가 아니거나			  // 공백이거나		   // 0 ~ 100 사이가 아닐 때
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
	
	/*
	// 배열에 넣는 방법
	function formCheck()
	{
		var err = [];
		var errmsg = [];
		
		err[0] = document.getElementById("name");
		err[1] = document.getElementById("kor");
		err[2] = document.getElementById("eng");
		err[3] = document.getElementById("mat");
		
		errmsg[0] = document.getElementById("nameMsg");
		errmsg[1] = document.getElementById("korMsg");
		errmsg[2] = document.getElementById("engMsg");
		errmsg[3] = document.getElementById("matMsg");
		
		for (var i = 0; i < errmsg.length; i++)
		{
			errmsg[i].style.display = "none";
		}
		
		for (var i = 1; i < errmsg.length; i++)
		{
			if (err[0].value == "")
			{	
				errmsg[0].style.display = "inline";
				return false;
			}
			
			else if(err[i].value < 0 || err[i].value > 100)
			{
				errmsg[i].style.display = "inline";
				return false;
			}
		}
		return true;
	}
	*/

</script>
</head>
<body>

<div>
	<h1>데이터베이스 연결 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다</span>
					<span class="errMsg" id="nMsgRegExp">한글이나 영문만 입력 가능합니다</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
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
	<!-- 결과 리스트 구성 -->
	<%=str %>
	<!-- 
	<table class="table">
		<tr>
			<th class="">번호</th>
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