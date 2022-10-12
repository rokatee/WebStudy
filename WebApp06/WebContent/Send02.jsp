<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--
   ○ 데이터 송수신 관련 실습 02
   
      - 이름과 국어점수 영어점수 수학점수를 서버로 전송하여.
      (Send02.html)
      
      - 페이지 레이아웃
      -------------------------------------------------------
      
      이름       [      ]
      국어점수   [      ]
      영어점수   [      ]
      수학점수   [      ]
      
      < 성적 처리 >
      
      --------------------------------------------------------
      
      - 성적처리 버튼 클릭 시
      『홍길동님, 성적 처리가 완료되었습니다.
        회원님의 점수는 국어:xx점 영어:xx점 수학:xx점 입니다.』
      라는 내용을 출력하는 JSP 페이지를 작성한다.
      (Receive02.jsp)
      
      - 사용자의 최초 요청 페이지는
      『http://localhost:8090/WebApp06/Send02.jsp』로 한다.

  -->

<div>
	<h1>데이터 송수신 관련 실습 02</h1>
	<hr>
</div>

<!-- <form action="Receive02.jsp" method="get"> -->
<!-- get 방식은 넘긴 데이터값이 주소창에 보인다 -->
<form action="Receive02.jsp" method="post">
<!-- post 방식은 넘긴 데이터값이 주소창에 보이지 않는다
     post 방식은 이름을 넘길 때, 한글이 깨질 것
     이유는 Receive02.jsp 에서 사용 중인 
     request 객체는 자바에서 운용되고 있고
	 자바는 UTF-8이 아닌 다른 방식이기에 깨진 것
     해결방법은 Receive02.jsp 에서 확인 → request.setCharacterEncoding() -->
	<table class="table">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="userName" class="txt"> 
			</td>
		</tr>

		<tr>
			<th>국어점수</th>
			<td>
				<input type="text" name="kor" class="txt"> 
			</td>
		</tr>
			
		<tr>
			<th>영어점수</th>
			<td>
				<input type="text" name="eng" class="txt"> 
			</td>
		</tr>
			
		<tr>
			<th>수학점수</th>
			<td>
				<input type="text" name="mat" class="txt"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="성적 처리" class="btn">
				<input type="reset" value="다시 입력" class="btn">
			</td>
		</tr>		
	</table>
</form>

</body>
</html>