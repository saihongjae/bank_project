<%@page import="bank.dao.accountTransferDAO"%>
<%@page import="bank.dto.accountTransferDTO"%>
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
accountTransferDAO dao = new accountTransferDAO();
accountTransferDTO dto = new accountTransferDTO();
dto.setAccnum(request.getParameter("selectAccNum"));
dto.setBalance(dao.checkBalance(dto.getAccnum()));
%>
<script>
location.href="accountTransfer.jsp";
</script> 
</body>
</html>