<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="bank.dao.RequestApproved_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
<%
RequestApproved_DAO dao = new RequestApproved_DAO();
AccOpenManagementDTO dto = new AccOpenManagementDTO();

	dto.setName(request.getParameter("name"));
	dto.setAccNum(request.getParameter("accnum"));
	dto.setBalance(request.getParameter("balance"));
	dto.setRegularDate(request.getParameter("regular"));
	dto.setTerm(request.getParameter("term"));
	dto.setMonthly(request.getParameter("monthly"));
	dto.setAccType(request.getParameter("type"));
	dto.setRequestDate(request.getParameter("requestDate"));
	
	int successCheck = dao.RequestApproved(dto);
	
		if (successCheck == 1) {
%>
			  <script>
				location.replace('admin_tap.jsp');
			</script>
			<%
		} else {
			%>
			  <script>
				location.replace('admin_tap.jsp');
			</script>
			<%
		}		
		%>
</body>
</html>