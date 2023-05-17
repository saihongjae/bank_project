<%@page import="bank.dao.accountTransferDAO"%>
<%@page import="bank.dto.accountTransferDTO"%>
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