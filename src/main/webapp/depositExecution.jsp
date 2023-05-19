<%@page import="bank.dao.accountTransferDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
<title>삼조은행</title>
</head>
<body>

<%
accountTransferDAO atDAO = new accountTransferDAO();
if(atDAO.depositExecution1(request.getParameter("depositAmount"), request.getParameter("selectAcc"))){
	if(atDAO.depositExecution2(request.getParameter("depositAmount"), request.getParameter("depositAcc"))){
		%>
		<script>
		Swal.fire({
			  icon: 'success',
			  title: "계좌이체를 완료하였습니다."
			})
		  setTimeout("location.href = 'main.jsp'",1000);
		</script>
		<%
	} else {
		%>
		<script>
		Swal.fire({
			  icon: 'error',
			  title: "계좌이체를 실패하였습니다."
			})
		  setTimeout("location.href = 'transferConfirmation.jsp'",1000);
		</script>
		<%
	}
} else {
	%>
	<script>
	Swal.fire({
		  icon: 'error',
		  title: "계좌이체를 실패하였습니다."
		})
	  setTimeout("location.href = 'transferConfirmation.jsp'",1000);
	</script>
	<%
}

%>

</body>
</html>