package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 주요 기능 구성(메소드 정의)
	// 데이터베이스 연결 메소드 정의
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	// 입력이므로 sql은 INSERT문 -> executeUpdate -> 행의 개수 세는 int 반환
	public int add(ScoreDTO dto) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	// 리스트 전체 출력 메소드 정의
	// (sid, name, kor, eng, mat, tot, avg)
	// 가 한 묶음인 것을 여러 행 출력 해야 하니 -> ScoreDTO들
	// 그걸 ArrayList<E> 을 사용해 담는 것
	public ArrayList<ScoreDTO> list() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR + ENG + MAT) AS TOT"
				+ ", ROUND( ( (KOR + ENG + MAT)/3.0),1) AS AVG"
		  + " FROM TBL_SCORE"
		  + " ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();

			// ScoreDTO의 주요 속성 변수가 public 일 경우
			// dto.sid = rs.getString("SID"); -> 가능
			// 하지만, private 이므로 setSid 부터 ㄱ
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			// ArrayList가 가지고 있는 add라는 메소드
			// ArrayList<ScoreDTO> 타입의 result 변수에 dto 데이터 추가
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 인원 수 확인을 위한 메소드 정의
	public int count() throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// 작업 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 쿼리문 실행 → select 쿼리문 → ResultSet 반환
		ResultSet rs = pstmt.executeQuery();
		
		// ResultSet 처리 → 반복문 구성
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
}
