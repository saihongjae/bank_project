<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/depositPage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
	if (session.getAttribute("id") == null) { // null이 아니면 로그인한 것
		session.setAttribute("loc", request.getServletPath());
	%>
	<script>
		alert("로그인이 필요한 페이지입니다");
		location.href = "./main_login.jsp";
	</script>
	<%
	return;
	}

	AccOpenManagementDAO amoDAO = new AccOpenManagementDAO();
	List<AccOpenManagementDTO> amoList = amoDAO.selectProcessInfoList(userID);
	List<AccOpenManagementDTO> amoList2 = amoDAO.selectDoneInfoList(userID);
	List<AccOpenManagementDTO> amoList3 = amoDAO.selectDoneNormalInfoList(userID);
	
	%>
	<div class="accountWrapper">
		<h3>계좌 조회</h3>
		<div class="progressAccounts">
			<p>
				개설신청중인 계좌 <span>&#40;<%=amoList.size()%>&#41;
				</span>
			</p>
			<ul>
				<%
				if (amoList.size() == 0) {
				%>
				<li>개설 신청중인 계좌가 없습니다.</li>
				<%
				} else {
				for (AccOpenManagementDTO item : amoList) {
				%>
				<li>
					<form method="post" action="./accountInquiry_proc.jsp">
						<label> 계좌번호 <input type="text"
							value="<%=item.getAccNum()%>" name="accnum" readOnly />
						</label> <label> 계좌유형 <input type="text"
							value="<%=item.getAccType()%>" name="accType" readOnly />
						</label> <label> 신청일 <input type="text"
							value="<%=item.getRequestDate() %>" name="requestDate" readOnly />
						</label>
						<button type="submit" class="applyCancelBtn">신청 취소</button>
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
				보유중인 계좌 <span>&#40;<%=amoList2.size()%>&#41;
				</span>
			</p>
			<div class="accordion" id="accordionExample" style="margin: 20px;">
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
								<strong>This is the first item's accordion body.</strong>
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
								<strong>This is the first item's accordion body.</strong> <br />
								계좌유형
								<%=item.getAccType() %>
								<br /> 계좌시작
								<%=item.getStartDate()%>
								<br /> 잔액
								<%=item.getBalance()%>
								<br /> 마감일
								<%=item.getEndDate()%>
								<br /> 총 납입기간
								<%=item.getTerm()%>
								<br /> 월 납입금
								<%=item.getMonthly()%>
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
</body>
</html>