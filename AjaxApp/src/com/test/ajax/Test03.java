package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	// get 방식의 요청에 대해서 호출되어 실행되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// post 방식의 요청에 대해서 호출되어 실행되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// get 방식의 요청이든 post 방식의 요청이든 모두 처리할 수 있는 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String strN1 = request.getParameter("n1");
		String strN2 = request.getParameter("n2");
		String strOp = request.getParameter("op");
		
		int n1 = Integer.parseInt(strN1);
		int n2 = Integer.parseInt(strN2);
		
		int result = 0;
		
		if (strOp.equals("add"))
			result = n1 + n2;
		else if (strOp.equals("sub"))
			result = n1 - n2;
		else if (strOp.equals("mul"))
			result = n1 * n2;
		else if (strOp.equals("div"))
			result = n1 / n2;
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03Ok.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
}
