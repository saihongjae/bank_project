<%@page import="org.apache.catalina.connector.Response"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bank_project_java.bank_Dto"%>
<%@page import="bank_project_java.bank_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form name="frmLogin" method="post" action="login_tap.jsp"
		encType="UTF-8">
		아이디 :<input type="text" name="id"><br> 비밀번호 :<input
			type="password" name="pw"><br> <input id="submit"
			type="submit" value="로그인"> <input type="reset" value="다시입력">
	</form>
	</div>

	<script>
document.querySelector("#submit").addEventListener('click', function () {
<%
bank_Dao dao = new bank_Dao();
bank_Dto dto = new bank_Dto();

dto.setAdmin_id(request.getParameter("id"));
dto.setAdmin_pw(request.getParameter("pw"));

boolean LoginCheckValue = dao.BankManagerLoginCheck(dto.getAdmin_id(), dto.getAdmin_pw());

if (LoginCheckValue) {
	response.sendRedirect("admin_tap.jsp");
	return;
} else {
	out.print("로그인 실패");
}
%>

});
</script>
</body>

</html>