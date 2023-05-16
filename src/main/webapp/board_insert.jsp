<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bank.dto.BoardDTO"%>
<%@page import="bank.dao.BoardDAO"%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
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
		 Swal.fire({
			  icon: 'success',
			  title: '문의 접수가 완료되었습니다.'
			})
		  setTimeout("location.href= 'boardList.jsp'",2000);
	</script>
		<%
	} else {
		%>
		<script>
		Swal.fire({
			  icon: 'warning',
			  title: '문의 접수를 실패하였습니다.'
			})
	</script>
		<%
	}
	%>
		
	
	


</body>
</html>
