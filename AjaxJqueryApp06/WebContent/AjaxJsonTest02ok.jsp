<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// AjaxJsonTest02ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	// ※ JSON 데이터 배열 구조
	//	  [{"키1":"값1", "키2":"값2"}, {"키3":"값3", "키4":"값4"}]
	/*
	{"num":"1", "name":"민찬우", "content":"바보"},
	{"num":"2", "name":"민찬우", "content":"바보"},
	{"num":"3", "name":"민찬우", "content":"바보"},
	{"num":"4", "name":"민찬우", "content":"바보"},
	{"num":"5", "name":"민찬우", "content":"바보"},
	*/
	
	// ↓ 맨 뒤의 ,(콤마) 제거
	
	/*
	{"num":"1", "name":"민찬우", "content":"바보"},
	{"num":"2", "name":"민찬우", "content":"바보"},
	{"num":"3", "name":"민찬우", "content":"바보"},
	{"num":"4", "name":"민찬우", "content":"바보"},
	{"num":"5", "name":"민찬우", "content":"바보"}
	*/
	
	// ↓ 
	
	/*
	[{"num":"1", "name":"민찬우", "content":"바보"},
	{"num":"2", "name":"민찬우", "content":"바보"},
	{"num":"3", "name":"민찬우", "content":"바보"},
	{"num":"4", "name":"민찬우", "content":"바보"},
	{"num":"5", "name":"민찬우", "content":"바보"}]
	*/
	
	for(int n = 1; n <= 5; n++)		// 1 2 3 4 5
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + n + "\"");
		sb.append(", \"name\":\"" + name + "\"");
		sb.append(", \"content\":\"" + content + "\"},");	
		// 맨 뒤의 ,(콤마)는 지우면 안 됨
		// → 이 구문들을 반복할 것이기 때문
		
		result += sb.toString();
	}
	
	// result 확인해보면, 마지막 요소에도 끝에 『,』 붙어있다.
	// 마지막 『,』 제거(탈락)
	// substring(): 추출 
	result = result.substring(0, result.length()-1);
	// └→ 처음부터 제일 마지막꺼 전까지 추출하겠다.
	//      뒤에 공백들어가면 길이 달라지니까 공백 주의!
	
	// [] 양쪽에 달아서 달아주기
	// json 배열 객체 구성
	result = "[" + result + "]";
	
	out.print(result);
	
	// 위에서 의도한 대로
	/*
	[{"num":"1", "name":"민찬우", "content":"바보"},
	{"num":"2", "name":"민찬우", "content":"바보"},
	{"num":"3", "name":"민찬우", "content":"바보"},
	{"num":"4", "name":"민찬우", "content":"바보"},
	{"num":"5", "name":"민찬우", "content":"바보"}]
	*/
	// 이런 형태로 받아낼 수 있다

%>