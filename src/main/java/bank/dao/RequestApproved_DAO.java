package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.dto.AccOpenManagementDTO;
import bank.oracle.DBConnectionManager;

public class RequestApproved_DAO {
	
	public int RequestApproved(AccOpenManagementDTO dto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int successConfirm = 0;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "UPDATE account_common "
					+ "SET ac_open_situation = 1, ac_startDate = TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS'), ac_endDate = DECODE(?, 'null', '9999/99/99 00:00:00', TO_CHAR(ADD_MONTHS(sysdate, ?), 'YYYY/MM/DD HH24:MI:SS')) "
					+ "WHERE ac_accNum = ? and ac_requestDate = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTerm());
			psmt.setString(2, dto.getTerm());
			psmt.setString(3, dto.getAccNum());
			psmt.setString(4, dto.getRequestDate());
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			if(rs.next()) {
				successConfirm =  1;
			} else {
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
