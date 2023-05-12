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
		if (session.getAttribute("id") == null) { // null이 아니면 로그인한 것
			session.setAttribute("loc", request.getServletPath()); %>
		<script>
			alert("로그인이 필요한 페이지입니다");
			location.href="main_login.jsp";
		</script>
		return;
	<% 	} %>
	
	<%@ include file="navBar.jsp"%>
	<div class="productWrapper">
		<h1>
			삼조뱅크 입출금통장 <span style="display: block">까다로운 계좌개설도 <br /> 정말 손쉽게
			</span>
		</h1>
		<ul class="underTxts">
			<li>친구에게 <br /> 간편하게 이체</li>
			<li>보안은 <br /> 더 강력하게</li>
		</ul>
		<a href="normalNotice.jsp">바로가기</a>
	</div>
</body>

</html>