package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.oracle.DBConnectionManager;

public class answerDAO {
	
	public int answerUpdate(String id, String title, String date, String answerContent) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int value = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "UPDATE bank_board "
					+ "SET answer = ?, answer_date = TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') "
					+ "WHERE id=? AND title=? AND question_date=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, answerContent);
			psmt.setString(2, id);
			psmt.setString(3, title);
			psmt.setString(4, date);
			
			value = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return value;
	}
}
