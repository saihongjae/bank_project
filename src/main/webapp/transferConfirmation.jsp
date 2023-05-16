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

request.getParameter("selectAcc");
request.getParameter("balance");
request.getParameter("depositAmount");

accountTransferDAO atDAO = new accountTransferDAO();

if(atDAO.pwcheck(request.getParameter("selectAcc"), request.getParameter("pw"))==1){
	if(atDAO.accTransferCheck(request.getParameter("depositAcc"))==null){
		%>
		<script>
		alert("존재하지 않는 계좌번호입니다.");
		location.href = "accountTransfer.jsp";
		</script>
		<%
	}
} else {
	%>
	<script>
	alert("계좌번호나 비밀번호가 틀렸습니다.");
	location.href = "accountTransfer.jsp";
	</script>
	<%
}
%>

출금계좌번호
<input name="selectAcc" value="<%=request.getParameter("selectAcc")%>"><br>

입금계좌번호
<input type="" name="depositAcc" value="<%=request.getParameter("depositAcc")%>"><br>

이체금액(원)
<input type="" name="depositAmount" value="<%=request.getParameter("depositAmount")%>"><br>

받는분 예금주명
<input name="name" value="<%=atDAO.accTransferCheck(request.getParameter("depositAcc"))%>"><br>

<button>결제</button>
		

</form>
</body>
</html>