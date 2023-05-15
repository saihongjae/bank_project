<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="navBar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	%>


	<%
		
		BoardDAO boardDao = new BoardDAO();
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		
	int result = boardDao.deleteBoardList(id);
		
		if(result == 1){
			//삭제성공
	%>
	<script>
			alert('삭제 성공');
			location.href = './boardList.jsp'; 
		</script>
	<%
		} else {
	%>
	<script>
				alert('삭제실패..');
				location.href = './board_detail.jsp?id=<%=id%>';
			</script>
	<%
		}
	%>


</body>
</html>