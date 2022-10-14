<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
   
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR); 
    int month = cal.get(Calendar.MONTH)+1;
    int day = cal.get(Calendar.DAY_OF_MONTH);
   
    String yearStr = request.getParameter("year");
    String monthStr = request.getParameter("month");
   
    int selectYear = year;
    int selectMonth = month;
    
    if(yearStr != null)
    	selectYear = Integer.parseInt(yearStr);
   
    if(monthStr != null)
    	selectMonth = Integer.parseInt(monthStr);
   
    cal.set(selectYear, selectMonth-1, 1);    //출력할 년도, 월로 설정
   
    selectYear = cal.get(Calendar.YEAR);    //변화된 년, 월
    selectMonth = cal.get(Calendar.MONTH) + 1;
   
    int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);    //해당월의 마지막 날짜
    int w = cal.get(Calendar.DAY_OF_WEEK);    //1~7(일~토)
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SendAndReceive07_02.jsp</title>
<style type="text/css">
    *{padding: 0px; margin: 0px;}  /* 브라우저별 기본 여백 차이가 있기에 작성한다. */
    body{font-size: 9pt;}
    td{font-size: 9pt;}
    a{cusor: pointer; color: black; text-decoration: none; font-size: 9pt; line-height: 150%;}
    a:HOVER, a:ACTIVE{font-size: 9pt; color: orange; text-decoration: underline;}
    .table1{margin-left:auto; margin-right:auto; width:210px; border:0;}
    .table2{margin-left:auto; margin-right:auto; width:210px; border:0; background-color: lightgrey;}
</style>
</head>
<body>
	<br/>&nbsp;<br/>
	
	    <table class="table1">
	        <tr height="30">
	            <td align="center">
	                <a href="SendAndReceive07_02.jsp?year=<%=selectYear%>&month=<%=selectMonth-1%>">◀</a>
	                <b><%=selectYear %>년 <%=selectMonth %>월</b>
	                <a href="SendAndReceive07_02.jsp?year=<%=selectYear%>&month=<%=selectMonth+1%>">▶</a>
	            </td>
	        </tr>
	    </table>
	   
	    <table class="table2">
	        <tr height="25">
	            <td align="center" bgcolor="gainsboro"><font color="red">일</font></td>
	            <td align="center" bgcolor="gainsboro">월</td>
	            <td align="center" bgcolor="gainsboro">화</td>
	            <td align="center" bgcolor="gainsboro">수</td>
	            <td align="center" bgcolor="gainsboro">목</td>
	            <td align="center" bgcolor="gainsboro">금</td>
	            <td align="center" bgcolor="gainsboro"><font color="blue">토</font></td>
	        </tr>
	        <%
	            int newLine = 0;
	            //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
	            out.println("<tr height='25'>");
	            for(int i=1; i<w; i++)
	            {
	                out.println("<td bgcolor='white'>&nbsp;</td>");
	                newLine++;
	            }
	           
	            String fc, bg;
	            for(int i=1; i<=end; i++)
	            {
	               fc = (newLine == 0)?"red":(newLine==6)?"blue":"black";
	            	   
	               if(selectYear==year && selectMonth==month && i==day)
	            	   fc="aqua";
	            	   
	            	   
	                bg = "white";
	                out.println("<td align='center' bgcolor=" + bg + "><font color=" + fc + ">"
	                        + i + "</font></td>");
	                newLine++;
	                if(newLine == 7 && i != end)
	                {
	                    out.println("</tr>");
	                    out.println("<tr height='25'>");
	                    newLine = 0;
	                }
	            }
	           
	            while(newLine>0 && newLine<7)
	            {
	                out.println("<td bgcolor='white'>&nbsp;</td>");
	                newLine++;   
	            }
	            out.println("</tr>");
	        %>
	    </table>
</body>
</html>
