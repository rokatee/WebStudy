<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터 수신
	// sid

	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String name = "";
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 이전 페이지로부터 수신한 sid 를 통해 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
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
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">
<script type="text/javascript">
	
	function memberScoreSubmit()
	{
		//alert("함수호출확인");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.value == "" || isNaN(kor.value) == true || Number(kor.value) < 0 || Number(kor.value) > 100 )
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		if (eng.value == "" || isNaN(eng.value) == true || Number(eng.value) < 0 || Number(eng.value) > 100 )
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		if (mat.value == "" || isNaN(mat.value) == true || Number(mat.value) < 0 || Number(mat.value) > 100 )
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// 최종적으로 form 을 직접 지정하여 submit 액션 수행
		memberScoreForm.submit();
	}
	
	function memberScoreReset()
	{
		//alert("함수호출확인");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		var kor = document.getElementById("kor");

		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		memberScoreForm.reset();
		kor.focus();
		
		
	}
	
</script>
</head>
<body>
	<div>
		<h1>회원 성적 관리 및 입력 페이지</h1>
		<hr>
	</div>
	
	<div>
		<a href="MemberScoreSelect.jsp"><button type="button" class="btn">회원 성적 관리</button></a>
		<br><br>
	</div>
		
		
	<div>
		<!-- 회원 성적 입력 폼 구성  -->
		<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<td>
						<!-- 1 -->
						<%=sid %>
					</td>
					<td></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<!-- 민찬우 -->
						<%=name %>
					</td>
					<td></td>
				</tr>
				<tr>
		            <th>국어점수</th>
		            <td>
		               <input type="text" id="kor" name="kor" class="txtScore">
		            </td>
		            <td>
		               <span class="errMsg" id="korMsg">
		                  0 ~ 100 사이의 국어 점수를 입력해야 합니다.
		               </span>
		            </td>
		         </tr>
		         <tr>
		            <th>영어점수</th>
		            <td>
		               <input type="text" id="eng" name="eng" class="txtScore">
		            </td>
		            <td>
		               <span class="errMsg" id="engMsg">
		                  0 ~ 100 사이의 영어 점수를 입력해야 합니다.
		               </span>
		            </td>
		         </tr>
		         <tr>
		            <th>수학점수</th>
		            <td>
		               <input type="text" id="mat" name="mat" class="txtScore">
		            </td>
		            <td>
		               <span class="errMsg" id="matMsg">
		                  0 ~ 100 사이의 수학 점수를 입력해야 합니다.
		               </span>
		            </td>
		         </tr>
			</table>
			<br><br>
			
			<a href="javascript:memberScoreSubmit()"><button type="button">입력하기</button></a>
			<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
			<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
		</form>	
	</div>	
</body>
</html>