<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bank.dao.Admin_DAO"%>
<%@page import="bank.dto.Admin_DTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
</head>
<body>
<%
	Admin_DAO dao = new Admin_DAO();
	Admin_DTO dto = new Admin_DTO();

	dto.setAdmin_id(request.getParameter("id"));
	dto.setAdmin_pw(request.getParameter("pw"));
	
	int LoginCheckValue = dao.BankManagerLoginCheck(dto.getAdmin_id(), dto.getAdmin_pw());
	
		if (LoginCheckValue == 1) {
			session.setAttribute("id", request.getParameter("id"));
%>
			  <script>
			  Swal.fire({
				  icon: 'success',
				  title: "로그인 성공"
				})
			  setTimeout("location.replace('admin_tap.jsp')",1000);
			</script>
			<%
		} else if (LoginCheckValue == 2) {
			%>
			  <script>
			  Swal.fire({
				  icon: 'warning',
				  title: "로그인 실패"
				})
			  setTimeout("location.replace('login_tap.jsp')",1000);
			</script>
			<%
		}		
		%>
		
</body>
</html>