<%@page import="bank.dto.accountTransferDTO"%>
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


				<form action="" method="post" name="sendMoneyForm">
				<select id="accnum" name="selectAccNum">
<%
   accountTransferDAO acnDAO = new accountTransferDAO();
   List<accountTransferDTO> amoList = acnDAO.accountNumList(userID);
   
		for(accountTransferDTO item : amoList){
	%>
			<option value="<%=item.getAccnum()%>"><%=item.getAccnum()%></option>
	<%
		}
	%>
	</select><br>
	
	<input id="bal" type="text" value=""><button id="btn" type="button">잔액확인</button><br>
	

	
	<input type="text">입금계좌번호 <br>
	<input type="text">입금 금액 입력 <br>
	100만 50만 10만 5만 1만 전액 정정 <br>
	<input type="text">계좌비밀번호 <br>
				</form>
				
<script>	
function setInnerHTML()  {
	  const element = document.getElementById('content');
	  element.innerHTML = "<div style='color:red'>A</div>";
	}
	
</script>
</body>
</html>