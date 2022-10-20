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
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(?, ?, ?, ?)";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, score.getSid());
		pstmt.setInt(2, score.getKor());
		pstmt.setInt(3, score.getEng());
		pstmt.setInt(4, score.getMat());
		
		// 데이터 수정이므로 executeUpdate 를 통해 result(결과값 변수) 에 담기
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
	
	// 성적 리스트 출력 담당 메소드
	public ArrayList<MemberScoreDTO> list() throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
						+ ", (KOR + ENG + MAT) AS TOT"
						+ ", ( (KOR + ENG + MAT)/3) AS AVG"
						+ ", RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK"
				+ " FROM VIEW_MEMBERSCORE"
				+ " ORDER BY SID";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		// MemberScoreDTO 객체 생성 및 초기화
		MemberScoreDTO score = null;
		
		while(rs.next())
		{
			score = new MemberScoreDTO();
			
			// MemberScoreDTO 를 통해 필요한 값 불러오기
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("Name"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			// DAO의 add() 메소드를 통해 결과 변수에 담기
			result.add(score);
		}
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	
	// 메소드 추가 ---------------------------------------------------------------------
	
	
	// 번호 검색 담당 메소드
	//-- 현재... 번호(SID)는 식별자의 역할을 수행하고 있으며
	//   번호를 통한 검색 결과는 한 명의 회원일 수밖에 없기 때문에
	//   반환 자료형은 ArrayList 와 같은 자료구조의 형태가 아니라
	//   MemberScoreDTO 형태로 구성한다.
	public MemberScoreDTO search(String sid) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		MemberScoreDTO result = new MemberScoreDTO();

		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID = ?";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 변경 해주거나 필요한 값 변수들 불러오기
		pstmt.setString(1, sid);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			// MemberScoreDTO를 메소드에서 이미 받아오므로 객체 생성 불필요
			//MemberScoreDTO member = new MemberScoreDTO(); → (X)
			
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
		}
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 성적 데이터 수정 담당 메소드
	public int modify(MemberScoreDTO dto) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "UPDATE TBL_MEMBERSCORE SET KOR=?, ENG=?, MAT=? WHERE SID=?";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 변경 해주거나 필요한 값 변수들 불러오기
		pstmt.setInt(1, dto.getKor());
		pstmt.setInt(2, dto.getEng());
		pstmt.setInt(3, dto.getMat());
		pstmt.setString(4, dto.getSid());
		
		// 데이터 수정이므로 executeUpdate 를 통해 result(결과값 변수) 에 담기
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
	
	// 성적 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "DELETE FROM TBL_MEMBERSCORE WHERE SID=?";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 필요한 값 변수 불러오기
		pstmt.setString(1, sid);
		
		// 데이터 수정이므로 executeUpdate 를 통해 result(결과값 변수) 에 담기
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
}
