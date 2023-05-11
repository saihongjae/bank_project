package bank.dao;
import bank.oracle.PWManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import bank.dto.mypageDTO;
import bank.oracle.DBConnectionManager;
import bank.oracle.PWManager;
import sample.dto.PersonDto;
public class mypageDAO {
	//select
		public List<PersonDto> selectPersonInfoList(){
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			List<PersonDto> personInfoList = null;

			//Select 리스트 전체
			try {
				conn = DBConnectionManager.getConnection();


				String sql = "SELECT name,pw,phone,email,regdate"
						+ "from bank_member"
						+ "WHERE id= ?";

				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery(); //쿼리를 실행!!

				personInfoList = new ArrayList<PersonDto>();

				while(rs.next()) {
					mypageDTO mypageDto = new mypageDTO();

					mypageDto.setName(rs.getString("name"));
					mypageDto.setPw(rs.getString("pw"));
					mypageDto.setPhone(rs.getString("phone"));
					mypageDto.setEmail(rs.getString("email"));
					mypageDto.setRegdate(rs.getString("regdate"));
				
				
				}

				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}

			return personInfoList;		
		}
	
//--------------------------------------------------------------------
		public mypageDTO PersonInfo(String id) {
			
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			mypageDTO accountInfo = null;
			
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "SELECT name,pw,phone,email,reg_date "
							+ "FROM bank_member "
							+ "WHERE id= ?";

				psmt = conn.prepareStatement(sql);

				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				if (rs.next()) {		
				accountInfo = new mypageDTO();
				accountInfo.setName(rs.getString("name"));
				accountInfo.setPw(rs.getString("pw"));
				accountInfo.setPhone(rs.getString("phone"));
				accountInfo.setEmail(rs.getString("email"));
				accountInfo.setRegdate(rs.getString("regdate"));
				}
				
				System.out.println(accountInfo.getUserId());
				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			return accountInfo;

		}
		
		public void name(String name, String ssn) {
		      Connection conn = null;
		      PreparedStatement psmt = null;
		      ResultSet rs = null;
		      int value = 0;
		      //select 한개 단일
		      try {
		         conn = DBConnectionManager.getConnection();

		         // 쿼리문!
		         String sql = "SELECT * FROM 테이블"
		               +" WHERE name = ? and ssn = ?";

		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, name);
		         psmt.setString(2, ssn);
		         
		         rs = psmt.executeQuery(); //쿼리를 실행!!
		         
		        // personDto.setName(rs.getString("name"));
		         
		         if(rs.next()) {
		            
		         } else {
		            
		         }
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
