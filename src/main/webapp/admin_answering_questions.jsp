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
	display: flax;
	}

	.content{
	width: 50%;
	
	}
</style>
</head>
<body>
<%@ include file="admin_navbar.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>

<div class="container">
<div class="content" >
<p>아이디 : <%=request.getParameter("id")%></p>
<p>날짜 : <%=request.getParameter("date")%></p>
<p>제목 : <%=request.getParameter("title")%></p>
<p>내용 : <%=request.getParameter("content")%></p>
</div>

<div class="content">
<form action="">
<textarea style="width: 50%;"></textarea>
</form>
</div>
</div>


</body>
</html>