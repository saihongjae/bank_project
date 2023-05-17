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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");

	BoardDAO boardDAO = new BoardDAO();
	BoardDTO boardDTO = new BoardDTO();
	String bno = request.getParameter("bno");
	List<BoardDTO> view = boardDAO.view(bno);

	for (BoardDTO item : view) {
	%>

	<form name='board_detail' action='' method="post">
		<div class=middle>
			<table class="table table-hover">
				<tr>
					<th>제목 :</th>
					<td><%=item.getTitle()%></td>
				</tr>

				<tr>
					<th>내용 :</th>
					<td><%=item.getContent()%></td>
				</tr>

				<tr>
					<th>작성일 :</th>
					<td><%=item.getQuastDate()%></td>
					<td><%=item.getAnswer()%></td>
				</tr>
			</table>
		</div>

	</form>
	
	<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
	<button id="cancleBtn" type="button"
		onclick="location.href='./boardList.jsp';" class="btn btn-warning">취소</button>
	
	 <% if(item.getAnswer() == "" || item.getAnswer() == null){
	 } else{ %>
		<button id="checkBtn" type="button" class="btn btn-success">답변확인</button>
	<%}
	}
	%>
	
	<script>	
	document.getElementById('deleteBtn').addEventListener('click', ()=>{
		let form = document.board_detail;
		Swal.fire({ 
			  title: '삭제하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				  if(result.isConfirmed){
					  form.action = 'delete_board.jsp?bno=<%=bno%>';
					  form.submit();
				  }
				 })  
	});
	document.getElementById('checkBtn').addEventListener('click', ()=>{
		let form = document.board_detail;
		form.action = 'checkAsk.jsp?bno=<%=bno%>';
		form.submit(); 
	});
	</script>
</body>
</html>