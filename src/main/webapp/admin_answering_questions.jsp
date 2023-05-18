<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/lock.png">
<title>삼조은행 관리자페이지</title>
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
	height: 160px;
	}
	
</style>
</head>
<body>
<%@ include file="admin_navbar.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	if (adminID == null || !adminID.equals("kingsaihong")) { %>
	<script>
	Swal.fire({
		  icon: 'warning',
		  title: "로그인이 필요한 페이지입니다"
		})
		setTimeout("location.href = 'login_tap.jsp'",1000);
	</script>
	<% 
	return;
	} 
%>
	<form action="answer_check.jsp"  method="post">
	<div class="container">
	<div class="content">
		<p>아이디 : <input name="id" value="<%=request.getParameter("id")%>"></p>
		<p>날짜 : <input name="date" value="<%=request.getParameter("date")%>"></p>
		<p>제목 : <input name="title" value="<%=request.getParameter("title")%>"></p>
		<p>내용 : <%=request.getParameter("content")%></p>
	</div>
	<div class="content">
		<div class="form-floating">
        	<textarea class="form-control" placeholder="Leave a comment here"
            	name="answerContent" style="height: 100px" maxlength="1000" required></textarea>
        	 <label for="floatingTextarea2">답변을 입력하세요(1,000자 이내)</label>
     	</div>
     	<br />
		<button type="submit" class="btn btn-info">확인</button>
	</div>
	</div>
	</form>
</body>
</html>