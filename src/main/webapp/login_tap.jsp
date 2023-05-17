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
<title>삼조은행</title>
<style>
	#container {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 400px;
		height: 400px;
		border:1px solid black;
		margin: auto;
	}
</style>
</head>

<body>
	<div id="container">
		<form name="frmLogin" method="post" action="login_check.jsp"
		encType="UTF-8">
		아이디 :<input id="m_id" type="text" name="id"><br> 비밀번호 :<input
		id="m_pw" type="password" name="pw"><br> <input id="submit"
			type="submit" value="로그인"> <input type="reset" value="다시입력">
	</form>
	</div>
	<%@ include file="./footer.jsp"%>

</body>

</html>