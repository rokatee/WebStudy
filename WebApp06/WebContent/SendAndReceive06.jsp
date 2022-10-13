<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%
	// 데이터 수신 (SendAndReceive06.jsp)
	request.setCharacterEncoding("UTF-8");
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("mon");
	//Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	//현재 년,월,일 확인
	int nowYear = cal.get(Calendar.YEAR); //2019
	int nowMonth = cal.get(Calendar.MONTH) + 1; //5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); //9
	/* 표시할 달력의 년,월 구성 ▶ 페이지 최초 요청을 감안한 코드 */
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	// 페이지 최초 요청이 아닐 경우 ▶수신한 데이터로 표시할 달력 년 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	/*확인한 날짜로 년도 select 옵션 구성  */
	String yOptions = "";
	String mOptions = "";
	for (int year = (selectYear - 10); year <= (selectYear + 10); year++)
	{
		// 상황 1. 페이지 최초 요청 ▶ sYear = null, 현재년도와 옵션이 같을 때
		if (sYear == null && year == nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
			// 상황 2. 페이지 최초 요청 x
		} else if (sYear != null && Integer.parseInt(sYear) == year)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
			// 상황3. 나머지 경우일 때
		} else
		{
			yOptions += "<option value='" + year + "' >" + year + "</option>";
		}
	}
	for (int month = 1; month <= 12; month++)
	{
		if (sMonth == null && month == nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		} else if (sMonth != null && Integer.parseInt(sMonth) == month)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
			// 상황3. 나머지 경우일 때
		} else
		{
			mOptions += "<option value='" + month + "' >" + month + "</option>";
		}
	}
	// 그려야할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	//(만년달력)
	int[] months = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	if (selectYear % 4 == 0 && selectYear % 100 != 0 || selectYear % 400 == 0)
	{
		months[1] = 29;
	}
	// 총 날수 누적 변수
	int nalsu;
	// 요일 항목 배열 구성
	String[] weekName = { "일", "월", "화", "수", "목", "금", "토" };
	nalsu = (selectYear - 1) * 365 + (selectYear - 1) / 4 - (selectYear - 1) / 100 + (selectYear - 1) / 400;
	for (int i = 0; i < selectMonth - 1; i++)
	{
		nalsu += months[i];
	}
	nalsu++;
	int week = nalsu % 7;//요일변수
	int lastDay = months[selectMonth - 1]; // 마지막 날짜
	/*==================== 달력 그리기 ===================================  */
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	for (int i = 0; i < weekName.length; i++)
	{
		if (i == 0)
			calStr += "<th style ='color:red;'>" + weekName[i] + "</th>";
		else if (i == 6)
			calStr += "<th style ='color:blue;'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";
	calStr += "<tr>";
	// 빈칸 공백 발생
	for (int i = 1; i <= week; i++)
	{
		calStr += "<td></td>";
	}
	// 날짜 td 발생
	for (int i = 1; i <= lastDay; i++)
	{
		week++;
		/* calStr += "<td>" + i +"</td>"; */
		if (selectYear == nowYear && selectMonth == nowMonth && i == nowDay && week % 7 == 0)
		{
			calStr += "<td class ='nowSat'>" + i + "</td>";
		} else if (selectYear == nowYear && selectMonth == nowMonth && i == nowDay && week % 7 == 1)
		{ //일요일
			calStr += "<td class ='nowSun'>" + i + "</td>";
		} else if (selectYear == nowYear && selectMonth == nowMonth && i == nowDay)
		{
			calStr += "<td class='now'>" + i + "</td>";
		} else if (week % 7 == 0)
		{
			calStr += "<td class='sat'>" + i + "</td>";
		} else if (week % 7 == 1)
		{
			calStr += "<td class='sun'>" + i + "</td>";
		} else
		{
			calStr += "<td>" + i + "</td>";
		}
		if (week % 7 == 0)
			calStr += "</tr><tr>";
	}
	for (int i = 0; i <= week; i++, week++)
	{
		if (week % 7 == 0)
			break;
		calStr += "<td></td>";
	}
	
	if(week%7!=0){
		calStr +="</tr>";		
	}
	calStr += "</table>";
	// 빈칸 공백 td 발생
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css">
<title>SendAndReceive07.jsp</title>
<style type="text/css">
td {
	text-align: right;
}
td.nowSat {
	background-color: aqua;
	font-weight: bold;
	color: blue;
}
td.nowSun {
	background-color: aqua;
	font-weight: bold;
	color: red;
}
td.now {
	background-color: aqua;
	font-weight: bold;
}
td.sat {
	color: blue;
}
td.sun {
	color: red;
}
</style>
<script type="text/javascript">
function formCalendar(obj){
	obj.submit();
}
</script>

</head>
<body>

	<!-- ○ 데이터 송수신 실습 06
		- 달력을 출력하는 jsp 페이지를 구성한다.
		- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		- 단, submit버튼 없이 이벤트를 처리한다. 
		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
		- 년도구성은 현재년도 기준 이전 10년, 이후 10년으로 구성한다.
		-월은 1월부터 12월까지로 구성한다.
		
		[2022▼]년 [5▼]월
		----------------------
		----------------------
		- 년도 select box나 월 select box의 내용 변화 시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		  
	  -->

	<div>
		<h1>데이터 송수신 실습 07</h1>
		<hr>
	</div>
	<div>
		<form name="frm" method="post">

			<select name="year" id="year" style="width: 300px;" onchange="formCalendar(this.form)">
				<%=yOptions%>
			</select>년 <select name="mon" id="mon" style="width: 300px;" onchange="formCalendar(this.form)">
				<%=mOptions%>
			</select>월

		</form>

	</div>
	<div>
		<%=calStr%>
	</div>
</body>
</html>