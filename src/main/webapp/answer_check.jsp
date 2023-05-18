<%@page import="bank.dto.answerDTO"%>
<%@page import="bank.dao.answerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
<title>삼조은행</title>
</head>
<body>

<% 
request.setCharacterEncoding("UTF-8");

answerDAO answerDAO = new answerDAO();
answerDTO answerDTO = new answerDTO();

answerDTO.setId(request.getParameter("id"));
answerDTO.setTitle(request.getParameter("title"));
answerDTO.setDate(request.getParameter("date"));
answerDTO.setAnswerContent(request.getParameter("answerContent"));

int result = answerDAO.answerUpdate(answerDTO.getId(), answerDTO.getTitle(), answerDTO.getDate(), answerDTO.getAnswerContent());

if (result == 1) {
%>
<script>
location.href= 'QnA_admin_tap.jsp';
</script>
<% } else {  %>
<script>
Swal.fire({
	  icon: 'error',
	  title: "답변등록 실패.."
});
setTimeout("history.back()", 1000);
</script>
<% } %>
</body>
</html>