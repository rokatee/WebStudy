<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	
	String result = "";
	
	//if(op.equals("0"))	// → Receive11.jsp 에서 코드를 수정해서 최종적으로 주석 처리 했음
	//	result = op;
	if(op.equals("1"))
		result = String.valueOf(num1 + num2);
	if(op.equals("2"))
		result = String.valueOf(num1 - num2);
	if(op.equals("3"))
		result = String.valueOf(num1 * num2);
	if(op.equals("4"))
		result = String.format("%.2f", num1/(double)num2);
	
	// response 객체의 주요 메소드 중 하나인
	// sendRedirect(String location)
	// : 지정된 URL(location)로 요청을 다시 전송한다
	//   이전의 요청(request)은 이 단계에서 소멸한다
	//response.sendRedirect("Receive11.jsp);
	response.sendRedirect("Receive11.jsp?num1=" + num1 + "&num2="  + num2 + "&op=" + op + "&result=" + result);
	
	/* 연산자 value값을 숫자로 하는 이유? */
	/* 연산자를 + - 와 같은 특수문자 혹은 한글로 하게되면 sendRedirect에서 링크로 넘어가지 않는다 */
%>
