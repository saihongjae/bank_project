<%@page import="bank.dto.QnaDTO"%>
<%@page import="bank.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/lock.png">
<title>삼조은행 관리자페이지</title>
</head>
<style>
*{
	margin: 0;
	padding: 0;
	text-align: center;
	}
	
	 table{
    width: 100%;
    border: solid 1px;
    }
    
    input{
    border: none;
    }
</style>
<body>
<%@ include file="admin_navbar.jsp"%>
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

	QnaDAO QnaDAO = new QnaDAO();
	List<QnaDTO> questionList = QnaDAO.QuestionInfoList(); 

	if (questionList.size() == 0) { %>
	<div class="alert alert-success" style="margin: 30px;" role="alert">
 	답변 대기 중인 문의글이 없습니다.
	</div>
<% return;
} %>

<table class="container">
		<thead>
			<tr>
				<th>이름</th>
				<th>제목</th>
				<th>내용</th>
				<th>요청시간</th>
			</tr>
		</thead>
		<tbody>
<%
 
   
   for(QnaDTO item : questionList){
	%>
			<tr>
				<form action="admin_answering_questions.jsp" method="post">
					<td><input name="id"   value="<%=item.getId()%>" readonly></td>
					<td><input name="title"   value="<%=item.getTitle()%>" readonly></td>
					<td><input name="content"   value="<%=item.getContent()%>" readonly></td>
					<td><input name="date"   value="<%=item.getQuastDate()%>" readonly></td>
					<td><button type="submit" class="btn btn-outline-dark" style="width: 100%;">답변</button></td>
				</form>
			</tr>
	<%
		}
	%>
	</tbody>	
	</table>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>