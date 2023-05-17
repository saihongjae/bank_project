package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.oracle.DBConnectionManager;

public class answerDAO {
	
	public boolean answerUpdate(String id, String title, String date, String answerContent) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean value = false;

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
			
			System.out.println(id);
			System.out.println(title);
			System.out.println(date);
			System.out.println(answerContent);
			
			System.out.println(psmt.executeUpdate());
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return value;
	}
}
