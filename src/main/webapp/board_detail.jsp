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
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>삼조은행</title>
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
					<td><%=item.getQuastDate().substring(0,10)%></td>
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
	
	<footer class="footer" style="position: absolute; bottom: 0;">
		<ul class="noticeLists">
			<li>개인정보처리방침</li>
			<li>신용정보활용체제</li>
			<li>전자민원</li>
			<li>사고신고</li>
			<li>삼조지킴이</li>
			<li>보호금융상품등록부</li>
			<li>상품공시실</li>
			<li>영업점안내</li>
			<li>상담신청</li>
			<li>웹접근성이용안내</li>
			<li>위치기반서비스약관</li>
		</ul>
		<ul class="underNoticeLists">
			<li>(주)삼조뱅크·최초롱·사업자번호 111-11-11111</li>
			<li>고객센터 <span>1599-8000</span></li>
			<li>평일 09:00 ~ 18:00 (은행휴무일 제외)</li>
		</ul>
		<div class="footerBottom">
			<p class="copyRight">Copyright © Samjo Bank Korea. All Rights
				Reserved.</p>
			<ul class="snsBtns">
				<li>
					<button class="youtubeBtn" type="button">
						<i class="fa-brands fa-youtube"></i>
					</button>
				</li>
				<li>
					<button class="fbBtn" type="button">
						<i class="fa-brands fa-facebook"></i>
					</button>
				</li>
				<li>
					<button class="twitterBtn" type="button">
						<i class="fa-brands fa-twitter"></i>
					</button>
				</li>
				<li>
					<button class="instaBtn" type="button">
						<i class="fa-brands fa-instagram"></i></i>
					</button>
				</li>
			</ul>
		</div>
	</footer>
	
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