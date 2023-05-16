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
			String sql = "SELECT bm.name, e.ac_accNum, e.ac_requestDate, pb.pb_type "
					+ "FROM account_common e ,bank_member bm, bank_account_type pb "
					+ "WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 0";

			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			aomInfoList = new ArrayList<AccOpenManagementDTO>();
			
			while(rs.next()) {
				AccOpenManagementDTO AccOpenManagementDTO = new AccOpenManagementDTO();
				
				AccOpenManagementDTO.setName(rs.getString("name"));
				AccOpenManagementDTO.setAccnum(rs.getString("ac_accNum"));
				AccOpenManagementDTO.setAccType(rs.getString("pb_type"));
				AccOpenManagementDTO.setRequestDate(rs.getString("ac_requestDate"));

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
	
	
	public List<AccOpenManagementDTO> selectProcessInfoList(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccOpenManagementDTO> aomInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT bm.name, e.ac_accNum, e.ac_requestDate, pb.pb_type "
					+ "FROM account_common e ,bank_member bm, bank_account_type pb "
					+ "WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 0"
					+ " AND bm.id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			aomInfoList = new ArrayList<AccOpenManagementDTO>();
			
			while(rs.next()) {
				AccOpenManagementDTO AccOpenManagementDTO = new AccOpenManagementDTO();
				
				AccOpenManagementDTO.setName(rs.getString("name"));
				AccOpenManagementDTO.setAccnum(rs.getString("ac_accNum"));
				AccOpenManagementDTO.setAccType(rs.getString("pb_type"));
				AccOpenManagementDTO.setRequestDate(rs.getString("ac_requestDate"));

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
	
	// 1. 입출금 - 잔액
	// 2. 예금 - 잔액
	// 3. 적금 - 잔액, 월별
	// 4. 대출 - 잔액, 월별
	
	// 1. term 불러와서 startDate에 add_months 해주기
	// 2. 계좌 잔액 끌어오기
	
	
	public List<AccOpenManagementDTO> selectDoneInfoListTest(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccOpenManagementDTO> aomInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT e.ac_accNum, e.ac_balance, e.ac_startDate, e.ac_endDate, pb.pb_type, ca.dsl_term, ca.dsl_monthly "
					+ "FROM account_common e, bank_member bm, bank_account_type pb, customer_account_dsl ca "
					+ "WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 1"
					+ "AND bm.id = ? AND ca.dsl_accnum = e.ac_accNum";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			aomInfoList = new ArrayList<AccOpenManagementDTO>();
			
			while(rs.next()) {
				AccOpenManagementDTO AccOpenManagementDTO = new AccOpenManagementDTO();

				AccOpenManagementDTO.setAccnum(rs.getString("ac_accNum"));
				AccOpenManagementDTO.setBalance(rs.getString("ac_balance"));
				AccOpenManagementDTO.setStartDate(rs.getString("ac_startDate"));
				AccOpenManagementDTO.setEndDate(rs.getString("ac_endDate"));
				AccOpenManagementDTO.setAccType(rs.getString("pb_type"));
				AccOpenManagementDTO.setTerm(rs.getString("dsl_term"));
				AccOpenManagementDTO.setMonthly(rs.getString("dsl_monthly"));

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
	
	public List<AccOpenManagementDTO> selectDoneInfoList(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccOpenManagementDTO> aomInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT bm.name, e.ac_accNum, e.ac_requestDate, pb.pb_type "
					+ "FROM account_common e ,bank_member bm, bank_account_type pb "
					+ "WHERE e.ac_ssn = bm.ssn AND e.ac_code = pb.pb_type_no AND e.ac_open_situation = 0"
					+ " AND bm.id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			aomInfoList = new ArrayList<AccOpenManagementDTO>();
			
			while(rs.next()) {
				AccOpenManagementDTO AccOpenManagementDTO = new AccOpenManagementDTO();
				
				AccOpenManagementDTO.setName(rs.getString("name"));
				AccOpenManagementDTO.setAccnum(rs.getString("ac_accNum"));
				AccOpenManagementDTO.setAccType(rs.getString("pb_type"));
				AccOpenManagementDTO.setRequestDate(rs.getString("ac_requestDate"));

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
