<%@page import="bank.dto.answerDTO"%>
<%@page import="bank.dao.answerDAO"%>
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

<% 
request.setCharacterEncoding("UTF-8");

answerDAO answerDAO = new answerDAO();
answerDTO answerDTO = new answerDTO();

answerDTO.setId(request.getParameter("id"));
answerDTO.setTitle(request.getParameter("title"));
answerDTO.setDate(request.getParameter("date"));
answerDTO.setAnswerContent(request.getParameter("answerContent"));

answerDAO.answerUpdate(answerDTO.getId(), answerDTO.getTitle(), answerDTO.getDate(), answerDTO.getAnswerContent());
%>
<script>
location.href= 'QnA_admin_tap.jsp';
</script>


</body>
</html>