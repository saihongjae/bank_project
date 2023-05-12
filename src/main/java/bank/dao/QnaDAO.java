package bank.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import java.util.List;
	import bank.dto.BoardDTO;
import bank.dto.QnaDTO;
import bank.oracle.DBConnectionManager;

		public class QnaDAO extends DBConnectionManager {

		public QnaDTO selectInfoByIdTitle(String id) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			QnaDTO quest = null;
			//select 한개 단일
			try {
				conn = DBConnectionManager.getConnection();

				// 쿼리문!
				String sql = "SELECT * FROM bank_board WHERE ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);

				
				rs = psmt.executeQuery(); //쿼리를 실행!!
				
				if(rs.next()) {//executeQuery에는 반복문rs.next()없이 set을 하면 값이 안들어갔던걸로 알아요
					QnaDTO qnaDTO = new QnaDTO();
					
					qnaDTO.setId(rs.getString("id"));
					qnaDTO.setTitle(rs.getString("title"));
					qnaDTO.setContent(rs.getString("content"));
					qnaDTO.setQuastDate(rs.getString("question_date"));
					
					quest = qnaDTO;
				}
				
				// DB에 쿼리문 실행
				// 쿼리 결과를 반환 -> 활용
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);			
			}
			
			return quest;
		}
		
	public int insertContentInfo(BoardDTO boardDTO) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int value = 0;

		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO bank_board (id, title, content) "
					+ "VALUES (?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, boardDTO.getId());
			psmt.setString(2, boardDTO.getTitle());
			psmt.setString(3, boardDTO.getContent());

			value = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return value;
	}

	public List<QnaDTO> QuestionInfoList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<QnaDTO> questionInfoList = null;
		//select 한개 단일
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "SELECT * FROM bank_board WHERE answer_date IS NULL";

			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery(); //쿼리를 실행!!
			
			questionInfoList = new ArrayList<QnaDTO>();
			
			while(rs.next()) {//executeQuery에는 반복문rs.next()없이 set을 하면 값이 안들어갔던걸로 알아요
				QnaDTO QnaDTO = new QnaDTO();
				
				QnaDTO.setId(rs.getString("id"));
				QnaDTO.setTitle(rs.getString("title"));
				QnaDTO.setContent(rs.getString("content"));
				QnaDTO.setQuastDate(rs.getString("question_date"));
				
				questionInfoList.add(QnaDTO);
			}
			
			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return questionInfoList;
	}
	
}
