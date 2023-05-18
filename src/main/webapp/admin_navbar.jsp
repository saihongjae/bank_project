<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/lock.png">
<title>삼조은행 관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard-Regular';
}
</style>
</head>
<body>
	<%
			String userID = null;
			if (session.getAttribute("id") != null) { // null이 아니면 로그인한 것
				userID = (String) session.getAttribute("id");
			}
		System.out.println(userID);
		%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand">
				<img src="./imgs/samjo-bank-low-resolution-logo-color-on-transparent-background (1).png" width="60px" height="60px"/>
			</a>
			<% if(userID != null) { %>
			<div style="display: flex; justify-content: flex-end;">
				<a class="btn btn-primary"
					href="admin_tap.jsp">계좌 요청 관리</a> 
				<a style="margin: 0 30px;" class="btn btn-success"
					href="QnA_admin_tap.jsp">Q&A 관리</a>
			</div>
			<% } %>
		</div>
			
	</nav>
</body>

</html>