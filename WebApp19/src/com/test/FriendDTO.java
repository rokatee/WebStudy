/*==========================
	FriendDTO.java
==========================*/

package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name;		// 이름
	private int age;			// 나이
	private String gender;		// 성별
	private String[] idelType;	// 이상형
	// 이상형은 여러 개의 데이터가 동시에 전달되므로
	// (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	// 배열로 처리할 수 있다
	
	// getter / setter
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIdelType()
	{
		return idelType;
	}
	public void setIdelType(String[] idelType)
	{
		this.idelType = idelType;
	}
	
	
	
}
