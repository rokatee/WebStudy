<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 받아오기(이전 페이지로부터 데이터 수신)
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	// 캘린더 객체
	Calendar cal = Calendar.getInstance();
	
	// 현재 날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 기본적으로 이와 같이 년, 월 구성(default)
	// 고른 날짜 년, 월 (그려야 할 달력의 년, 월 구성)
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// 즉, 사용자가 넘겨준 년, 월에 대한 데이터가 존재할 경우
	// 설정하는 년, 월에 대한 내용을 이와 같이 변경
	if(yearStr != null || monthStr != null)
	{
		selectYear = Integer.parseInt(yearStr);
		selectMonth = Integer.parseInt(monthStr);
	}
	//----------여기까지 수행하면 상황에 따라 그려야 할 달력의 년, 월 구성 완료
	
	// 셀렉트박스에서 고른 년도 변수?
	String yearOption = "";
	
	// 셀렉트박스에서 다른 년도 고르면, 셀렉트박스 내의 년도 숫자 바뀌게
	// ex) 2022년 고르면 셀렉트박스에 2032 ~ 2012까지 보이게
	for(int year = (selectYear - 10); year <= (selectYear + 10); year++)
	{
		// 페이지 처음 열었을 때
		//if(yearStr == null && year == selectYear)
		if(year == selectYear)
		{
			// 현재 년도가 제일 먼저 보이도록? 
			yearOption += "<option value='" + year + "' selected='selected'>" + year + "</option>\n";
			// 구문 끝에 \n 을 넣은 이유 → 페이지 소스 볼 때(ctrl+U) option태그가 줄 바뀜되어 사용자가 편하게 볼 수 있도록
		}
		
		// 페이지 오픈 후, 다른 년도 선택 시
		else
		{
			// 다른 년도 보이도록		
			yearOption += "<option value='" + year + "' >" + year + "</option>\n";
		}
	}
	
	// 셀렉트박스에서 고른 월 변수
	String monthOption = "";
	
	// 셀렉트박스에 1 ~ 12월까지 보이도록
	for(int month = 1; month <= 12; month++)
	{
		// 페이지 처음 열었을 때
		//if(monthStr == null && month == selectMonth)
		if(month == selectMonth)
		{
			// 현재 월이 제일 먼저 보이도록
			monthOption += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		//페이지 오픈 후, 다른 월 선택 시
		else
		{
			// 다른 월 보이도록
			monthOption += "<option value='" + month + "' >" + month + "</option>\n";
		}
	}
	//---------------여기까지 수행하면
	// 그려야 할 달력의 년, 월의 최종 선택 및 그에 따른 select 구성 완료
	
	// 여기서 부터는 달력 그리기
	
	// 각 달의 마지막 날 수 배열 구성
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectYear % 4 == 0 && selectYear % 100 != 0 || selectYear % 400 == 0)
		months[1] = 29;
	
	// 요일 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 총 날 수를 누적할 변수 선언
	int nalsu = 0;
	
	// 선택한 년도의 이전 년도까지의 총 날 수 연산
	nalsu = (selectYear - 1) * 365 + (selectYear -1) / 4 - (selectYear - 1) / 100 + (selectYear - 1) / 400;
	
	// 선택한 월의 이전 월까지의 날 수 누적 연산
	for (int i = 0; i < selectMonth - 1; i++)
		nalsu += months[i];
	
	// 선택한 월 1일의 추가 누적 연산
	nalsu++;	// nalsu += 1;
	
	// 요일 변수 선언
	int week = 0;
	week = nalsu % 7;
	
	// 마지막 날짜 변수 선언
	int lastDay = 0;
	lastDay = months[selectMonth-1];
	
	// 달력을 그릴 문자열 변수 선언
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for (int i = 0; i < weekName.length; i++)
	{
		if(i == 0)
			calStr 	+= "<th class='sun'>" + weekName[i] +  "</th>";
		else if(i == 6)
			calStr 	+= "<th class='sat'>" + weekName[i] +  "</th>";
		else
			calStr 	+= "<th>" + weekName[i] +  "</th>";
			
	}
	
	calStr += "</tr>";
	calStr += "<tr>";
	
	// 해당 월의 1일이 시작하기 전의 빈칸 공백 td 발생
	for(int i = 1; i <= week; i++)
		calStr += "<td></td>";
		
	// 해당 월의 날짜 td 발생
	for(int i = 1; i <= lastDay; i++)
	{
		// 날짜가 그려지는 동안 요일 증가
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
			
		
		// 일요일을 그리기 전 기존 tr을 마무리하고, 새로운 tr 구성
		if(week % 7 == 0)
		{
			calStr += "</tr><tr>";
		}
	}
	
	// 해당 월의 마지막 날짜 td 구성을 완료한 후
	// 빈 칸 공백 td 발생
	for(int i = 0; i <= week; i++, week++)
	{
		if(week % 7 == 0)
			break;
		calStr += "<td></td>";
	}
	
	calStr += "</tr>";
	calStr += "</table>";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	td {text-align: right;}
	.nowSat{background-color: aqua; font-weight: bold; color: blue;}
	.nowSun{background-color: aqua; font-weight: bold; color: red;}
	.now{background-color: aqua; font-weight: bold;}
	.sun{color:red;}
	.sat{color:blue;}
</style>

<script>

	function actionCalendar(obj)
	{
		// 매개변수로 넘겨받은 객체 → form 객체
		// form 객체 submit 액션 처리
		obj.submit();
	}

</script>

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
   
   <!-- action 속성과 속성값 생략 → 요청 페이지는 자기 자신 / 데이터의 수신처 자기 자신 -->
   <form method="post">
		<select name="year" id="year" onchange="actionCalendar(this.form)">
			<%=yearOption %>
		</select>년
		<select name="month" id="month" onchange="actionCalendar(this.form)">
			<%=monthOption %>
		</select>월
   </form>
</div>

<div>
	<!-- 달력을 그리게 될 위치 -->
	<%=calStr %>
</div>

</body>
</html>