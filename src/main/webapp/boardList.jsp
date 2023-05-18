<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<style type="text/css">
.bb {
	display: flex;
	font-weight: 800;
	justify-content: center;
}

.aa {
	padding: 15px;
}
</style>
</head>
<body>
	<%@ include file="navBar.jsp"%>

	<h3 class="tit_cont">문의 내역</h3>
	<ul id="localNav" class="tab_cont">
		<li id="lnb_Ask" class=""><a href="./q_board.jsp" role="tab"
			aria-selected="true" class="link_tab">등록하기</a></li>
		<li id="lnb_MyHistory" class="on"><a href="" role="tab"
			aria-selected="false" class="link_tab">조회하기</a></li>
	</ul>
	<div style="height: 100%; max-height: 450px; overflow-y: scroll;">
	<table class="table table-hover">
	<%
	BoardDTO boardDTO = new BoardDTO();
	BoardDAO boardDAO = new BoardDAO(); //DAO 메소드를 불러오기 위한 선행조건
	//boolean isAnswer = BoardDAO.isAnswerComplete(answer);
	
    List<BoardDTO> questionList = boardDAO.Write(userID); 
//DTO 필드 모양의 배열(List) 타입 생성자(questionList)에 로그인된 아이디(userID)의 검색값을 전부 저장 
//한 사이클 당 item 필드에 SELECT해서 저장한 값을 넣고 출력(questionList배열 수 만큼 실행)
		for(BoardDTO item : questionList){
	%>
			<tr>
				<td style="text-align: left; background-color: beige; width: 80px;"><%=item.getBno()%>.</td>
				<td><a href="./board_detail.jsp?bno=<%=item.getBno()%>" method="post"><%=item.getTitle()%></td></a>
				<td style="text-align: right">
				<%if(item.getAnswer() == "" || item.getAnswer() == null){				
				%>
				<td style="color:red;">처리 중</td>
				<%} else{ %>
				<td style="color:blue;">답변 완료</td>
				<%}%>
			
				
				</td>
			</tr>
	<%
		}
	%>	
	</table>
	</div>
	<ul class="bb">
		<li class="aa"><a href="#">&laquo;</a></li>
		<%-- 유니코드 &laquo = << --%>
		<li class="aa"><a class="w3-green" href="./boardList.jsp">1</a></li>
		<li class="aa"><a href="#">&raquo;</a></li>
		<%-- 유니코드 &raquo = >>--%>
	</ul>
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
</body>
</html>