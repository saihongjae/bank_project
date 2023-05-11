package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.oracle.DBConnectionManager;

public class RequestApproved_DAO {
	
	public int RequestApproved(String accnum, String requestDate) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int successConfirm = 0;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "UPDATE customer_account_dn "
					+ "SET dn_open_situation = 1, dn_startdate = TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') "
					+ "WHERE dn_accnum = ? and dn_requestdate = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, accnum);
			psmt.setString(2, requestDate);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			if(rs.next()) {
				System.out.println("1");
				successConfirm =  1;
			} else {
				System.out.println("2");
				successConfirm =  2;
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		return successConfirm;
	}
}
