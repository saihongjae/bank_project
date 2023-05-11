<%@page import="bank.dto.RequestApproved_DTO"%>
<%@page import="bank.dao.RequestApproved_DAO"%>
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
RequestApproved_DAO dao = new RequestApproved_DAO();
RequestApproved_DTO dto = new RequestApproved_DTO();

	dto.setAccnum(request.getParameter("accnum"));
	dto.setRequestDate(request.getParameter("requestDate"));
	
	int successCheck = dao.RequestApproved(dto.getAccnum(), dto.getRequestDate());
	
		if (successCheck == 1) {
%>
			  <script>
				location.replace('admin_tap.jsp');
			</script>
			<%
		} else {
			%>
			  <script>
				location.replace('admin_tap.jsp');
			</script>
			<%
		}		
		%>
</body>
</html>