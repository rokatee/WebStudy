/*=======================
	MVCBegin.java
	- Controller 역할을 수행할 서블릿 클래스
=======================*/

package com.test.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
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
		
		//접수된 요청 내용
		// → http://localhost:8090/WebApp26/mvctest1
		
		// 1부터 100까지의 수를 객체(컬렉션)에 저장하는 과정
		List<String> list = new ArrayList<String>();
		
		for(int i = 1; i <= 100; i++)
			//list.add(Integer.toString(i));
			list.add(String.valueOf(i));
		
		// 1부터 100까지의 수가 저장된 객체(컬렉션)를
		// 뷰(view) 페이지로 넘겨주기 위한 준비
		request.setAttribute("list", list);
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
		dispatcher.forward(request, response);
	}
	
}
