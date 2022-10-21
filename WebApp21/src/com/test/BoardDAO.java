/*==================
	BoardDAO.java
==================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 주요 기능 정리
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("MAXNUM");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	
}
