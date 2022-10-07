/*================================
	Test004.java
	- 서블릿(Servlet) 관련 실습
================================*/

// 현재... 자바 기본 클래스 Test004
// 이를... 서블렛 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 → Servlet

package com.test;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test004 extends GenericServlet
{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
	}

}
