<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

</head>
<body>
	<%
			String userID = null;
			if (session.getAttribute("id") != null) { // null이 아니면 로그인한 것
				userID = (String) session.getAttribute("id");
			}
		
		%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<div class="navbar-brand">삼조은행(관리자 페이지)</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div style="height: 100%; width: 100px;"
				class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
			</div>

			<div style="width: 100%; display: flex; justify-content: flex-end;">
				<a style="border: solid 1px black;" class="nav-link"
					href="admin_tap.jsp">계좌 요청 관리</a> <a
					style="border: solid 1px black; margin: 0 30px" class="nav-link"
					href="QnA_admin_tap.jsp">Q&A 관리</a>

			</div>
		</div>
	</nav>
</body>

</html>