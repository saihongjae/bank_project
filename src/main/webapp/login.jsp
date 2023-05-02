<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.beans.Statement" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.SQLException" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file = "navBar.jsp" %>
	
	<h2  align="center">로그인</h2>
<% 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
%>


</body>
</html>