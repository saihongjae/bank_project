<%@page import="bank.dto.Admin_DTO"%>
<%@page import="bank.dao.Admin_DAO"%>
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
<title>Insert title here</title>
</head>
<body>
<%
Admin_DAO dao = new Admin_DAO();
	Admin_DTO dto = new Admin_DTO();

	dto.setAdmin_id(request.getParameter("id"));
	dto.setAdmin_pw(request.getParameter("pw"));
	
	int LoginCheckValue = dao.BankManagerLoginCheck(dto.getAdmin_id(), dto.getAdmin_pw());
	
		if (LoginCheckValue == 1) {
%>
			  <script>
				alert("로그인 성공");
				location.replace('admin_tap.jsp');
			</script>
			<%
		} else if (LoginCheckValue == 2) {
			%>
			  <script>
				alert("로그인 실패");
				location.replace('login_tap.jsp');
			</script>
			<%
		}		
		%>
		
</body>
</html>