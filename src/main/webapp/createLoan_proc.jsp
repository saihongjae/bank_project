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
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
			String pw = request.getParameter("pw1");
			String ssn = request.getParameter("ssn1") + request.getParameter("ssn2");
			String monthly = request.getParameter("monthly");
			String monthly2 = request.getParameter("monthly2");
			String term = request.getParameter("term");
			String regularDate = request.getParameter("regular");	
			String principal = request.getParameter("principal");

			CommonAccountDAO commonAccountDao = new CommonAccountDAO();
			CommonAccountDTO commonAccountDto = new CommonAccountDTO();
			
			commonAccountDto.setPw(pw);
			commonAccountDto.setSsn(ssn);
			commonAccountDto.setCode("4");
			commonAccountDto.setBalance(principal.replaceAll(",", ""));
			
			CommonDslDAO commonDslDao = new CommonDslDAO();
			CommonDslDTO commonDslDto = new CommonDslDTO();
			
			commonDslDto.setMonthly(monthly2);
			commonDslDto.setTerm(term);
			commonDslDto.setCode("4");
			commonDslDto.setRegularDate(regularDate);
			
			int result = commonAccountDao.insertSavingAccount(commonAccountDto);
			int result2 = commonDslDao.insertSavingLoanInfo(commonDslDto);
			
			if (result == result2) { 
		// 추가 성공
	%>
	<script>
		alert('통장개설 신청이 완료되었습니다');
		location.href = "main.jsp"; // 통장번호, 정보 담은 페이지로 or 마이페이지로 재연결
	</script>
	<%
	} else {
	%>
	<!-- 수정 실패-->
	<script>
		alert('통장개설 신청 실패');
		location.href = "main.jsp";
	</script>
	<%
	}
	%>
</body>
</html>