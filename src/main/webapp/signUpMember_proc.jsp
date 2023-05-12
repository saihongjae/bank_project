<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.MemberDAO"%>
<%@page import="bank.dto.MemberDTO"%>
<%@page import="bank.oracle.PWManager"%>
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
		String pw = PWManager.encryption(request.getParameter("pw"));
		//String pw2 = request.getParameter("pw");
		
		String emailAddr = request.getParameter("emailAddrs").length() == 0 ? request.getParameter("emailAddr") : request.getParameter("emailAddrs"); 
		String email = request.getParameter("email") + "@" + emailAddr;
		String phone = request.getParameter("phone");
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = new MemberDTO();
		
		memberDto.setName(name);
		memberDto.setSsn(ssn);
		memberDto.setId(id);
		memberDto.setPw(pw);
		memberDto.setEmail(email);
		memberDto.setPhone(phone);
		
		boolean isSignedUp = memberDao.isSignedUpBefore(name, ssn);
	
		if (!isSignedUp) {
		int result = memberDao.insertPersonInfo(memberDto);
			if (result == 1) {
			%>
				<script>
					alert("회원가입을 축하합니다!");
					location.href='./main_login.jsp';// 회원가입하고 메인이나 로그인 페이지로 연결
				</script>
			<%
			} else {
			%>
				<script>
					alert("회원가입에 실패하였습니다..");
					history.back(); // 메인이나 가입 페이지로 재연결
				</script>
			<% 
			}
			%>
			<% } else { %>
				<script>
					alert("기존에 가입했던 내역이 존재합니다!");
					history.back(); // 메인이나 로그인 페이지로 연결
				</script>
			<% } %>
</body>
</html>
