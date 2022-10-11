<%@ page contentType="text/html; charset=UTF-8"%>

<%
   // 스크립릿 영역
   
   int money, initMoney;
   money = initMoney = 990;
   
   int m500=0, m100=0, m50=0, m10=0;
   
   m500 = money/500;
   money = money%500;      //money%=500;
   
   m100 = money/100;
   money = money%100;      //money%=100;
   
   m50 = money/50;
   money = money%50;      //money%=50;
   
   m10 = money/10;
   money = money%10;      //money%=10;


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asample.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1>스크립릿 / 표현식 실습</h1>
   <hr>
</div>

<div>
   <h2>문제 해결</h2>
   <p>990원을 화폐 단위로 구분하여 출력하는 JSP 페이지를 작성한다.</p>
   
   <form>
      <h3>대상 금액 : <%=initMoney %> 원</h3>
   <h3>화폐 단위</h3>
   <h4>- 오백원 : <%=m500 %>개</h4>
   <h4>- 백원 : <%=m100 %>개</h4>
   <h4>- 오십원 : <%=m50 %>개</h4>
   <h4>- 십원 : <%=m10 %>개</h4>
   
   
   </form>
</div>

</body>
</html>