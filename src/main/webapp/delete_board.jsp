<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>

	<%@ include file="navBar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	%>


	<%
	BoardDAO boardDao = new BoardDAO();
	String id = (String) session.getAttribute("id");
	String bno = request.getParameter("bno");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	int result = boardDao.deleteBoardList(bno);

	if (result == 1) {
		//삭제성공
	%>
	<script>
		Swal.fire({
			  icon: 'success',
			  title: '삭제 성공'
			})
		setTimeout("location.href = './boardList.jsp'",1000);
		</script>
	<%
	} else {
	%>
	<script>
		Swal.fire({
			  icon: 'error',
			  title: '삭제실패..'
			})
		setTimeout("location.href = './board_detail.jsp?id=<%=id%>'",1000);
	</script>
	<%
	}
	%>


</body>
</html>