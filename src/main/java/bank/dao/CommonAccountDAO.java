package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bank.dto.CommonAccountDTO;
import bank.oracle.DBConnectionManager;

public class CommonAccountDAO {
	public String getDefaultAccountNum(String code) {
		String num = null;
		switch (code) {
		case "1" : 
			num = "4084150000001";
			break;
		case "2": 
			num = "3017920000001";
			break;
		case "3": 
			num = "1170230000001";
			break;
		case "4": 
			num = "5730820000001";
			break;
		}
		return num;
	}
	
	public int insertSavingAccount(CommonAccountDTO commonAccountDto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO account_common (ac_code, ac_accNum, ac_pw, ac_ssn, ac_balance)"
					+" VALUES (?, (SELECT NVL(TO_CHAR(MAX(TO_NUMBER(ac_accNum))+1), " + this.getDefaultAccountNum(commonAccountDto.getCode()) + ") FROM account_common"
					+" WHERE ac_code = ?" + ") , ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, commonAccountDto.getCode());
			psmt.setString(2, commonAccountDto.getCode());
			psmt.setString(3, commonAccountDto.getPw());
			psmt.setString(4, commonAccountDto.getSsn());
			psmt.setString(5, commonAccountDto.getBalance());

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