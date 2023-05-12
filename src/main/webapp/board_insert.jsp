<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bank.dto.BoardDTO"%>
<%@page import="bank.dao.BoardDAO"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	BoardDAO boardDAO = new BoardDAO();
	BoardDTO boardDTO = new BoardDTO();
	
	boardDTO.setId(request.getParameter("id"));
	boardDTO.setTitle(request.getParameter("title"));
	boardDTO.setContent(request.getParameter("content"));
	
	int val = boardDAO.insertContentInfo(boardDTO);
	
	if(val == 1) {
		%>
		<script>
	alert('문의 접수가 완료되었습니다.');
	location.href= 'boardList.jsp';
	</script>
		<%
	} else {
		%>
		<script>
	alert('문의 접수를 실패하였습니다.');
	</script>
		<%
	}
	%>
		
	
	


</body>
</html>
