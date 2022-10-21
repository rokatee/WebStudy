/*==========================
	GuestDTO.java
==========================*/

package com.test;

public class GuestDTO
{
	// 주요 속성 구성
	// DTO를 작성하고 jsp빈을 사용할 때 주의할 점
	// 1. DTO의 변수명과 jsp의 인풋태그 name속성값을 똑같이 작성해야한다
	// 2. 되도록 변수명의 2번째 글자까지는 소문자로 작성하도록 한다
	private String userName;	// 이름
	private String subject;		// 제목
	private String content;		// 내용
	
	// ※ 여기에서 사용하는 변수명(속성명)의 앞 두 글자는
	//    소문자로 작성할 것
	//    numScore → getNumScore() / setNumScore()
	//    nScore   → getNScore()   / setNScore()
	//    와 같이 getter / setter 가 속성명을 불러오는 과정에서
	//    인식이 어긋나는 경우가 발생할 수 있기 때문에
	
	// ※ 여기에서 사용하는 변수명(속성명)은
	//    HTML Document(Guest.jsp)의 form 태그에서 name 속성으로 지정할 것
	//    그래야 속성 데이터 수신 및 속성에 대한 매핑을
	// 	  자동으로 편하게 처리할 수 있기 때문에
	
	// getter / setter
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	/*
	 * public String result() { String result = "";
	 * 
	 * 
	 * return result; }
	 */
}
