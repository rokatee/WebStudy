/*=======================
	Test06.java
=======================*/


package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test06 extends HttpServlet
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
		
		// 이전 페이지(AjaxTest06.jsp)로부터 데이터 수신
		//-- search
		
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 타이핑 중에 전송한 데이터(완성형 단어) 수신
		String search = request.getParameter("search");
		
		// DB 연결 및 액션 처리
		//~~~~~~ where colum like 'search%'; 와 같은 쿼리문 수행
		// 업무 정책에 따라
		//~~~~~~ where colum like '%search%'; 와 같은 쿼리문 수행하는 것도 가능
		// → 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 자료구조 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if (search.equals("가"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가지"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
		}
		else if (search.equals("가사"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가사 듣기"));
			list.add(new WordDTO("가사 말하기"));
			list.add(new WordDTO("가사 외우기"));
			list.add(new WordDTO("가사 만드는 법"));
		}
		else if (search.equals("가위"))
		{
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가위 갈기"));
			list.add(new WordDTO("가위 날카롭게 만드는 법"));
			list.add(new WordDTO("가위 안전하게 버리는 방법"));
			list.add(new WordDTO("가위 휴대"));
		}
		
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test06Ok.jsp");
		dispatcher.forward(request, response);
	}
}
