/*=======================
	HelloReceive02.java
=======================*/

package com.test.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
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
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		String title = "결과 수신 페이지";
		String subTitle = "HelloReceive02.java";
		String docType = "<!DOCTYPE html>";
		
		out.print(docType + "\n");
		out.print("<html>\n");
		out.print("<head>\n");
		out.print("<title>\n");
		out.print(title + "\n");
		out.print("</title>\n");
		out.print("</head>\n");
		out.print("</html>\n");
		out.print("<body bgcolor=\"f0f0f0\">\n");
		out.print("<div>\n");
		out.print("<h1>\n");
		out.print(title + "\n");
		out.print("</h1>\n");
		out.print("<p>\n");
		out.print(subTitle + "\n");
		out.print("</p>\n");
		out.print("<hr>\n");
		out.print("</div>\n");
		
		out.print("<div>\n");
		out.print("<ul>\n");
		out.print("<li>\n");
		out.print("<b>\n");
		out.print("First Name : ");
		out.print("</b>\n");
		out.print(request.getParameter("firstName") + "\n");
		out.print("</li>\n");
		out.print("<li>\n");
		out.print("<b>\n");
		out.print("Last Name : ");
		out.print("</b>\n");
		out.print(request.getParameter("lastName") + "\n");
		out.print("</li>\n");
		out.print("</ul>\n");
		out.print("</div>\n");
		
		out.print("</body>\n");
		out.print("</html>\n");
		
		
		
		
		
	}
	
}