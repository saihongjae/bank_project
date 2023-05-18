<%@page import="bank.dao.accCanDAO"%>
<%@page import="bank.dao.accountTransferDAO"%>
<%@page import="bank.dto.accountTransferDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
accountTransferDAO actDAO = new accountTransferDAO();
accCanDAO accCanDAO = new accCanDAO();
if(request.getParameter("bal").equals(null)){
	if(accCanDAO.depositAccunt(request.getParameter("accnum"))){
		%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "계좌 해지를 완료하였습니다."
		});
	  setTimeout("location.href = 'main.jsp'",1000);
	</script>
	<%
	} else {
		%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "계좌 해지를 실패하였습니다."
		});

	</script>
	<%
	}
} else {
	if(actDAO.depositExecution2(request.getParameter("bal"), request.getParameter("depacc"))){
		if(accCanDAO.depositAccunt(request.getParameter("accnum"))){
			%>
	<script>
		 Swal.fire({
			  icon: 'warning',
			  title: "계좌 해지를 완료하였습니다."
			});
		  setTimeout("location.href = 'main.jsp'",1000);
		</script>
	<%
		} else {
			%>
	<script>
		 Swal.fire({
			  icon: 'warning',
			  title: "계좌 해지를 실패하였습니다."
			});

		</script>
	<%
		}
	} else {
		%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "계좌 해지를 실패하였습니다."
		});

	</script>
	<%
	}	
}
%>
</body>
</html>