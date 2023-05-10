package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import bank.oracle.DBConnectionManager;

public class AccOpen_DAO {
	
	public int Identification(String name, String ssn) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int value = 0;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT * FROM bank_member"
					+" WHERE name = ? and ssn = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, ssn);
			
			System.out.println(name);
			System.out.println(ssn);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			if(rs.next()) {
				value =  1;
				
			} else {
				value =  2;
				
			}
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return value;
	}
	
	public void AccountOpening(String ssn, String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO bank_account(ssn, account_num, pw, balance, account_type) "
					+" VALUES (?, (SELECT TO_CHAR(MAX(TO_NUMBER(account_num))+1) FROM bank_account), ?, 0, 1)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ssn);
			psmt.setString(2, pw);

			rs = psmt.executeQuery(); //쿼리를 실행!!

			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}

	}
}
