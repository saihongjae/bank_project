<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String accNum = request.getParameter("accnum");
	String accType = request.getParameter("accType");
	String requestDate = request.getParameter("requestDate");
	int result = 0;
	int result1 = 1;
	
	AccOpenManagementDAO amoDAO = new AccOpenManagementDAO();
	amoDAO.deleteCommonAccountApplication(accNum);
	if (!accType.equals("입출금")) {		
		amoDAO.deleteDSLAccountApplication(accNum);
	}
	%>
	<script>
	location.href = "./accountInquiryPage.jsp";
	</script>
</body>
</html>