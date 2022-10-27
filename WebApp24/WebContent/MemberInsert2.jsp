<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// MemberInsert2.jsp
	// 이전 페이지로부터 데이터 수신
	// name, tel, addr
	
	MemberDTO dto = null;
	String name = "";
	String tel = "";
	String addr = "";
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	
	for(int i = 1; i < 6; i++)
	{
		name = request.getParameter("name"+i);
		tel  = request.getParameter("tel"+i);
		addr = request.getParameter("addr"+i);
		
		dto = new MemberDTO(name,tel,addr);
		list.add(dto);
	}

	request.setAttribute("list", list);
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>
