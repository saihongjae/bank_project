package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bank.oracle.DBConnectionManager;

public class Admin_DAO {

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
