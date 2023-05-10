<%@page import="java.io.Console"%>
<%@page import="bank.dao.AccOpen_DAO"%>
<%@page import="bank.dto.AccOpen_DTO"%>
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
	AccOpen_DTO dto = new AccOpen_DTO();
	AccOpen_DAO dao = new AccOpen_DAO();
	
	dto.setName(request.getParameter("name"));
	dto.setSsn(request.getParameter("ssn"));
	dto.setPw(request.getParameter("pw"));
	
	
	
	if(dao.Identification(dto.getName(), dto.getSsn()) == 1){
		dao.AccountOpening(request.getParameter("ssn"), request.getParameter("pw"));
		%>
		<script>
		alert('계좌 개설을 성공하였습니다.');
		</script>
	<%
	} else {
	%>
	<script>
	alert('계좌 개설을 실패하였습니다.');
	location.href= 'savings_account.jsp';
	</script>
<%}
	
	%>
</body>
</html>