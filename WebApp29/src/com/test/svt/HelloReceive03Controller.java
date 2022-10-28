/*================================
	HelloReceive03Controller.java
=================================*/

package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.logic.HelloReceive03Model;

public class HelloReceive03Controller extends HttpServlet
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
		request.setCharacterEncoding("UTF-8");
		
		// Model 객체 연결 → 업무 로직 수행 → View 정보 얻어내기
		HelloReceive03Model model = new HelloReceive03Model();
		String viewAdvice = model.process(request, response);
		
		// View 객체 연결
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewAdvice);
		dispatcher.forward(request, response);
		
	}
	
}
