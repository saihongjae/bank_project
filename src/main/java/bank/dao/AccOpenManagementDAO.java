package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bank.dto.AccOpenManagementDTO;
import bank.oracle.DBConnectionManager;

public class AccOpenManagementDAO {
	
	public List<AccOpenManagementDTO> OpeningRequestInfoList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccOpenManagementDTO> aomInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT bm.name, e.dn_accnum, e.dn_requestDate, pb.pb_type "
					+ "FROM customer_account_dn e ,bank_member bm, bank_account_type pb "
					+ "WHERE e.dn_ssn = bm.ssn AND e.dn_code = pb.pb_type_no AND e.dn_open_situation = 0";

			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			aomInfoList = new ArrayList<AccOpenManagementDTO>();
			
			while(rs.next()) {
				AccOpenManagementDTO AccOpenManagementDTO = new AccOpenManagementDTO();
				
				AccOpenManagementDTO.setName(rs.getString("name"));
				AccOpenManagementDTO.setAccnum(rs.getString("dn_accnum"));
				AccOpenManagementDTO.setAccType(rs.getString("pb_type"));
				AccOpenManagementDTO.setRequestDate(rs.getString("dn_requestDate"));

				aomInfoList.add(AccOpenManagementDTO);
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return aomInfoList;
	}
	
}
