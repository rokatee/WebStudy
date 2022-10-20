/*==========================================
  	MemberDAO.java
  	- 데이터베이스 액션 처리 전용 객체 활용
  	  (TBL_MEMBER 테이블 전용 DAO)
 =========================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 변경 해주거나 필요한 값 변수들 불러오기
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		// 데이터 수정이므로 executeUpdate 를 통해 result(결과값 변수) 에 담기
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
	
	// 회원 리스트 출력 담당 메소드
	public ArrayList<MemberDTO> list() throws SQLException
	{
		// 결과값 변수 선언
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		// MemberDTO 객체 생성 및 초기화;
		MemberDTO member = null;
		
		while (rs.next())
		{
			member = new MemberDTO();
			// 변경 해주거나 필요한 값 변수들 불러오기
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			// add() 메소드를 결과값 변수(result)에 담기
			result.add(member);
		}
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql  = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		// 변경 해주거나 필요한 값 변수들 불러오기
		while(rs.next())
			result = rs.getInt("COUNT");
		
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
	
	
	
	// 회원 데이터 검색 담당 메소드(sid 를 가지고 회원 데이터 조회
	public MemberDTO searchMember(String sid) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		MemberDTO result = new MemberDTO();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=?";
		
		// pstmt를 통해 sql 호출 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 시드값 넘기기
		// 메소드 매개변수의 sid를 String 으로 받았기 때문
		pstmt.setString(1, sid);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			// MemberDTO를 메소드에서 이미 받아오므로 객체 생성 불필요
			//MemberDTO member = new MemberDTO(); → (X)
			
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
		}
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 수정 담당 메소드
	public int modify(MemberDTO member) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 변경 해줄 값 변수들 불러오기
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setString(3, member.getSid());
		
		// 데이터 수정이므로 executeUpdate 를 통해 result(결과값 변수) 에 담기 
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "DELETE FROM TBL_MEMBER WHERE SID=?";
		
		// sql과 연결할 PreparedStatement 호출 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 쿼리문에서 필요한 값 불러오기
		pstmt.setString(1, sid);
		
		// 데이터 수정에 필요한 executeUpdate를 통해 result(결과값 변수) 에 담기
		result = pstmt.executeUpdate();
		
		// 리소스 반납
		pstmt.close();
		
		return result;
	}
	
	// 자식 테이블의 참조 데이터 레코드 수를 확인하는 메소드
	public int refCount(String sid) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
		
		// 데이터베이스의 쿼리문과 연결할 PreparedStatement 호출
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 변경 해주거나 필요한 값 변수들 불러오기
		pstmt.setString(1, sid);
		
		// 조회문이니 엑스큐트 쿼리
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
			result = rs.getInt("COUNT");
		
		// 리소스 반납
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
}
