<%@page import="bank.dao.CommonDslDAO"%>
<%@page import="bank.dto.CommonDslDTO"%>
<%@page import="bank.dto.CommonAccountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.CommonAccountDAO"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css"
	rel="stylesheet">
<script
	src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
						</script>
<title>삼조은행</title>
</head>

<body>
	<% request.setCharacterEncoding("UTF-8"); 
	String pw = request.getParameter("pw1"); 
	String ssn = request.getParameter("ssn1") + request.getParameter("ssn2");
	String monthly = request.getParameter("monthly"); 
	String term = request.getParameter("term"); 
	String regularDate = request.getParameter("regular"); 
	
	CommonAccountDAO commonAccountDao=new CommonAccountDAO();
	CommonAccountDTO commonAccountDto=new CommonAccountDTO();
	commonAccountDto.setPw(pw);
	commonAccountDto.setSsn(ssn);
	commonAccountDto.setCode("2");
	commonAccountDto.setBalance(monthly); 
	
	CommonDslDAO commonDslDao=new CommonDslDAO();
	CommonDslDTO commonDslDto=new CommonDslDTO();
	
	commonDslDto.setTerm(term);
	commonDslDto.setCode("2");
	commonDslDto.setRegularDate(regularDate); 
	
	int result = commonAccountDao.insertSavingAccount(commonAccountDto);
	int result2 = commonDslDao.insertDepositInfo(commonDslDto); 
	 
	if (result==result2) { // 추가 성공 %>
	<script>
		Swal.fire({
		icon: 'success',
		title: '통장개설 신청이 완료되었습니다'
		})
		setTimeout("location.href= 'main.jsp'", 1000);
	</script>
	<% } else { %>
	<script>
	// 추가 실패
		Swal.fire({
		icon: 'error',
		title: '통장개설 신청 실패'
		})
		setTimeout("location.href= 'main.jsp'", 1000);
	</script>
	<% } %>

</body>

</html>