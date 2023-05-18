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
			String sql = "SELECT * FROM account_common ac, bank_member bm "
							+ "WHERE ac.ac_ssn=bm.ssn AND ac_code!=3 AND ac_code!=2 and ac_open_situation=1 AND bm.id = ?";

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
			String sql = "SELECT * FROM account_common WHERE ac_accnum = ?";

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
	
	public int pwcheck(String accnum, String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int val = 0;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT * FROM account_common WHERE ac_accNum = ? AND ac_pw = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, accnum);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			if(rs.next()) {
				val=1; 
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return val;
	}
	
	public String accTransferCheck(String accnum) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String bal = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT bm.name FROM account_common ac, bank_member bm WHERE ac.ac_ssn = bm.ssn AND ac_accnum = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, accnum);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			if(rs.next()) {
				
				bal = rs.getString("name");
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
	
	
		public boolean depositExecution1(String depositAmount, String accnum) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean val = false;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "UPDATE account_common "
						+ "SET ac_balance = (SELECT ac_balance-? FROM account_common WHERE ac_accnum = ?) "
						+ "WHERE ac_accNum = ?";

				psmt = conn.prepareStatement(sql);

				psmt.setString(1, depositAmount);
				psmt.setString(2, accnum);
				psmt.setString(3, accnum);
				
				if(psmt.executeUpdate()>0) {
					val=true;
				};
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			return val;
		}
		
		public boolean depositExecution2(String depositAmount, String accnum) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean val = false;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "UPDATE account_common "
						+ "SET ac_balance = (SELECT ac_balance+? FROM account_common WHERE ac_accnum = ?) "
						+ "WHERE ac_accNum = ?";

				psmt = conn.prepareStatement(sql);

				psmt.setString(1, depositAmount);
				psmt.setString(2, accnum);
				psmt.setString(3, accnum);
				
				if(psmt.executeUpdate()>0) {
					val=true;
				};
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			return val;
		}
	
		public boolean depositAmountCheck(String selectAcc, String balance, String depositAmount) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean val = false;
			//select 한개 단일
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "SELECT ac_balance FROM account_common WHERE ac_accnum = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, selectAcc);
				psmt.setString(2, balance);
				psmt.setString(3, depositAmount);
				
				rs = psmt.executeQuery(); //쿼리를 실행!!
				
				if(rs.next()) {
					val = true;
				}
				
				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return val;
		}
}
