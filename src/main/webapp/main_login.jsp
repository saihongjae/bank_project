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
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>

<body>
	<%@ include file="navBar.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<div class="loginWrapper">
	<h1>환영합니다 :)</h1>
	<div class="loginBlock">
	<div class="logo">
		<div class="logo__circle">
			<svg class="logo__svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 124.673 124.676" width="124.673" height="124.676"><path id="Bank-Icon-podl_dkf" data-name="Bank-Icon-podl;dkf" d="M0,124.676v-5.208H124.673v5.208ZM85.712,114.3v-5.208h5.208V57.155H85.712V51.946h31.155v5.208h-5.195v51.934h5.195V114.3Zm-38.96,0v-5.208h5.208V57.155H46.752V51.946H77.921v5.208H72.726v51.934h5.195V114.3Zm-38.96,0v-5.208h5.195V57.155H7.792V51.946H38.96v5.208H33.765v51.934H38.96V114.3ZM2.611,46.756a2.6,2.6,0,0,1-1.492-4.729L60.858.469a2.565,2.565,0,0,1,2.957,0l59.753,41.558a2.6,2.6,0,0,1-1.492,4.729Zm49.35-20.779a10.383,10.383,0,1,0,10.376-10.39A10.391,10.391,0,0,0,51.961,25.977Zm5.181,0a5.2,5.2,0,1,1,5.195,5.195A5.2,5.2,0,0,1,57.142,25.977Z"/></svg>
		</div>
	</div>
	<form class="form" action="./loginCheck.jsp" method="post">
		<div class="form__group">
			<div class="form__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M5 5a5 5 0 0 1 10 0v2A5 5 0 0 1 5 7V5zM0 16.68A19.9 19.9 0 0 1 10 14c3.64 0 7.06.97 10 2.68V20H0v-3.32z"/></svg></div>
			<input class="form__control" name="id" type="text" placeholder="사용자 이름">
		</div>
		<div class="form__group">
			<div class="form__icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M4 8V6a6 6 0 1 1 12 0v2h1a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-8c0-1.1.9-2 2-2h1zm5 6.73V17h2v-2.27a2 2 0 1 0-2 0zM7 6v2h6V6a3 3 0 0 0-6 0z"/></svg></div>
			<input class="form__control" name="pw" type="password" placeholder="암호">
		</div>
		<div>
			<button class="form__button" type="submit">
				로그인
			</button>
		</div>
	</form>
</div>
</div>

<%@ include file="./footer.jsp"%>
</body>

</html>