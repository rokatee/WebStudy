<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(ScoreList.jsp)로부터 데이터 수신
	// userName, kor, eng, mat
	
	String uName = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		
		score.setName(uName);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.add(score);
		/*
		int result = dao.add(score);
		
		if (result > 0)
		{
			response.sendRedirect("ScoreList.jsp");
		}
		else
		{
				response.sendError(500, "와우");
		}
		*/
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("ScoreList.jsp");

%>
