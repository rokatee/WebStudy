/*========================================
	MVCTest02Model.java
	- MVC에서 Model 역할을 수행할 클래스
=========================================*/

package com.test.svt;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		List<String> list = new ArrayList<String>();
		
		for (int i = 1; i <= 100; i++)
			list.add(String.valueOf(i));
		
		request.setAttribute("list", list);
		
		result = "WEB-INF/view/MVCTest02.jsp";
		
		return result;
	}
}
