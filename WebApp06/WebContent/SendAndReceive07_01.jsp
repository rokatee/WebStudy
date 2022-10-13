<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String sYear = request.getParameter("y");
	String sMonth = request.getParameter("m");
	
	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if(sYear!=null || sMonth!=null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	//달력 그리기
	
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if( (selectYear-1)%4==0 && (selectYear-1)%100!=0 || (selectYear-1)%400==0 )
		months[1] = 29;
	
	int nalsu=0;
	
	nalsu += ( (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400 );
	
	for (int i=0 ; i<selectMonth-1 ; i++)
		nalsu += months[i];
	
	nalsu++;
	
	int week = nalsu%7;
	int lastDay = months[selectMonth-1];
	
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	

	//표그리기
	String calStr ="";
	
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	
	for (int i=0 ; i<weekName.length ; i++)
		if(i==0)
			calStr += "<th class='sun'>"+ weekName[i] + "</th>";
		else if(i==6)
			calStr += "<th class='sat'>"+ weekName[i] + "</th>";
		else 
			calStr += "<th>"+ weekName[i] + "</th>";
		
	calStr += "</tr><tr>";
	
	//빈 칸 공백
	for (int i=1 ; i<=week ; i++)
		calStr += "<td></td>";
		
	for (int i=1 ; i<lastDay ; i++)
	{
		week++;

		// 오늘 날짜에 색 부여
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		// 토, 일 숫자에 색 부여
		else if(week % 7 == 0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week % 7 == 1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
			
		if(week%7==0)
			calStr += "</tr><tr>";
		
	}
	
	for(int i=1 ; i<=week ; i++, week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}	
		
	
	calStr += "</table>";
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	.nowSat{background-color: aqua; font-weight: bold; color: blue;}
	.nowSun{background-color: aqua; font-weight: bold; color: red;}
	.now{background-color: aqua; font-weight: bold;}
	.sun{color:red;}
	.sat{color:blue;}
</style>
<script type="text/javascript">
	
	function check(num)
	{
		var v=0;
		
		var vYear =  Number(document.getElementById("y").value);
		var vMonth = Number(document.getElementById("m").value);
		vMonth += num;
		
		// 월이 0일 때
		if(Number(vMonth)==0)
		{
			vYear-=1;
			vMonth = 12;
			
		}else if(Number(vMonth)==13)
		{
			vYear+=1;
			vMonth = 1;
		}
		
		document.getElementById("y").value = vYear;
		document.getElementById("m").value = vMonth;
		
		document.frm.submit();
	}
	
	
</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
		- 달력을 출력하는 JSP 페이지를 구성한다
		- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다
		- 단, submit 버튼 없이 이벤트 처리를 한다
		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다
		
		◀	2022 년 10 월 ▶ 
		------------------------------
		------------------------------
		
		- 『◀』 이나 『▶』 클릭 시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다
		  
		- 사용자 최초 요청 주소는
		  『http://localhost:8090/WebApp06/SendAndReceive07_01.jsp』로 한다
		  
 -->

<div>
	<h1>데이터 송수신 실습07</h1>
	<hr>
</div>

<div>
	<h2>달력 출력하기2</h2>
</div>

<div>
	<form name="frm" action="" method="post">
	<button name="before" onclick="check(-1)">◀</button>
	<input type="text" id="y" name="y" value=<%=selectYear %>> 년 
	<input type="text" id="m" name="m" value=<%=selectMonth %>> 월
	<button name="after" onclick="check(1)">▶</button>	

	<br><br>

	<%=calStr %>
	
	</form>
</div>



</body>
</html>