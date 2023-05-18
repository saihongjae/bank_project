package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bank.dto.mypageDTO;
import bank.oracle.DBConnectionManager;

public class mypageDAO {
	//select
		public mypageDTO PersonInfo(String id) {
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			mypageDTO accountInfo = null;
			
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "SELECT name, pw, phone, email, reg_date " 
							+ " FROM bank_member "
							+ " WHERE id= ?";

				psmt = conn.prepareStatement(sql);

				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
								
				if (rs.next()) {		
				accountInfo = new mypageDTO();
				accountInfo.setName(rs.getString("name"));
				accountInfo.setPw(rs.getString("pw"));
				accountInfo.setPhone(rs.getString("phone"));
				accountInfo.setEmail(rs.getString("email"));
				accountInfo.setRegdate(rs.getString("reg_date"));
				}
				
				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			return accountInfo;

		}
//---------------------------------		

		public mypageDTO selectPersonInfoById(int id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			mypageDTO mypageDto = null;

			//select 한개 단일
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "select * from bank_member"
						+" WHERE id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, id);

				rs = psmt.executeQuery(); //쿼리를 실행!!

				if(rs.next()) {
					mypageDto = new mypageDTO();

//					mypageDto.setId(rs.getInt("id"));
//					mypageDto.setName(rs.getString("name"));
				}

				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}

			return mypageDto;
		}

// ----------------- profile 수정
		public int changeProfile(String id, String phone, String email) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "update bank_member "
						+ "SET phone = ? , email = ? "
						+ "WHERE id = ? ";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1,phone);
				psmt.setString(2,email);
				psmt.setString(3,id);


				result = psmt.executeUpdate();

				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return result;
		}
	}


