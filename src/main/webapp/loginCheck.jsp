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
<%@page import="bank.oracle.PWManager"%>
<%@page import="bank.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	String loc = "";
	
	MemberDAO memberDao = new MemberDAO();
	boolean isLoggedIn = memberDao.loginMember(id, PWManager.encryption(pass));
	if (isLoggedIn) {
		session.setAttribute("id", id); // id를 세션값으로 설정 
		if (session.getAttribute("loc") != null) {
			loc = ((String) session.getAttribute("loc")).substring(1);
		}
	%>
	<script>
		Swal.fire("<%=id%> 님 환영합니다 :) ");
		if ("<%=loc%>" != "") { 
			setTimeout("location.href = '<%=loc%>'",1000);
		} else {
			setTimeout("location.href = './main.jsp'", 1000);
		}
	</script>
	<%
	} else {
	%>
	<script>
	Swal.fire({
		  icon: 'error',
		  title: "로그인 실패.."
		})
		setTimeout("history.back()", 3000);
	</script>
	<%
	}
	%>
	
</body>
</body>

</html>