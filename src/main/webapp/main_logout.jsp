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
	<%@ include file="navBar.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		session.invalidate();
	%>
	<script>
	Swal.fire({
		  icon: 'success',
		  title: "로그아웃 되었습니다"
		})
		setTimeout("location.href = './main.jsp'",1000);
	</script>
</body>
</html>