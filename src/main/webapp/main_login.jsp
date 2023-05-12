<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/main_login.css" rel="stylesheet" type="text/css">
<title>LOGIN</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<h1>환영합니다 :)</h1>
	<br><br>

	<div class="container">
		<form class="form" action="loginCheck.jsp" method="post">
			<div class="form__group">
				<div class="form__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
				<path d="M5 5a5 5 0 0 1 10 0v2A5 5 0 0 1 5 7V5zM0 16.68A19.9 19.9 0 0 1 10 14c3.64 0 7.06.97 10 2.68V20H0v-3.32z"/></svg></div>
				<input class="form__control" type="text" name="id" placeholder="사용자 이름">
			</div>
			<div class="form__group">
				<div class="form__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
				<path d="M4 8V6a6 6 0 1 1 12 0v2h1a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-8c0-1.1.9-2 2-2h1zm5 6.73V17h2v-2.27a2 2 0 1 0-2 0zM7 6v2h6V6a3 3 0 0 0-6 0z"/></svg></div>
				<input class="form__control" type="password" name="pw" placeholder="암호">
			</div>
			<div>
				<button class="form__button" type="submit" >
					로그인
				</button>
			</div>
		</form>
	</div>


</body>
</html>