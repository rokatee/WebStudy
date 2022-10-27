package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	private String name, tel, addr;
//
//	// default 생성자 형태의 사용자 정의 생성자 추가
//	public MemberDTO()
//	{
//		
//	}
//	
	// 매개변수 2개인 사용자 정의 생성자
	public MemberDTO(String name, String tel, String addr)
	{
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}
	
	// getter / setter
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	
	
}
