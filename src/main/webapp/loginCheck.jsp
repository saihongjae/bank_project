<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="bank.orcle.DBConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_id = "scott";
	String db_pw = "tiger";
	Connection con = DriverManager.getConnection(db_url, db_id, db_pw);

	String sql = "select * from bank_member";
	PreparedStatement pstmt = con.prepareStatement(sql);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {		
			System.out.println("아이디 있음");
		if (pass.equals(rs.getString("pw"))) {
			System.out.println("비밀번호 맞음");
			session.setAttribute("id", id);
		} else {
			System.out.println("비밀번호 틀림");
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
	}
	} else {
	System.out.println("아이디 없음");
	%>
	<script type="text/javascript">
		alert("아이디 없음");
		history.back();
	</script>
	<%
	}
	%>


<%--	
	<%@ include file="navBar.jsp"%>

	<%  request.setCharacterEncoding("UTF-8"); %>
<% 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");


	Connection conn = DBConnectionManager.getConnection();
	String sql = "select * from bank_member";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(sql);
	String password;
	rs.next();
	password = rs.getString("pass");

	
	if(password.equals(pass)){
		System.out.println("<script>");
		System.out.println("alert('로그인 성공! 환영합니다 :) ')");
		//System.out.println("location.href='main.jsp'");
		System.out.println("</script>");
	}else{
		System.out.println("<script>");
		System.out.println("alert('회원정보가 일치하지 않습니다!')");
		//System.out.println("location.href='login.jsp'");
		System.out.println("</script>");
	}

%>
--%> 


</body>
</html>