<%@page import="bank.dto.answerDTO"%>
<%@page import="bank.dao.answerDAO"%>
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
request.setCharacterEncoding("UTF-8");

answerDAO answerDAO = new answerDAO();
answerDTO answerDTO = new answerDTO();

String id = request.getParameter("id");
String title = request.getParameter("title");
String date = request.getParameter("date");
String answerContent = request.getParameter("answerContent");


}



%>


</body>
</html>