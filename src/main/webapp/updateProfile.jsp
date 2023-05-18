<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bank.dao.mypageDAO"%>
<%@ page import="bank.dto.mypageDTO"%>
<%@page import="bank.oracle.DBConnectionManager"%>
<%@ page import="java.util.*"%>
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
	<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		mypageDAO mypageDao = new mypageDAO();
		mypageDTO mypageDto = new mypageDTO();
		
		String id = (String)session.getAttribute("id");
		String phone = request.getParameter("phone");
		String email = request.getParameter("emailId") + "@" + request.getParameter("emailAddr");

	%>	
		

	<% 
		int result = mypageDao.changeProfile(id,phone,email);
		
		
		if(result == 1){%>
		<script>
		Swal.fire({
			  icon: 'success',
			  title: "수정 성공"
			})
			setTimeout("location.href = './myPage.jsp'",1000);
										//phone넘겨줘서 쓸곳이 따로 있는건가요? 
		</script>
	<%
		} else {
	%>
		<script>
		Swal.fire({
			  icon: 'error',
			  title: "수정실패..."
			})
			setTimeout("location.href = './myPage.jsp'",1000);
		</script>
	<%
		}
	%>
	



</body>
</html>