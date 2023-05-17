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
<title>Insert title here</title>
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
			setTimeout("location.href = './myPage.jsp?phone=<%=phone%>'",1000);
		</script>
	<%
		} else {
	%>
		<script>
		Swal.fire({
			  icon: 'error',
			  title: "수정실패..."
			})
			setTimeout("location.href = './myPage.jsp?phone=<%=phone%>'",1000);
		</script>
	<%
		}
	%>
	



</body>
</html>