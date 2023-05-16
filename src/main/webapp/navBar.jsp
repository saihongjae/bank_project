<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/navBar.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
			String userID = null;
			if (session.getAttribute("id") != null) { // null이 아니면 로그인한 것
				userID = (String)session.getAttribute("id");
			}
		
		%>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="./main.jsp">
				<img src="./imgs/samjo-bank-low-resolution-logo-color-on-transparent-background (1).png" width="60px" height="60px"/>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="./main.jsp">홈페이지</a></li>
					
					<%
								if (userID != null) { // 로그인 된 상태
							%>
					<li class="nav-item nav-log"><a class="nav-link"
						href="./main_logout.jsp">로그아웃</a></li>
					<%
								} else { // 로그인 해라
							%>
					<li class="nav-item"><a class="nav-link" href="./signUp.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./main_login.jsp">로그인</a></li>
					<% } %>

					<% if (userID != null) { %>	
					<li class="nav-item" id="mp"><a class="nav-link"
						href="./myPage.jsp"><img src="./imgs/profileIcon.png"
							width="60px" height="60px"><span class="myPageTxt">마이페이지</span></a></li>
					<li class="nav-item nav-link active"><%=userID %>님 환영합니다 :)</li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>