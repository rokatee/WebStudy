<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04.html</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.msg { color: red; font-size: small; display: none;}
	tr { height: 20px; }
	input:focus { background-color: #eee; }
</style>

<script type="text/javascript">
	
	/*
	function functionTest()
	{ 
		alert("함수호출확인");
	}
	*/
	function formCheck()
	{
	    //alert("함수호출확인");
		
		//return true; 	//-- 요청 페이지로 제어권 이전
		//return false;	//-- 현재 페이지에 그대로 남아있음
		
		/*
		점검사항 체크...
		→ 문제 발생(발견) 					→ return false;
		→ 문제 발생하지 않음(발견 안됨) 	→ return true;
		*/
		
		var userId = document.getElementById("userId");
		var userPwd = document.getElementById("userPwd");
		var userName = document.getElementById("userName");
		var userTel = document.getElementById("userTel");


		var idMsg = document.getElementById("idMsg");
		var pwdMsg = document.getElementById("pwdMsg");
		var nameMsg = document.getElementById("nameMsg");
		var telMsg = document.getElementById("telMsg");
		
		
		idMsg.style.display = "none";
		pwdMsg.style.display = "none";
		// → line 68, 79
		//    경고문 사라지는 구문을 if문에서 else문으로 추가하지 않는 이유?
		//    1. 아이디 칸을 채우고 비번을 빈칸으로 두면 비번의 경고문이 뜸
		//    2. 1번 상태에서 아이디 칸을 비우고 비번을 채우면
		//       비번의 경고문이 사라지지 않음 
		// → 아이디의 if문에서 걸려버려, 비번의 else 구문까지 안가는 것
		nameMsg.style.display = "none";
		telMsg.style.display = "none";
		
		
		if (userId.value == "") //-- 아이디가 입력되지 않은 상황
		{
			//alert("아이디가 입력되지 않은 상황");
			
			idMsg.style.display = "inline";
			userId.focus();
			return false;
		}
		/*else
		{
			idMsg.style.display = "none";
		}*/
		
		if (userPwd.value == "") //-- 비밀번호가 입력되지 않은 상황
		{
			pwdMsg.style.display = "inline";
			userPwd.focus();
			return false;
		}
		/*else
		{
			pwdMsg.style.display = "none";
		}*/
		
		if (userName.value == "")  //-- 이름이 입력되지 않은 상황
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		if (userTel.value == "")  //-- 전화번호가 입력되지 않은 상황
		{
			telMsg.style.display = "inline";
			userTel.focus();
			return false;
		}
		
		return true;
	
	}
	
</script>

</head>
<body>

	<!-- 
	○ 데이터 송수신 실습 04
	   - 회원 가입과 관련한 기본 정보를 입력받는 html 페이지를 작성한다.
	   - 전송 전에 (클라이언트 측에서 작성한 내용을 서버에 제출하기 전에)
	     입력 데이터에 대한 검사 과정을 자바스크립트를 활용하여
	     추가할 수 있도록 한다.
	     
	     아이디(*)  	[ textbox ]
	     패스워드(*)    [ password ]
	     이름(*)        [ textbox ]
	     전화번호(*)    [ textbox ]
	     
	     성별			● 여자  ○ 남자
	     
	     지역           [ 서울 ▼ ]
	                      대전
	                      대구
	                      광주
	                      
	     수강과목      ㅁ자바기초 ㅁ오라클중급 ㅁJDBC심화 ㅁJSP활용
	     
	     <회원가입>  <취소>
	     
	   - 회원가입 버튼 클릭 시
	     회원 입력 정보들의 내용을 출력하는 jsp 페이지를 구성하여
	     데이터를 전달할 수 있도록 한다.
	     
	   - 사용자의 최초 요청 주소는
	     『http://localhost:8090/WebApp06/Send04.html』
	     로 한다.
	     
	  
	  ○ Send04.html
	     Receive04.jsp
	     
 -->
	<div>
		<h1>데이터 송수신 실습 04</h1>
		<hr>
	</div>
	<div>
		<!-- 
			※ form 태그의 『onsubmit』: submit 액션이 발생할 경우 처리
			   이 때 호출되는 자바스크립트 함수에서
			   return true 할 경우 Receive04.jsp 로 제어권이 넘어가게 된다.
		 -->
		<form action="Receive04_01.jsp" method="post" onsubmit="return formCheck()">
			<table class="table">
				<tr>
					<th>아이디(*)</th>
					<td><input type="text" id="userId" name="userId"
						placeholder="ex)superman">
						<span class="msg" id="idMsg">아이디를 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>패스워드(*)</th>
					<td><input type="password" id="userPwd" name="userPwd"
						placeholder="ex)1234">
						<span class="msg" id="pwdMsg">패스워드를 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>이름(*)</th>
					<td><input type="text" id="userName" name="userName"
						placeholder="ex)홍길동">
						<span class="msg" id="nameMsg">이름을 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호(*)</th>
					<td><input type="text" id="userTel" name="userTel"
						placeholder="ex)010-1111-1111">
						<span class="msg" id="telMsg">전화번호를 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><label><input type="radio" name="userGender"
							id="female" value="여성">여성</label> <label><input
							type="radio" name="userGender" id="male" value="남성">남성</label></td>
				<tr>
					<th>지역</th>
					<td>
						<select id="userCity" name="userCity">
							<option value="서울">서울</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>수강과목</th>
					<td><label><input type="checkbox" name="userSubject"
							id="check1" value="자바기초">자바기초</label> <label><input
							type="checkbox" name="userSubject" id="check2" value="오라클중급">오라클중급</label>
						<label><input type="checkbox" name="userSubject"
							id="check3" value="JDBC심화">JDBC심화</label> <label><input
							type="checkbox" name="userSubject" id="check4" value="JSP활용">JSP활용</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br>
						<button type="submit" class="btn"
							style="width: 150px; height: 50px;">회원가입</button>
						<button type="reset" class="btn"
							style="width: 150px; height: 50px;">취소</button>
						<br><br>
					</td>
						
				</tr>
			</table>
		</form>
	</div>
</body>
</html>