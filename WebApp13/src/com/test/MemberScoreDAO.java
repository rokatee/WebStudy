/*==============================================
  	MemberScoreDAO.java
  	- 데이터베이스 액션 처리 전용 객체 활용
  	  (TBL_MEMBERSCORE 테이블 전용 DAO)
 ==============================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터 베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO score) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, score.getSid());
		pstmt.setInt(2, score.getKor());
		pstmt.setInt(3, score.getEng());
		pstmt.setInt(4, score.getMat());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 성적 리스트 출력 담당 메소드
	public ArrayList<MemberScoreDTO> list() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
						+ ", (KOR + ENG + MAT) AS TOT"
						+ ", ROUND( ( (KOR + ENG + MAT)/3.0),1) AS AVG"
						+ ", RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK"
				+ " FROM VIEW_MEMBERSCORE"
				+ " ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		MemberScoreDTO score = null;
		
		while(rs.next())
		{
			score = new MemberScoreDTO();
			
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("Name"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
}
