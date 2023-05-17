<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
<%@ include file="navBar.jsp"%>
<form action="savings_account_check.jsp">

    <input type="text"  id="name"  name="name"  placeholder="이름">
    <br>
    <input type="text"  id="dn_ssn"  name="dn_ssn" placeholder="주민번호">
    <br>
    <input type="text" id="dn_pw"  name="dn_pw" placeholder="계좌 비밀번호">

    <input type="submit" value="확인">
</form>

	<%@ include file="./footer.jsp"%>

</body>
</html>