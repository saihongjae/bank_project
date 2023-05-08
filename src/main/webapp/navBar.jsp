<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.*" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
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
					<a class="navbar-brand" href="main.jsp">삼조은행</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link active" aria-current="page" href="./main.jsp">홈페이지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="./signUp.jsp">회원가입</a>
							</li>
							<%
								if (userID != null) { // 로그인 된 상태
							%>
							<li class="nav-item">
								<a class="nav-link" href="./main_logout.jsp">로그아웃</a>
							</li>
							<%
								} else { // 로그인 해라
							%>
							<li class="nav-item">
								<a class="nav-link" href="./main_login.jsp">로그인</a>
							</li>
							<% } %>
						</ul>
						<% if (userID != null) { %>
							<p><%=userID %>님 환영합니다 :)</p>
						<% } %>
					</div>
				</div>
			</nav>
		</body>

		</html>