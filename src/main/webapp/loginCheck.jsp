<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="bank.oracle.DBConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_id = "scott";
	String db_pw = "tiger";
	Connection con = DriverManager.getConnection(db_url, db_id, db_pw);
	String sql = "select * from bank_member" + " WHERE id = ? and pw = ?";

	PreparedStatement psmt = null;
	ResultSet rs = null;

	psmt = con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pass);

	rs = psmt.executeQuery();

	if (rs.next()) {
		session.setAttribute("id", id); // id를 세션값으로 설정
	%>
	<script>
		alert("<%=id%> 님 환영합니다 :) ")
	</script>
	<%
	} else {
	%>
	<script>
		alert("로그인 실패");
		history.back();
	</script>
	<%
	}
	%>

</body>
</html>