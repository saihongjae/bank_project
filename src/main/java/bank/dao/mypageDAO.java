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
				String sql = "SELECT name, pw, phone, email, reg_date " 
							+ " FROM bank_member "
							+ " WHERE id= ?";

				psmt = conn.prepareStatement(sql);

				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
								
				if (rs.next()) {		
				accountInfo = new mypageDTO();
				accountInfo.setName(rs.getString("name"));
				accountInfo.setPw(rs.getString("pw"));
				accountInfo.setPhone(rs.getString("phone"));
				accountInfo.setEmail(rs.getString("email"));
				accountInfo.setRegdate(rs.getString("reg_date"));
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
//---------------------------------		
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
//-----------------------------------------------------------		
		public mypageDTO selectPersonInfoById(int id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			mypageDTO mypageDto = null;

			//select 한개 단일
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "select * from bank_member"
						+" WHERE id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, id);

				rs = psmt.executeQuery(); //쿼리를 실행!!

				if(rs.next()) {
					mypageDto = new mypageDTO();

//					mypageDto.setId(rs.getInt("id"));
//					mypageDto.setName(rs.getString("name"));
				}

				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}

			return mypageDto;
		}

// ----------------- profile 수정
		public int changeProfile(String id, String phone, String email) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "update bank_member "
						+ " SET phone = ? , email = ? "
						+ " WHERE id = ? ";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1,phone);
				psmt.setString(2,email);
				psmt.setString(3,id);


				result = psmt.executeUpdate();

				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return result;
		}
//--------------------------------------------------------.0
		//update
		/*		public int updatePersonInfo(PersonDto personDto) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "update t_person_info"
						+" SET name = ?"
						+" WHERE id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, personDto.getName());
				psmt.setInt(2, personDto.getId());

				result = psmt.executeUpdate();

				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return result;
		}

		//insert
		public int insertPersonInfo(String name) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "insert into t_person_info"
						+" values( (select NVL(MAX(id),0)+1 FROM t_person_info)  , ?)";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);

				result = psmt.executeUpdate();

				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return result;
		}

		//delete
		public int deletePersonInfo(int id) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;

			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "DELETE FROM t_person_info"
						+" WHERE id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, id);

				result = psmt.executeUpdate();

				System.out.println("처리결과:" + result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}

			return result;
		}*/
	}


