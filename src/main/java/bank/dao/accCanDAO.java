package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bank.dto.accCanDTO;
import bank.oracle.DBConnectionManager;

public class accCanDAO {

		public List<accCanDTO> selectDepositAccount(String accnum) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			List<accCanDTO> accList = null;
			//select 한개 단일
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "SELECT ac_accnum FROM account_common WHERE ac_code = 1 AND ac_open_situation = 1 AND ac_accnum != ? AND ac_ssn = (SELECT ac_ssn FROM account_common WHERE ac_accnum = ?)";


				psmt = conn.prepareStatement(sql);
				psmt.setString(1, accnum);
				psmt.setString(2, accnum);
				
				rs = psmt.executeQuery(); //쿼리를 실행!!
				
				accList = new ArrayList<accCanDTO>();
				
				while(rs.next()) {
					accCanDTO accCanDTO = new accCanDTO();
					
					accCanDTO.setAccnum(rs.getString("ac_accnum"));

					accList.add(accCanDTO);
				}
				
				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return accList;
		}
		
		public boolean depositAccunt(String accnum) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			boolean val = false;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "UPDATE account_common "
						+ "SET ac_open_situation=2, ac_balance = null "
						+ "WHERE ac_accNum = ?";

				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, accnum);
				
				if(psmt.executeUpdate()==1) {
					val=true;
				};
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			return val;
		}
		
		
}