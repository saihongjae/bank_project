package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.dto.CommonDslDTO;
import bank.oracle.DBConnectionManager;

public class CommonDslDAO {
	public int insertDepositInfo(CommonDslDTO commonDslDto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO customer_account_dsl (dsl_accNum, dsl_term)"
					+ " VALUES ((SELECT TO_CHAR(MAX(TO_NUMBER(ac_accNum))) FROM account_common WHERE ac_code = ?), ?)";
	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, commonDslDto.getCode());
			psmt.setString(2, commonDslDto.getTerm());

			result = psmt.executeUpdate(); //쿼리를 실행!!
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return result;
	}
	
	public int insertSavingLoanInfo(CommonDslDTO commonDslDto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO customer_account_dsl (dsl_accNum, dsl_monthly, dsl_term, dsl_regularDate)"
					+ " VALUES ((SELECT TO_CHAR(MAX(TO_NUMBER(ac_accNum))) FROM account_common WHERE ac_code = ?), ?, ?, ?)";
	
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, commonDslDto.getCode());
			psmt.setString(2, commonDslDto.getMonthly());
			psmt.setString(3, commonDslDto.getTerm());
			psmt.setString(4, commonDslDto.getRegularDate());

			result = psmt.executeUpdate(); //쿼리를 실행!!
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return result;
	}
}
