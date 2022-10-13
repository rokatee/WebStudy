<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<p>사칙 연산 수행(Send10_01.jsp)</p>
</div>

<!-- 포워딩 / 리다이렉트와 관련한 중요한 실습 -->
<!-- 사칙 연산 수행을 위한 정수 입력 페이지를 구성한다 (Send11.html) -->
<!-- 연산자를 함께 입력받을 수 있도록 한다. -->

<!-- 사용자 최초 요청 페이지 -->
<!-- 『http://localhost:8090/WebApp07/Send11.html』 -->

<!-- 연산 전용 페이지 -->
<!-- 『http://localhost:8090/WebApp07/Forward.jsp』 → java → Servlet -->
<!-- ※ 스크립트 릿 코드만 존재 -->
<!--  +jsp:forward 액션 태그 -->

<!-- 최종 결과 출력 페이지 -->
<!-- 『http://localhost:8090/WebApp07/Receive11.jsp』 -->

<div>
   <form action="Forward10_01.jsp" method="post">
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
                  <option value="0">연산 선택</option>
                  <option value="1">더하기</option>
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
       style="width: 500px; height: 36px;">확인</button>
   
   </form>
</div>


</body>
</html>