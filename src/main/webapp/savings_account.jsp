<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navBar.jsp"%>
<form action="savings_account_check.jsp">

    <input type="text"  id="name"  name="name"  placeholder="이름">
    <br>
    <input type="text"  id="ssn"  name="ssn" placeholder="주민번호">
    <br>
    <input type="text" id="pw"  name="pw" placeholder="계좌 비밀번호">

    <input type="submit" value="확인">
</form>


</body>
</html>