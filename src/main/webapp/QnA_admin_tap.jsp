<%@page import="bank.dto.QnaDTO"%>
<%@page import="bank.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<table>
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
  QnaDAO QnaDAO = new QnaDAO();
   List<QnaDTO> questionList = QnaDAO.QuestionInfoList(); 
   
   for(QnaDTO item : questionList){
	%>
			<tr>
				<form action="admin_answering_questions.jsp" method="post">
					<td><input name="id"   value="<%=item.getId()%>" readonly></td>
					<td><input name="title"   value="<%=item.getTitle()%>" readonly></td>
					<td><input name="content"   value="<%=item.getContent()%>" readonly></td>
					<td><input name="date"   value="<%=item.getQuastDate()%>" readonly></td>
					<td><button type="submit">답변</button></td>
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