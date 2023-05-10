<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		session.invalidate();
	%>
	<script>
		alert("로그아웃 되었습니다");
		location.href="main.jsp";
	</script>
</body>
</html>