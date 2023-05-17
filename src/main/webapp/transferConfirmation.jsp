<%@page import="bank.dao.accountTransferDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
<%@ include file="navBar.jsp" %>
<form action="depositExecution.jsp" method="post">

<%
accountTransferDAO atDAO = new accountTransferDAO();
int depositAmount = Integer.parseInt(request.getParameter("depositAmount"));
int balance = Integer.parseInt(request.getParameter("balance"));
String selectAcc = request.getParameter("selectAcc");
String depositAcc = request.getParameter("depositAcc");

if(balance < depositAmount){
	%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "잔액이 부족합니다."
		})
	  setTimeout("location.href = 'accountTransfer.jsp'",1000);
	</script>
	<%
}

if(depositAmount <= 0){
	%>
	<script>
	 Swal.fire({
		  icon: 'error',
		  title: "이체금액이 잘못 입력되었습니다."
		})
	  setTimeout("location.href = 'accountTransfer.jsp'",1000);
	</script>
	<%
}

if(selectAcc.equals(depositAcc)){
	%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "이체하려는 계좌와 같은 계좌 입니다."
		})
	  setTimeout("location.href = 'accountTransfer.jsp'",1000);
	</script>
	<%
}

if(atDAO.accTransferCheck(request.getParameter("depositAcc"))==null){
	%>
	<script>
	 Swal.fire({
		  icon: 'error',
		  title: "존재하지 않는 계좌번호입니다."
		})
	  setTimeout("location.href = 'accountTransfer.jsp'",1000);
	</script>
	<%
}

if(atDAO.pwcheck(request.getParameter("selectAcc"), request.getParameter("pw"))!=1){
	%>
	<script>
	 Swal.fire({
		  icon: 'error',
		  title: "계좌번호나 비밀번호가 틀렸습니다."
		})
	  setTimeout("location.href = 'accountTransfer.jsp'",1000);
	</script>
	<%
}
%>

출금계좌번호
<input name="selectAcc" value="<%=request.getParameter("selectAcc")%>" readonly><br>

입금계좌번호
<input name="depositAcc" value="<%=request.getParameter("depositAcc")%>" readonly><br>

이체금액(원)
<input name="depositAmount" value="<%=request.getParameter("depositAmount")%>" readonly><br>

받는분 예금주명
<input name="name" value="<%=atDAO.accTransferCheck(request.getParameter("depositAcc"))%>" readonly><br>

<button>결제</button>
		

</form>
	<%@ include file="./footer.jsp"%>

</body>
</html>