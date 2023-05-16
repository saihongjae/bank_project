<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<title>답변확인</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
		
	<%
	request.setCharacterEncoding("UTF-8");

	BoardDAO boardDAO = new BoardDAO();
	BoardDTO boardDTO = new BoardDTO();
	String bno = request.getParameter("bno");
	List<BoardDTO> viewAsk = boardDAO.viewAsk(bno);

	for (BoardDTO item : viewAsk) {
	%>
	<form name='board_detail' action='' method="post">
		<div class=middle>
			<table class="table">
			<h3 class="tit_cont">문의하신 내용에 대한 </h3><br>
				<tr>
					<th>답변 :</th>
					<td><%=item.getAnswer()%></td>
				</tr>

				<tr>
					<th>작성일 :</th>
					<td><%=item.getAnswer_date()%></td>
				</tr>

			</table>
		</div>
	</form>
	<br>
	<button type="button" class="btn btn-dark" onclick="location.href='./board_detail.jsp?bno=<%=bno%>'">목록</button>
	<%
	}
	%>	
		
		
</body>
</html>