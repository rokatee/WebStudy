/*============================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 객체 활용
============================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// ○ 주요 속성 구성
	private Connection conn;
	
	// ○ 주요 기능 구성(메소드 정의)
	// 데이터베이스 연결 메소드 정의
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	
	
	// 데이터 입력 메소드 정의
	// 입력이니까 sql은 INSERT문 → executeUpdate → 행의 개수를 세야하니 int 반환
	public int add(MemberDTO dto) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
					+ "VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	
	
	// 리스트 전체 출력 메소드 정의
	// (sid, name, tel)가 한 묶음인 것을 여러 개 출력 해야하니 → MemberDTO들
	// 그것을 ArrayList<E>에 담는 것 뿐
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			// MemberDTO의 주요 속성 변수가 public 일 경우
			// dto.sid = rs.getString("SID"); → 가능
			// 하지만 private 이기 때문에 setSid를 해야한다
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			// 어레이리스트가 가지고 있는 add라는 메소드
			// ArrayList<ScoreDTO>타입의 result변수에 dto데이터 추가
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
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
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
