<%@page import="bank.dao.accountTransferDAO"%>
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
accountTransferDAO atDAO = new accountTransferDAO();
if(atDAO.depositExecution1(request.getParameter("depositAmount"), request.getParameter("selectAcc"))){
	if(atDAO.depositExecution2(request.getParameter("depositAmount"), request.getParameter("depositAcc"))){
		%>
		<script>
		alert("계좌이체를 완료하였습다.");
		location.href = "main.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert("계좌이체를 실패하였습다.");
		location.href = "transferConfirmation.jsp";
		</script>
		<%
	}
} else {
	%>
	<script>
	alert("계좌이체를 실패하였습다.");
	location.href = "transferConfirmation.jsp";
	</script>
	<%
}

%>

</body>
</html>