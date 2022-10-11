<%@ page contentType="text/html; charset=UTF-8"%>

<%
/*
	// case 1
	// 스크립 릿 영역
   
	StringBuffer sb = new StringBuffer();
	int count = 0;
	
	for(int i=1; i<=100; i++)
	{
	   if(i%4 == 0)
	   {
	      sb.append(String.format("%02d ", i));
	      count ++;
	
	      if(count%5 == 0)
	      {
	         sb.append("<br>");
	      }
	   }
	   
	}
*/
%>


<%
StringBuilder sb = new StringBuilder();
String str = "";
/*    
for(int i=1; i<=100; i++)
{   

   if(i%4==0)
   {
      sb.append(String.format("%d ",i));
      if(i%20==0)
      {
         sb.append("<br>");
      }
   }
} */

for(int i=4; i<=100; i+=4)
{
   str += String.format("%5d",i);
   
   if(i%(4*5)==0)
   {
      str += "<br>";
   }
   
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test010.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>1 부터 100 까지 정수의 중에서
	   4의 배수만 출력하는 JSP 페이지를 작성한다</p>
	<p>한 줄에 5개씩만 출력할 수 있도록 한다</p>
	<p>빈 줄 바꿈은 br 을 활용한다</p>
	<p>for 반복문을 활용한다</p>
	
	<form>
		내용 확인
		<div>
		
		<%-- <h1><%=sb.toString()%></h1> --%>
		<h1><%=str%></h1>
	</div>
	</form>
</div>

</body>
</html>