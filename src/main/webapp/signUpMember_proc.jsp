<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.MemberDAO"%>
<%@page import="bank.dto.MemberDTO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해

		String name = request.getParameter("name");
		String ssn = request.getParameter("ssn1") + request.getParameter("ssn2");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = new MemberDTO();
		
		memberDto.setName(name);
		memberDto.setSsn(ssn);
		memberDto.setId(id);
		memberDto.setPw(pw);
		memberDto.setEmail(email);
		memberDto.setPhone(phone);
		
		int result = memberDao.insertPersonInfo(memberDto);
		
		if (result == 1) {
			// 추가 성공
	%>
	<script>
	alert("회원가입을 축하합니다!");
	</script>
	<%
		} else {
	%>
	<!-- 수정 실패-->
	<script>
	alert("회원가입에 실패하였습니다..");
	</script>
	<%
		}
	%>
</body>
</html>