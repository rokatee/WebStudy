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
	// MemberInsert.jsp
	// 이전 페이지로부터 데이터 수신
	// name, tel, addr
	String name[] = request.getParameterValues("name");
	String tel[]  = request.getParameterValues("tel");
	String addr[] = request.getParameterValues("addr");
	
	
	List<MemberDTO> list = new ArrayList<MemberDTO>();

	
	for(int i = 0; i < name.length; i++)
	{
		MemberDTO dto = new MemberDTO(name[i], tel[i], addr[i]);
		list.add(dto);
	}
	
	request.setAttribute("list", list);
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>

