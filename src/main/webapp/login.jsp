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
<title>LOGIN</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<h1>환영합니다 :)</h1>

	<form action="loginCheck.jsp" method="post">
		<table>
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr><td colspan="2" align="center"><input type="submit" value="로그인하기"></td></tr>
		</table>
	</form>




</body>
</html>