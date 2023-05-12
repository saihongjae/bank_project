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
	dto.setDn_ssn(request.getParameter("dn_ssn"));
	dto.setDn_pw(request.getParameter("dn_pw"));
	
	
	
	if(dao.Identification(dto.getName(), dto.getDn_ssn()) == 1){
		dao.DepWithAccOpening(dto.getDn_ssn(), dto.getDn_pw());
		%>
		<script>
		alert('계좌 개설 요청을 성공하였습니다.');
		location.href= 'main.jsp';
		</script>
	<%
	} else {
	%>
	<script>
	alert('계좌 개설 요청을 실패하였습니다.');
	location.href= 'savings_account.jsp';
	</script>
<%}
	
	%>
</body>
</html>