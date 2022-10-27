<%@page import="com.test.MyData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Test04.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> list = new ArrayList<MyData>();
	
	MyData ob = new MyData("최동현", 15);
	list.add(ob);
	
	ob = new MyData("김유림", 14);
	list.add(ob);
	
	ob = new MyData("김보경", 13);
	list.add(ob);
	
	ob = new MyData("고연수", 12);
	list.add(ob);
	
	ob = new MyData("김태민", 11);
	list.add(ob);
	
	ob = new MyData("엄소연", 10);
	list.add(ob);
	
	ob = new MyData("한은영", 9);
	list.add(ob);
	
	ob = new MyData("박원석", 8);
	list.add(ob);
	
	request.setAttribute("list", list);
%>

<jsp:forward page="Test04_result.jsp"></jsp:forward>