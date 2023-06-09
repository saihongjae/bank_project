<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/inquiryPage.css" rel="stylesheet" type="text/css">
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

	int normalAccCount=0;
	%>
	<div class="accountWrapper">
		<h3>계좌 조회</h3>
		<div class="progressAccounts">
			<p>
				개설신청중인 계좌 <span>&#40;<%=amoList.size()%>&#41;
				</span>
			</p>
			<%
			if (amoList.size() == 0) {
			%>
			<p>개설신청중인 계좌가 없습니다.</p>
			<%
			} else {
			%>
			<ul style="margin: 20px;">
				<%
				for (AccOpenManagementDTO item : amoList) {
				%>
				<li>
					<form method="post" action="./accountInquiry_proc.jsp">
						<label> 이름 <input type="text" value="<%=item.getName()%>"
							name="name" readOnly />
						</label> <label> 계좌번호 <input type="text"
							value="<%=item.getAccNum()%>" name="accnum" readOnly />
						</label> <label> 계좌유형 <input type="text"
							value="<%=item.getAccType()%>" name="accType" readOnly />
						</label> <label> 신청일 <input type="text"
							value="<%=item.getRequestDate()%>" name="requestDate" readOnly />
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
				보유중인 계좌 <span>&#40;<%=amoList2.size() + amoList3.size()%>&#41;
				</span>
			</p>
			<div class="accordion" id="accordionExample" style="margin: 20px;">
				<ul>
					<%
					if (amoList2.size() == 0 && amoList3.size() == 0) {
					%>
					<li>보유 중인 계좌가 없습니다.</li>
					<%
					} else {
					if (amoList3.size() != 0) {
						for (AccOpenManagementDTO item : amoList3) {
							normalAccCount++;
					%>
					<form action="accountCancellation_Check.jsp" method="post">
					<li class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<%=item.getAccType()%>
								<input type="text"  name="accnum" value="<%=item.getAccNum()%>" readonly></input></button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div style="display: flex; justify-content: space-between;"
								class="accordion-body">
								<div>
									개설일
									<%=item.getStartDate().substring(0, 10)%>
									<br /> 출금가능금액
									<input type="text"  name="balance" value="<%=item.getBalance()%>" readonly></input>
								</div>

								<div style="display: flex; align-items: center;">
									<button id="normalCancelBtn" type="button">해지</button>
								</div>
							</div>
						</div>
					</li>
				</form>
					<%
					}
					}
					if (amoList2.size() != 0) {
					for (AccOpenManagementDTO item : amoList2) {
					%>
					<form action="accountCancellation_Check.jsp" method="post">
					<li class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<%=item.getAccType()%>
								<input type="text"  name="accnum" value="<%=item.getAccNum()%>" readonly></input></button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div style="display: flex; justify-content: space-between;"
								class="accordion-body">
								<div>
									개설일
									<%=item.getStartDate().substring(0, 10)%>
									<br /> 잔액
									<input type="text"  name="balance" value="<%=item.getBalance()%>" readonly></input>
									<br /> 마감일
									<%=item.getEndDate().substring(0, 10)%>
									<br /> 총 납입기간
									<%=item.getTerm()%>
									<br /> 
									<% if (!item.getAccType().equals("예금")) { %>
									월 납입금
									<%=item.getMonthly()%>
									<% } %>
								</div>
								<% if (!item.getAccType().equals("대출")) {  %>
								<div style="display: flex; align-items: center;">
									<button>해지</button>
								</div>
								<% } %>
							</div>
						</div>
					</li>
					</form>
					<%
					}
					}
					}
					%>
				</ul>
			</div>
		</div>
	</div>
	<script>
		var test = "<%=normalAccCount%>";
		document.querySelector("#normalCancelBtn").addEventListener('click', ()=>{	
			if (test === "1") {
				 Swal.fire({
					icon: 'warning',
					title: '해지를 하시려면 은행에 방문하여 주시기 바랍니다.',
					showConfirmButton: false,
					timer: 1500
				 });
				 setTimeout("location.href = 'accountInquiryPage.jsp'", 1500);
			} else {
				document.querySelector("#normalCancelBtn").setAttribute("type","submit");  
			}
		});
	</script>
</body>
</html>