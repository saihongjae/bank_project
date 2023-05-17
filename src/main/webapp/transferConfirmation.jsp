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
	alert("잔액이 부족합니다.");
	location.href = "accountTransfer.jsp";
	</script>
	<%
}

if(depositAmount <= 0){
	%>
	<script>
	alert("이체금액이 잘못 입력되었습니다.");
	location.href = "accountTransfer.jsp";
	</script>
	<%
}

if(selectAcc.equals(depositAcc)){
	%>
	<script>
	alert("이체하려는 계좌와 같은 계좌 입니다.");
	location.href = "accountTransfer.jsp";
	</script>
	<%
}

if(atDAO.accTransferCheck(request.getParameter("depositAcc"))==null){
	%>
	<script>
	alert("존재하지 않는 계좌번호입니다.");
	location.href = "accountTransfer.jsp";
	</script>
	<%
}

if(atDAO.pwcheck(request.getParameter("selectAcc"), request.getParameter("pw"))!=1){
	%>
	<script>
	alert("계좌번호나 비밀번호가 틀렸습니다.");
	location.href = "accountTransfer.jsp";
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
</body>
</html>