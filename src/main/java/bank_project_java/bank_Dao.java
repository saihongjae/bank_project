package bank_project_java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class bank_Dao {
	
	public bank_Dto selectBankInfoByM_id(String m_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		bank_Dto bank_Dto = null;

		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "select * from bank_manager"
					+" WHERE m_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);

			rs = psmt.executeQuery(); //쿼리를 실행!!

			if(rs.next()) {
				bank_Dto = new bank_Dto();

				bank_Dto.setAdmin_id(rs.getString("admin_id"));
				bank_Dto.setAdmin_pw(rs.getString("admin_pw"));
			}

			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}

		return bank_Dto;
	}
	
	public int BankManagerLoginCheck(String m_id, String m_pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int rs_next_val = 0;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "select * from bank_manager"
					+" WHERE m_id = ? and m_pw = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			psmt.setString(2, m_pw);

			rs = psmt.executeQuery(); //쿼리를 실행!!

			if(rs.next()) {
				rs_next_val =  1;
			} else {
				rs_next_val =  2;
			}
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return rs_next_val;
	}
}
