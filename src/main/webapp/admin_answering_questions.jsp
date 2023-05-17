<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.container{
	width: 100%;
	display: flex;
	}
	input{
	border: none;
	}
	.content{
	width: 50%;
	padding: 20px;
	}
	
	textarea{
	width: 100%;
	height: 500px;
	}
	
</style>
</head>
<body>
<%@ include file="admin_navbar.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>
	<form action="answer_check.jsp"  method="post">
	<div class="container">
	<div class="content">
		<p>아이디 : <input name="id" value="<%=request.getParameter("id")%>"></p>
		<p>날짜 : <input name="date" value="<%=request.getParameter("date")%>"></p>
		<p>제목 : <input name="title" value="<%=request.getParameter("title")%>"></p>
		<p>내용 : <%=request.getParameter("content")%></p>
	</div>
	<div class="content">
			<textarea name="answerContent"></textarea>
			<button type="submit">확인</button>
	</div>
	</div>
	</form>


</body>
</html>