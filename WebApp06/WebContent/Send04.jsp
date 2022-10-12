<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	
	function check()
	{
		//alert("함수호출확인");
		
		//return true; 	//-- 요청 페이지로 제어권 이전
		//return false;	//-- 현재 페이지에 그대로 남아있음
		
		var userId = document.getElementById("userId");
		var userPwd = document.getElementById("userPwd");
		var userName = document.getElementById("userName");
		var userTel = document.getElementById("userTel");
		
		if(userId.value == "")
		{
			alert("아이디를 입력하세요");
			userId.focus();
			return false;	//-- 현재 페이지에 그대로 남아있음
		}
		if(userPwd.value == "")
		{
			alert("비밀번호를 입력하세요");
			userPwd.focus();
			return false;
		}
		if(userName.value == "")
		{
			alert("이름을 입력하세요");
			userName.focus();
			return false;
		}
		if(userTel.value == "")
		{
			alert("전화번호를 입력하세요");
			userTel.focus();
			return false;
		}
		
		
		// 아이디 유효성 검사
		var idRegExp = /^[a-z]+[a-z0-9]{5,19}$/g;
					  //------ 
					  //→ 영문으로 시작(아이디의 1자리를 차지)
				      
					  //       -------------- 
				      //       → 따라서 5~19 일지라도 사용자는 6~20자리를 써야함
		if(!idRegExp.test(userId.value))
		{
			alert("영문자로 시작하는 영문자 또는 숫자 6~20자");
			userId.focus();
			return false;
		}

		// 비밀번호 유효성 검사
		var pwdRegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		
		if(!pwdRegExp.test(userPwd.value))
		{
			alert("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합");
			userPwd.focus();
			return false;
		}
		
		// 이름 유효성 검사
		var nameRegExp = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]*$/;
		//var nameRegExp = /[ㄱ-힣]/;	// 한글만
		
		if(!nameRegExp.test(userName.value))
		{
			alert("한글이나 영문만 입력 가능합니다");
			userName.focus();
			return false;
		}
		
		/*
		// 간단한 전화번호 유효성 : 하이픈 없이 숫자만, 길이제한도 없음
		if(userTel.value != userTel.value.replace(/[^0-9]/g, ""))
		{
			alert("하이픈 없이 숫자만 입력 가능합니다. ex) 01012341234");
			return false;
		}
		*/
		
		// 전화번호 유효성 검사
		var telRegExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		
		if(!telRegExp.test(userTel.value))
		{
			alert("숫자와 하이픈을 같이 입력해주세요. ex) 010-1234-1234");
			userTel.focus();
			return false;
		}
		
		return true;	//-- 요청 페이지로 제어권 이전
						//   없어도 작동은 됨
	}

</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 04
	   - 회원 가입 요청 및 처리에 대한 과정을 JSP 페이지로 구성한다.
	   - 서버로 전송 전에 (클라이언트 측에서 작성한 내용을 서버에 제출하기 전에)
	     입력 데이터에 대한 기본 검사 과정을 추가한다 
	     즉, 자바스크립트로 필수 입력 항목에 대한 입력 누락 여부 확인
	     (Send04.jsp)
	     
	     아이디(*)  	[ textbox ]
	     패스워드(*)    [ password ]
	     이름(*)        [ textbox ]		입력되지 않았을 때, "이름을 입력해야 합니다"
	     전화번호(*)    [ textbox ]
	     
	     성별			● 여자  ○ 남자
	     
	     지역           [ 서울 ▼ ]
	                      대전
	                      대구
	                      광주
	                      
	     수강과목      ㅁ자바기초 ㅁ오라클중급 ㅁJDBC심화 ㅁJSP활용
	     (수강과목은 다중 선택 가능)
	     
	     <회원가입>  <취소>
	     
	   - 회원가입 버튼 클릭 시
	     회원 입력 정보들의 내용을 출력하는 jsp 페이지를 구성하여
	     데이터를 전달할 수 있도록 한다.
	     (Receive04.jsp)
	     
	   - 사용자의 최초 요청 주소는
	     『http://localhost:8090/WebApp06/Send04.jsp』
	     로 한다.
	     
	  
	     
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
	<form action="Receive04.jsp" method="post" onsubmit="return check()">
		<table class="table">
			<tr>
				<th>아이디(*)</th>
				<td>
					<input type="text" id="userId" name="userId">
				</td>
			</tr>
			
			<tr>
				<th>비밀번호(*)</th>
				<td>
					<input type="password" id="userPwd" name="userPwd">
				</td>
			</tr>

			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
				</td>
			</tr>
			
			<tr>
				<th>전화번호(*)</th>
				<td>
					<input type="text" id="userTel" name="userTel" placeholder="ex)01012341234">
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" id="male" name="userGender" value="남성">남성</label>
					<label><input type="radio" id="female" name="userGender" value="여성">여성</label>
				</td>
			</tr>
			
			<tr>
				<th>지역</th>
				<td>
					<select id="userCity" name="userCity">
						<option value="서울">서울</option>					
						<option value="고양">고양</option>					
						<option value="남양주">남양주</option>					
						<option value="울산">울산</option>					
					</select>
				</td>
			</tr>
			
			<tr>
				<th>수강과목</th>
				<td>
					<label><input type="checkbox" id="check1" name="userSubject" value="자바기초">자바기초</label>
					<label><input type="checkbox" id="check2" name="userSubject" value="오라클중급">오라클중급</label>
					<label><input type="checkbox" id="check3" name="userSubject" value="JDBC">JDBC</label>
					<label><input type="checkbox" id="check4" name="userSubject" value="JSP심화">JSP심화</label>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button class="btn">회원 가입</button>
					<button type="reset" class="btn">다시 입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>