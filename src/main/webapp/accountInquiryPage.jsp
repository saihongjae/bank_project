<%@page import="java.text.DecimalFormat"%>
<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link href="./css/inquiryPage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
	if (session.getAttribute("id") == null) { // null이 아니면 로그인한 것
		session.setAttribute("loc", request.getServletPath());
	%>
	<script>
	Swal.fire({
		  icon: 'warning',
		  title: "로그인이 필요한 페이지입니다"
	}).then((result)=>{
		location.href = "./main_login.jsp";
	})
	</script>
	<%
	return;
	}

	AccOpenManagementDAO amoDAO = new AccOpenManagementDAO();
	List<AccOpenManagementDTO> amoList = amoDAO.selectProcessInfoList(userID);
	List<AccOpenManagementDTO> amoList2 = amoDAO.selectDoneInfoList(userID);
	List<AccOpenManagementDTO> amoList3 = amoDAO.selectDoneNormalInfoList(userID);
	DecimalFormat df = new DecimalFormat("###,###");
	
	%>
	<div class="accountWrapper">
		<h3>계좌 조회</h3>
		<div class="progressAccounts">
			<p>
				개설신청중인 계좌 <span>&#40;<%=amoList.size()%>&#41;
				</span>
			</p>
			<% if (amoList.size() == 0) { %>
			<p>개설신청중인 계좌가 없습니다.</p>
			<% } else { %>
			<ul style="margin: 20px;">
				<%
				for (AccOpenManagementDTO item : amoList) {
				%>
				<li style="margin-bottom: 10px;">
					<form method="post" action="./accountInquiry_proc.jsp">
						<label> 이름 <input type="text"
							value="<%=item.getName()%>" name="name" readOnly />
						</label>
						<label> 계좌번호 <input type="text"
							value="<%=item.getAccNum()%>" name="accnum" readOnly />
						</label> <label> 계좌유형 <input type="text"
							value="<%=item.getAccType()%>" name="accType" readOnly />
						</label> <label> 신청일 <input type="text"
							value="<%=item.getRequestDate() %>" name="requestDate" readOnly />
						</label>
						<button type="submit" class="applyCancelBtn btn btn-danger">신청 취소</button>
					</form>
				</li>
			<%
				}
			}
			%>
			</ul>
		</div>
		<div class="doneAccounts">
			<p>
				보유중인 계좌 <span>&#40;<%=amoList2.size() + amoList3.size()%>&#41;
				</span>
			</p>
			<div class="accordion" id="accordionExample" style="margin: 20px; height: 100%; max-height: 400px; overflow-y : scroll;">
				<ul>
					<%
					if (amoList2.size() == 0 && amoList3.size() == 0 ) {
					%>
					<li>보유 중인 계좌가 없습니다.</li>
					<%
					} else {
					if (amoList3.size() != 0) {
						for (AccOpenManagementDTO item : amoList3) {
							%>
					<li class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<%=item.getAccType() %>
								<%=item.getAccNum() %></button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								개설일
								<%=item.getStartDate()%>
								<br /> 출금가능금액
								<%=item.getBalance()%>
							</div>
						</div>
					</li>
					<%
							}
					}
					if (amoList2.size() != 0) {
						for (AccOpenManagementDTO item : amoList2) {
							%>
					<li class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<%=item.getAccType()%>
								<%=item.getAccNum()%></button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								개설일
								<%=item.getStartDate()%>
								<br /> 잔액
								<%=item.getBalance()%>
								<br /> 마감일
								<%=item.getEndDate()%>
								<br /> 총 납입기간
								<%=item.getTerm()%>
								<br /> 월 납입금
								<%=item.getMonthly() %>
							</div>
						</div>
					</li>
					<%
							}
					}
					}
					%>
				</ul>
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