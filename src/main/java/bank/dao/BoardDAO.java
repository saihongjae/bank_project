package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bank.dto.BoardDTO;
import bank.oracle.DBConnectionManager;

public class BoardDAO extends DBConnectionManager {

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

public List<BoardDTO> QuestionInfoList(String id) {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	List<BoardDTO> questionInfoList = null;
	//select 한개 단일
	try {
		conn = DBConnectionManager.getConnection();

		// 쿼리문!
		String sql = "SELECT * FROM bank_board WHERE id = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		
		rs = psmt.executeQuery(); //쿼리를 실행!!
		
		questionInfoList = new ArrayList<BoardDTO>();
		
		while(rs.next()) {//executeQuery에는 반복문rs.next()없이 set을 하면 값이 안들어갔던걸로 알아요
			BoardDTO boardDTO = new BoardDTO();
			
			boardDTO.setId(rs.getString("id"));
			boardDTO.setTitle(rs.getString("title"));
			boardDTO.setContent(rs.getString("content"));
			boardDTO.setQuastDate(rs.getString("question_date"));

			questionInfoList.add(boardDTO);
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
//===============================================
//delete
public int deleteBoardList(String id) {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int result = 0;

	try {
		conn = DBConnectionManager.getConnection();

		// 쿼리문!
		String sql = " DELETE FROM bank_board WHERE id = ? ";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);

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

}