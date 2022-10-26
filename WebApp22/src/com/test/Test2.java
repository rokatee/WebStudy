/*=======================
	Test2.java
	- 서블릿 관찰
=======================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
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
		// 이전 페이지(Test2.jsp)부터 데이터 수신
		// name, age
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// 처리 및 가공
		String str = "이름 : " + name + "님, 나이 : " + age + "세";

		/*
		// 이렇게 출력할거면 jsp로 하는게 낫다
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println(str);
		*/
		
		// 포워딩 페이지에 값을 넘겨주기 위한 준비(설정)
		request.setAttribute("result", str);
		//-- str 값을 result 라는 이름으로 Test2_result.jsp로 넘길 준비
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Test2_result.jsp");
		dispatcher.forward(request, response);
		
		
		
	}
	
}
