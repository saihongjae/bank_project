package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.websocket.Session;

import bank.dto.MemberDTO;
import bank.oracle.DBConnectionManager;
import bank.oracle.PWManager;
import sample.dto.PersonDto;

public class MemberDAO {
	
	public PersonDto selectPersonInfoById(int id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PersonDto personDto = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select * from t_person_info"
					+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);

			rs = psmt.executeQuery(); 

			if(rs.next()) {
				personDto = new PersonDto();

				personDto.setId(rs.getInt("id"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}

		return personDto;
	}
	//-------------------
		//login 
		public boolean loginMember(String id, String pw) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean isLoggedIn = false;
			
			try {
				conn = DBConnectionManager.getConnection();
				String sql = "SELECT * FROM bank_member"
					+ " WHERE id = ? AND pw = ?";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);

	
				rs = psmt.executeQuery(); //쿼리를 실행!!
				isLoggedIn = rs.next();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return isLoggedIn;
			
		}
	
		// select (멤버가 존재하는지 안하는지)
		public boolean isSignedUpBefore(String name, String ssn) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean isSignedUp = false;
			
			try {
				conn = DBConnectionManager.getConnection();
				String sql = "SELECT * FROM bank_member"
					+ " WHERE name = ? AND ssn = ?";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setString(2, ssn);
				
				rs = psmt.executeQuery(); //쿼리를 실행!!
				isSignedUp = rs.next();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			return isSignedUp;
		}
	
		// insert
		public int insertPersonInfo(MemberDTO accountInfo) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "INSERT INTO bank_member(name, ssn, id, pw, email, phone)"
							+" values(?, ?, ?, ?, ?, ?)";

				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, accountInfo.getName());
				psmt.setString(2, accountInfo.getSsn());
				psmt.setString(3, accountInfo.getId());
				psmt.setString(4, accountInfo.getPw());
				psmt.setString(5, accountInfo.getEmail());
				psmt.setString(6, accountInfo.getPhone());
				
				result = psmt.executeUpdate();
				
				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
//				 TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		
		
//		public int PersonInfo(MemberDTO accountInfo) {
//
//			Connection conn = null;
//			PreparedStatement psmt = null;
//			ResultSet rs = null;
//			int result = 0;
//			
//			try {
//				conn = DBConnectionManager.getConnection();
//
//				// 쿼리문!
//				String sql = "SELECT name,pw,phone,email,regdate"
//							+ "from bank_member"
//							+ "WHERE id= ?";
//
//				psmt = conn.prepareStatement(sql);
//				
//				psmt.setString(1, accountInfo.getUserId());
//				
//				rs = psmt.executeQuery();
//				
//				System.out.println("처리결과:" + result);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				DBConnectionManager.close(rs, psmt, conn);
//			}
//			
//			return result;
//		}
}
