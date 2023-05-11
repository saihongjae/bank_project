package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.dto.BoardDTO;
import bank.oracle.DBConnectionManager;

public class BoardDAO extends DBConnectionManager {


private BoardDTO accountInfo;

public int insertBoardContent() {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int result = 0;

	try {
		conn = DBConnectionManager.getConnection();

		// 쿼리문!
		String sql = "INSERT INTO bank_board(idx, title, content, writer, regdate, count)"
				+" values(?, ?, ?, ?, ?, ?)";

		psmt = conn.prepareStatement(sql);

		
		psmt.setInt(1, accountInfo.getIdx());
		psmt.setString(2, accountInfo.getTitle());
		psmt.setString(3, accountInfo.getContent());
		psmt.setString(4, accountInfo.getWriter());
		psmt.setString(5, accountInfo.getRegdate());
		psmt.setInt(6, accountInfo.getCount());

		result = psmt.executeUpdate();

		System.out.println("처리결과:" + result);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBConnectionManager.close(rs, psmt, conn);
	}

	return result;
}
}