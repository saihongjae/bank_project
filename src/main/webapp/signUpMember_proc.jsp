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
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
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
					Swal.fire("회원가입을 축하합니다!");
					setTimeout("location.href='./main_login.jsp'",3000);// 회원가입하고 메인이나 로그인 페이지로 연결
				</script>
			<%
			} else {
			%>
				<script>
				Swal.fire({
					  icon: 'error',
					  title: "회원가입에 실패하였습니다.."
					})
					setTimeout("history.back()",3000); // 메인이나 가입 페이지로 재연결
				</script>
			<% 
			}
			%>
			<% } else { %>
				<script>
				Swal.fire({
					  icon: 'info',
					  title: "기존에 가입했던 내역이 존재합니다!"
					})
					setTimeout("history.back()",3000); // 메인이나 로그인 페이지로 연결
				</script>
			<% } %>
</body>
</html>
