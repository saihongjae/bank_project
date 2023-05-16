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
<%@ include file="checkBalance.jsp" %>

				<form action="" method="post" name="sendMoneyForm">
				<select id="sel" name="selectAccNum">
<%
   accountTransferDAO acnDAO = new accountTransferDAO();
   List<accountTransferDTO> amoList = acnDAO.accountNumList(userID);
   int i = 1;
		for(accountTransferDTO item : amoList){
	%>
			<option value="<%=item.getAccnum()%>"><%=item.getAccnum()%></option>
	<%
		}
	%>`
	</select><br>
	<input id="bal" type="text" value="<%=dto.getBalance()%>"><button id="balbtn" type="submit">잔액확인</button><br>
	

	
	<input type="text">입금계좌번호 <br>
	
	<input id="depositAmount" type="text" >입금 금액 입력 <br>
	<button id="fivehunthou" type="button">50만</button> 
	<button id="onehunthou" type="button">10만</button>
	<button id="fivehun" type="button">5만</button>
	<button id="onehun" type="button">1만</button>
	<button id="allbtn" type="button">전액</button>
	<button id="zero" type="button">정정</button><br>
	
	<input type="text">계좌비밀번호 <br>
	
	<button>확인</button>
				</form>
				
				
				
이체내용확인
No	출금계좌번호	입금계좌번호	이체금액(원)	받는분 예금주명
(실제 예금주명)	결과
수수료(원)
1	
948702-00-199350
SC은행
471161-35-859596메모	1	
이홍재삼성
(이홍재　삼성)	확인
필요
<script>	
const fivehunthou = document.querySelector("#fivehunthou");
fivehunthou.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = 500000;
});

const onehunthou = document.querySelector("#onehunthou");
onehunthou.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = 100000;
})
const fivehun = document.querySelector("#fivehun");
fivehun.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = 50000;
})
const onehun = document.querySelector("#onehun");
onehun.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = 10000;
})
const allbtn = document.querySelector("#allbtn");
allbtn.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = <%=dto.getAccnum()%>;
})



const zero = document.querySelector("#zero");
zero.addEventListener("click", function(){
	document.querySelector("#depositAmount").value = 0;
})


const btn = document.querySelector("#balbtn");
btn.addEventListener("click", function(){
	document.querySelector("form").action = "checkBalance.jsp";
})
	
	const selop = document.querySelector("#sel");
	const sellen = selop.options.length;
	for(let i=0; i<sellen; i++){
		if(selop.options[i].value == <%=dto.getAccnum()%>){
			selop.options[i].selected = true;
		}
	}
</script>
</body>
</html>