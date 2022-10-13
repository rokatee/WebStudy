<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	
	String temp = request.getParameter("userInput");
	
	if(temp==null)
	{
		temp = "수신데이터 없음";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06_02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

   <!-- ○ 데이터 송수신 실습 06
      - 달력을 출력하는 jsp 페이지를 구성한다.
      - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
      - 단, submit버튼 없이 이벤트 처리를 할 수 있도록 한다. 
      - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
      - 년도구성은 현재년도 기준 이전 10년, 이후 10년으로 구성한다.
      - 월은 1월부터 12월까지로 구성한다.
      
      - 페이지 레이아웃
      ----------------------------------------------------------
       2012        1
         :         :
      [2022▼]년 [10▼]월
         :         :
       2032        12
      ----------------------
      
      ----------------------
      [ 달력이 그려지는 위치다]
        
     -->
<div>
   <h1>데이터 송수신 실습 06</h1>
   <hr>
</div>

<div>
   <h2>달력 구성</h2>
   
   <form>
		<input type="text" id="userInput" name="userInput" class="txt">
		<br><br>
		
		<button type="submit" class="btn">테스트</button>
		<button type="reset" class="btn">취소</button>
		<br><br>
		
		<h2>수신된 데이터 : <%=temp %></h2>		
   </form>
</div>

</body>
</html>