<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<p>사칙 연산 수행(Send11.jsp)</p>
</div>

<!-- ○ 포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습 -->
<!-- 
		1. 사칙연산 수행을 위한 정수 입력 페이지를 구성한다. 
		
		2. 연산자를 함께 입력받을 수 있도록 페이지를 구성한다
		   (Send11.jsp)
		   
		3. 사용자의 최초 요청 페이지
		   → http://localhost:8090/WebApp06/Send11.jsp
		
		4. 연산 전용 페이지를 구성한다 → 후에 이 부분을 JAVA → Servlet 으로
		   (Redirect11.jsp)				  만드는 것을 고려함이다
		   ※ 스크립릿 코드만 존재 → JAVA 코드
		
		5. 최종 결과 출력 페이지를 구성한다
		   (Receive11.jsp)
-->

<div>
   <form method="post">
      <table class="table" style="width: 500px;">
      
         <tr>
            <th>정수1</th>
            <th>연산자</th>
            <th>정수2</th>
         </tr>
         
         <tr>
            <td>
               <input type="text" name="num1" class="txt" style="width: 100px;">
            </td>
            <td>
               <select name="op"style="width: 100px;">
                  <option value="0">연산 선택</option>	<!-- value 값을 숫자로 하는 이유? --> 
                  <option value="1">더하기</option>		<!-- Redirect11.jsp 에서 확인 -->
                  <option value="2">빼기</option>
                  <option value="3">곱하기</option>
                  <option value="4">나누기</option>
               </select>
            </td>
            <td>
               <input type="text" name="num2" class="txt" style="width: 100px;">
            </td>
         </tr>
         
      </table>
         
      <br>
         
      <button type="submit" class="btn"
       style="width: 500px; height: 36px;"
       onclick="this.form.action='Redirect11.jsp'">확인</button>
   
   </form>
</div>


</body>
</html>