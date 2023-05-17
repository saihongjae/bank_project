<%@page import="bank.dto.CommonAccountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.CommonAccountDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script	src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
<title>삼조은행</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
			String pw = request.getParameter("pw1");
			String ssn = request.getParameter("ssn1") + request.getParameter("ssn2");

			CommonAccountDAO commonAccountDao = new CommonAccountDAO();
			CommonAccountDTO commonAccountDto = new CommonAccountDTO();
			
			commonAccountDto.setPw(pw);
			commonAccountDto.setSsn(ssn);
			commonAccountDto.setCode("1");
			commonAccountDto.setBalance("0");
			
			int result = commonAccountDao.insertSavingAccount(commonAccountDto);

			if (result == 1) { 
		// 추가 성공
	%>
	<script>
	Swal.fire({
		  icon: 'success',
		  title: '통장개설 신청이 완료되었습니다'
		})
	  setTimeout("location.href= 'main.jsp'",1000);
	</script>
	<%
	} else {
	%>
	<!-- 수정 실패-->
	<script>
	 Swal.fire({
		  icon: 'error',
		  title: '통장개설 신청 실패'
		})
	  setTimeout("location.href= 'main.jsp'",1000);
	</script>
	<%
	}
	%>
</body>
</html>