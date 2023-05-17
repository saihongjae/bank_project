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
	<%@ include file="navBar.jsp"%>
	<% 
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("id")==null) { // null이 아니면 로그인한 것
		%>
	<script>
		alert("로그인 후 시도하세요.");
		location.href = "main_login.jsp";
		</script>
	<%
		}
		%>


	<form action="transferConfirmation.jsp" method="post"
		name="sendMoneyForm">
		<select id="sel" name="selectAcc">
			<%
   accountTransferDAO acnDAO = new accountTransferDAO();
   List<accountTransferDTO> amoList = acnDAO.accountNumList(userID);
		for(accountTransferDTO item : amoList){
	%>
			<option value="<%=item.getAccnum()%>"><%=item.getAccnum()%></option>
			<%
		}
	%>
		</select> <br> 
		<input id="bal" type="text" value="0" name="balance" readonly>
		<button id="balbtn" type="button">잔액확인</button><br>
		
		<input type="text" name="depositAcc">입금계좌번호 <br>
		
		<input name="depositAmount" id="depositAmount" type="text" value="0">입금 금액 입력 <br>
		<button class="moneyBtn fivehunthou" type="button" value="500000">50만</button>
		<button class="moneyBtn onehunthou" type="button" value="100000">10만</button>
		<button class="moneyBtn fivehun" type="button" value="50000">5만</button>
		<button class="moneyBtn onehun" type="button" value="10000">1만</button>
		<button id="allBtn" type="button" value="0">전액</button>
		<button id="zeroBtn" type="button" value="0">정정</button><br>
		
		<input name="pw" type="text">계좌비밀번호 <br>

		<button>확인</button>
	</form>

	<script>	
	document.querySelectorAll(".moneyBtn").forEach((btn)=>{
		btn.addEventListener('click', (e)=>{
			let beforeVal = document.querySelector("#depositAmount").value;
			document.querySelector("#depositAmount").value = Number(beforeVal) + Number(e.target.value);
		})
	});
	
	document.querySelector("#allBtn").addEventListener('click', (e)=>{
		document.querySelector("#depositAmount").value = e.target.value;
	})
	
	document.querySelector("#zeroBtn").addEventListener('click', (e)=>{
		document.querySelector("#depositAmount").value = e.target.value;
	});
	
	document.querySelector("#balbtn").addEventListener('click', ()=>{
		let value = document.sendMoneyForm.selectAcc.value;
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "request_ajax.jsp", true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("accNum=" + value);
		xhr.onreadystatechange = function() {
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				document.sendMoneyForm.balance.value = xhr.responseText;
				document.querySelector("#allBtn").value = xhr.responseText;
		}
	}
	});
		
</script>
</body>
</html>