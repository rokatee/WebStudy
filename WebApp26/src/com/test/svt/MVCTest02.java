/*=======================
	MVCBegin.java
	- Controller 역할을 수행할 서블릿 클래스
=======================*/

package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02 extends HttpServlet
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
		// 서블릿 관련 코딩
		
		// 모델 객체 생성 및 결과 수신(View)
		MVCTest02Model model = new MVCTest02Model();
		String view = model.actionCount(request, response);
		
		//String view2 = "WEB-INF/view/MVCTest02.jsp";
		
		// 포워딩
		//RequestDispatcher dispatcher = request.getRequestDispatcher(view2);
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	
}
