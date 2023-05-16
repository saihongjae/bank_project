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
	List<AccOpenManagementDTO> amoList2 = amoDAO.selectDoneInfoListTest(userID);
	%>
	<div class="accountWrapper">
		<h3>계좌 조회</h3>
		<div class="progressAcounts">
			<p>개설신청중인 계좌 <span>&#40;<%= amoList.size() %>&#41;</span></p>
			<ul>
				<%
				if (amoList.size() == 0) { %>
					<li>개설 신청중인 계좌가 없습니다.</li>
				<% } else {
				for (AccOpenManagementDTO item : amoList) {
				%>
				<li><%=item.getAccnum()%></li>
				<%
				}
				}
				%>
			</ul>
		</div>
		<div class="doneAcounts">
			<p>보유중인 계좌 <span>&#40;<%= amoList2.size() %>&#41;</span></p>
			<ul>
				<%
				
				if (amoList2.size() == 0) { %>
				<li>보유 중인 계좌가 없습니다.</li>
				<% } else {
				for (AccOpenManagementDTO item : amoList2) {
				%>
				<li><%=item.getAccnum()%></li>
				<li><%=item.getAccType()%></li>
				<li><%=item.getStartDate()%></li>
				<li><%=item.getBalance()%></li>
				<li><%=item.getMonthly()%></li>
				<%
				}
				}
				%>
			</ul>
		</div>
	</div>

</body>
</html>