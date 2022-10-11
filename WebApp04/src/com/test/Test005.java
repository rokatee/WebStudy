/*========================
	Test005.java
	- Servlet 관련 실습
========================*/

// 현재... 자바 기본 클래스 Test005
// 이를... 서블렛(Servlet) 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

							 // HttpServlet 에 마우스를 올려보면
							 // "javax.servlet.http.HttpServlet" 앞에
							 // 초록색 로고가 있다
							 // Class Abstract 라는 의미이다.
							 //  ↓↓↓
public class Test005 extends HttpServlet
{							 // 오버라이드 안했을 때도 오류가 없는 이유?
							 // → HttpServlet은 추상클래스이긴 한데
							 //    추상클래스는 무조건 추상메소드를 갖고 있는 건 아니다
							 // → 지네릭 서블릿은 추상메소드가 있는 추상클래스
							 //    Http 서블릿은 추상메소드가 없는 추상클래스
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해서 호출되어 실행되는 메소드
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청이든 post 방식의 요청이든
		// 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(Test005.jsp)로부터 데이터 수신(userId / userPwd)
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + userId + ", 패스워드 : " + userPwd;
		
		PrintWriter out = response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("Test005.java");
		out.print("</title>");
		out.print("</head>");
		
		out.print("<body>");

		out.print("<div>");
		out.print("<h1>");
		out.print("서블릿 관련 실습");
		out.print("</h1>");
		out.print("<hr>");
		out.print("</div>");

		out.print("<div>");
		out.print("<h2>");
		out.print("HttpServlet 클래스를 활용한 서블릿 테스트");
		out.print("</h2>");

		out.print("<p>");
		out.print(str);
		out.print("</p>");
		
		out.print("</div>");
		
		out.print("</body>");
		out.print("</html>");
		
	}
	
}
