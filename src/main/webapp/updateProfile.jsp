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
				alert('수정 성공');
				location.href = './myPage.jsp?phone=<%=phone%>';
		</script>
	<%
		} else {
	%>
		<script>
			alert('수정실패..');
			location.href = './myPage.jsp?phone=<%=phone%>';
		</script>
	<%
		}
	%>
	



</body>
</html>