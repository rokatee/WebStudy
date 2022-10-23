/*==================
	BoardDAO.java
==================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, dto.getNum());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getPwd());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getSubject());
		pstmt.setString(6, dto.getContent());
		pstmt.setString(7, dto.getIpAddr());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
	
	// DB 레코드의 갯수를 가져오는 메소드 정의
	// → 검색 기능을 작업하며 수정하게 될 메소드
	public int dataCount() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 
	// 읽어오는 메소드 정의
	// → 검색 기능을 작업하며 수정하게 될 메소드
	public ArrayList<BoardDTO> list(int start, int end) throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
				  + " FROM "
				  + " ( "
				  + "     SELECT ROWNUM RNUM, DATA.*"
				  + "     FROM"
				  + "	  ("
				  + "			 SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') CREATED"
				  + "			 FROM TBL_BOARD ORDER BY NUM DESC"
				  + "     ) DATA"
				  + " )"
				  + " WHERE RNUM >= ? AND RNUM <= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		while(rs.next())
		{
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("NUM"));
			dto.setName(rs.getString("NAME"));
			dto.setName(rs.getString("SUBJECT"));
			dto.setNum(rs.getInt("HITCOUNT"));
			dto.setName(rs.getString("CREATED"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int hitCount(int num) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT +1 WHERE NUM = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO content(int num) throws SQLException
	{
		BoardDTO result = null;
		
		String sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT"
						+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') CREATED"
				  + " FROM TBL_BOARD"
				  + " WHERE NUM = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		pstmt.setInt(1, num);
		
		while(rs.next())
		{
			result = new BoardDTO();
			
			result.setNum(rs.getInt("NUM"));
			result.setName(rs.getString("NAME"));
			result.setPwd(rs.getString("PWD"));
			result.setEmail(rs.getString("EMAIL"));
			result.setName(rs.getString("SUBJECT"));
			result.setContent(rs.getString("CONTENT"));
			result.setIpAddr(rs.getString("IPADDR"));
			result.setNum(rs.getInt("HITCOUNT"));
			result.setName(rs.getString("CREATED"));
			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int remove(int num) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM TBL_BOARD WHERE NUM = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
		
	}
	
	// Article.jsp 페이지 내에서
	// 해당 게시물의 내용을 수정하는 메소드 정의
	public int update(BoardDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE TBL_BOARD"
				  + " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
				  + " WHERE NUM = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPwd());
		pstmt.setString(3, dto.getEmail());
		pstmt.setString(4, dto.getSubject());
		pstmt.setString(5, dto.getContent());
		pstmt.setInt(6, dto.getNum());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
		
	}
	
	
	// 이전 게시물 번호 얻어내기
	public int beforeNum(int num) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
				  + " FROM TBL_BOARD"
				  + " WHERE NUM < ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("NUM");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 다음 게시물 번호 얻어내기
	public int nextNum(int num) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
				  + " FROM TBL_BOARD"
				  + " WHERE NUM > ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("NUM");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
}
