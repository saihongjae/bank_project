<%@page import="bank.dto.accCanDTO"%>
<%@page import="bank.dao.accCanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/inquiryPage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>

	<%
	if (request.getParameter("balance").equals("0")) {
	%>
		<form action="accountCancellation.jsp">
			해지할 계좌 <br> 
			<input type="text" name="accnum" value="<%=request.getParameter("accnum")%>" readonly></input><br>
			잔액 <br>
			0<br>
			<button>해지</button>
			<%
		} else {
			%>
			<form action="accountCancellation.jsp">
			해지할 계좌 <br>
			 <input type="text" name="accnum"
				value="<%=request.getParameter("accnum")%>" readonly></input><br>
			잔액 <br> 
			<input type="text" name="bal"
				value="<%=request.getParameter("balance")%>" readonly></input><br>
			잔액 입금 계좌 <br>
			
			<select name="depacc">
			<%
			accCanDAO acDAO = new accCanDAO();
			List<accCanDTO> amoList = acDAO.selectDepositAccount(request.getParameter("accnum"));
			for (accCanDTO item : amoList) {
			%>
			
			<option value="<%=item.getAccnum()%>"><%=item.getAccnum()%></option>
			<%
			}
			%>
			</select>
			<button>해지</button>
			<%
			}
			%>



		</form>
</body>
</html>