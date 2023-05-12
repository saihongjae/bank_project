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
<body>
<%@ include file="admin_navbar.jsp"%>
<%
  QnaDAO QnaDAO = new QnaDAO();
   List<QnaDTO> questionList = QnaDAO.QuestionInfoList(); 
   
   for(QnaDTO item : questionList){
	%>
			<tr>
				<a href="answer_tap.jsp?id=<%=item.getId()%> and title=<%=item.getTitle()%> and question_date=<%=item.getQuastDate()%>" method="post">
					<td><%=item.getId()%></td>
					<td><%=item.getTitle()%></td>
					<td><%=item.getQuastDate()%></td>
					<td><%=item.getContent()%></td>
					
				</a>
			</tr><br>
	<%
		}
	%>
	
	
</body>
</html>