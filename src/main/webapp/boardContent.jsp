<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<%@ include file="navBar.jsp"%>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = null;
	if (session.getAttribute("id") != null) { // null이 아니면 로그인한 것
		userID = (String) session.getAttribute("id");
	}
	
	if (userID == null) { %>
	<script>
			Swal.fire({
				icon: 'info',
				title: "로그인 후 이용 가능합니다."
			})
	</script>
	<% } %>

	<div>
		<h3 class="tit_cont">1:1 문의</h3>
		<div>
			<ul id="localNav" class="tab_cont">
			<%	if (userID != null) { %>
				<li id="lnb_Ask"><a href="./q_board.jsp" role="tab"
					aria-selected="true" class="link_tab">등록하기</a></li>
				<li id="lnb_MyHistory"><a href="./boardList.jsp" role="tab"
					aria-selected="false" class="link_tab">조회하기</a></li>
			<% } %>
			</ul>
		</div>
		<div>
			<div class="module_content">
				<p class="desc_login">
					고객님의 금융관련 상담 및 문의사항에 대한<br>해결을 위해 최선을 다하겠습니다.
				</p>
				<%	if (userID == null) { %>
				<div class="box_login">
					<div class="info_login">
						<a class="link_login open_login_window" href="./main_login.jsp">로그인</a>
						<p class="desc_info">
							로그인 시 개인정보 입력 절차 없이 이용할 수 있으며<br>과거 상담 내역도 확인할 수 있습니다.
						</p>

					</div>
				</div>
				<% } %>
			</div>
		</div>
	</div>
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