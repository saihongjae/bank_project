<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행 관리자페이지</title>
<style>
#container {
	width: 500px;
	height: 400px;
	border: 1px solid black;
	margin: auto;
	padding: 50px;
}

.btnWrapper {
margin-top: 70px;
}

.btnWrapper button{
width: 49%;
margin: 0 2px;
}
</style>
</head>

<body>
	<%@ include file="admin_navbar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<div id="container">
	<h3>관리자 로그인</h3>
		<form name="frmLogin" method="post" action="login_check.jsp"
			encType="UTF-8">
			<div class="mb-3">
				<label for="m_id" class="form-label">ID</label> <input type="text"
					class="form-control" id="m_id" name="id">
			</div>
			<div class="mb-3">
				<label for="m_pw" class="form-label">Password</label> <input
					type="password" class="form-control" id="m_pw" name="pw">
			</div>
			<div class="btnWrapper">
				<button type="submit" class="btn btn-primary">로그인</button><button type="reset" class="btn btn-primary">다시 입력</button>
			</div>
		</form>
	</div>
</body>

</html>