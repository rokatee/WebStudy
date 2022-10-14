<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 스크립트 릿 영역
	// 이전 페이지(Hap.jsp)로부터 데이터 수신
	// su1, su2
	
	// ※ 『request』 : JSP 내장 객체
	
	// 인코딩 방식을 request 접근 후 바로(처음에) 지정해 주어야
	// 즉, 파라미터에 접근해서 데이터를 꺼내기 전에 지정해 주어야
	// 한글 데이터를 깨뜨리지 않고 수신하여 처리할 수 있다.
	request.setCharacterEncoding("UTF-8");
	
	// ※ request 로부터 getParameter() 로 수신한 데이터는 String 형태로 반환
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int sum = 0;
	
	try
	{
		int n1 = Integer.parseInt(s1);
		int n2 = Integer.parseInt(s2);
		
		sum = n1 + n2;
	
	}
	catch(Exception e)
	{
		// 예외 발생 시...
		// 클라이언트의 브라우저 화면에 출력되지 않고...
		// 서버의 콘솔 창에 오류 메세지가 나오도록 구성.
		// (ex. 크롬 →  f12 → 콘솔메뉴)
		System.out.println(e.toString());
		
		// 예외 발생 시
		// 해당 내용을 서버 log 기록으로 남기는 처리.
		getServletContext().log("오류 : " + e.toString());
		
		//에러 발생시...
        //사용자가 특정 페이지를 다시 요청할 수 있도록 안내
        //response.sendRedirect("Error.jsp");
        //잘못되면 에러 페이지로 보내겠다.

	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>Hap.jsp → Hap_ok.jsp</h2>
	
	<h3>결과 : <%=sum %></h3>
	<!-- ※ 이전 페이지(Hap.jsp)로부터 정수1 또는 정수2 항목에
	        정수 형태의 숫자가 아닌 변환이 불가능한 문자나
	        빈 공백을 입력했을 경우 
	        결과 확인 버튼 클릭 시 클라이언트의 화면 처리 결과를
	        try~catch 블럭에 의해 항상 0으로 출력되는 것을 
	        확인할 수 있다. -->
</div>

</body>
</html>