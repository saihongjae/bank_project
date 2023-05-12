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

			CommonAccountDAO commonAccountDao = new CommonAccountDAO();
			CommonAccountDTO commonAccountDto = new CommonAccountDTO();
			
			commonAccountDto.setPw(pw);
			commonAccountDto.setSsn(ssn);
			commonAccountDto.setCode("1");
			
			
			int result = commonAccountDao.insertSavingAccount(commonAccountDto);

			if (result == 1) { 
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
	</script>
	<%
	}
	%>
</body>
</html>