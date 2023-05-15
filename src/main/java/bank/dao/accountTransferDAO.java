package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bank.dto.accountTransferDTO;
import bank.oracle.DBConnectionManager;

public class accountTransferDAO {
	public List<accountTransferDTO> accountNumList(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<accountTransferDTO> accInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "select * from account_common ac, bank_member bm "
							+ "where ac.ac_ssn=bm.ssn and ac_code!=3 and ac_open_situation=1 and bm.id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			accInfoList = new ArrayList<accountTransferDTO>();
			
			while(rs.next()) {
				accountTransferDTO accountTransferDTO = new accountTransferDTO();
				
				accountTransferDTO.setAccnum(rs.getString("ac_accNum"));
				accountTransferDTO.setBalance(rs.getString("ac_balance"));

				accInfoList.add(accountTransferDTO);
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return accInfoList;
	}
	
	public String checkBalance(String accnum) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String bal = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "select * from account_common where ac_accnum = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, accnum);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			if(rs.next()) {
				bal = rs.getString("ac_balance");
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return bal;
	}
}
