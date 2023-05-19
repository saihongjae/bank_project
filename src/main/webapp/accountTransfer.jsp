<%@page import="bank.dto.accountTransferDTO"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<style>
	#container1 {
	width: 500px;
    height: 400px;
    border: 1px solid black;
    margin: auto;
    padding: 40px;
    }
</style>
<title>삼조은행</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<% 
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("id")==null) { // null이 아니면 로그인한 것
		%>
	<script>
	 Swal.fire({
		  icon: 'warning',
		  title: "로그인 후 시도하세요."
		})
	  setTimeout("location.href = 'main_login.jsp'",1000);
	</script>
	<%
	return;	
	}
	
	accountTransferDAO acnDAO = new accountTransferDAO();
	List<accountTransferDTO> amoList = acnDAO.accountNumList(userID);
	
	if (amoList.size() == 0) { %> 
	<script>
	 Swal.fire({
		icon: 'warning',
		title: '이체가 가능한 통장이 없습니다.',
		showConfirmButton: false,
		timer: 1500
	 });
	 setTimeout("location.href = 'main.jsp'", 1500);
	</script>
	<%
	return;
	}
	%>

	<div id="container1">
	<h3>계좌 이체</h3>
	<form action="transferConfirmation.jsp" method="post"
		name="sendMoneyForm">
		<select id="sel" name="selectAcc">
	<%
		for(accountTransferDTO item : amoList){
	%>
			<option value="<%=item.getAccnum()%>"><%=item.getAccnum()%></option>
			<%
		}
	%>
		</select> <br> 
		<input id="bal" type="text" value="0" name="balance" readonly>
		<button id="balbtn" type="button">잔액확인</button><br>
		<br>
		<input type="text" name="depositAcc">입금계좌번호 <br>
		<br>
		<input name="depositAmount" id="depositAmount" type="text" value="0">입금 금액 입력 <br>
		<button class="moneyBtn fivehunthou" type="button" value="500000">50만</button>
		<button class="moneyBtn onehunthou" type="button" value="100000">10만</button>
		<button class="moneyBtn fivehun" type="button" value="50000">5만</button>
		<button class="moneyBtn onehun" type="button" value="10000">1만</button>
		<button id="allBtn" type="button" value="0">전액</button>
		<button id="zeroBtn" type="button" value="0">정정</button><br>
		<br>
		<input name="pw" type="text">계좌비밀번호 <br>
		<br>
		<button class="btn btn-success">확인</button>
	</form>
	</div>
	<footer class="footer" style="position: absolute; bottom: 0;">
			<ul class="noticeLists">
				<li>개인정보처리방침</li>
				<li>신용정보활용체제</li>
				<li>전자민원</li>
				<li>사고신고</li>
				<li>삼조지킴이</li>
				<li>보호금융상품등록부</li>
				<li>상품공시실</li>
				<li>영업점안내</li>
				<li>상담신청</li>
				<li>웹접근성이용안내</li>
				<li>위치기반서비스약관</li>
			</ul>
			<ul class="underNoticeLists">
				<li>(주)삼조뱅크·최초롱·사업자번호 111-11-11111　</li>
				<li>고객센터 <span>1599-8000　</span></li>
				<li>평일 09:00 ~ 18:00 (은행휴무일 제외)</li>
			</ul>
			<div class="footerBottom">
			<p class="copyRight">Copyright © Samjo Bank Korea. All Rights Reserved.</p>
				<ul class="snsBtns">
				<li>
					<button class="youtubeBtn" type="button">
						<i class="fa-brands fa-youtube"></i>
					</button>
				</li>
				<li>
					<button class="fbBtn" type="button">
						<i class="fa-brands fa-facebook"></i>
					</button>
				</li>
				<li>
					<button class="twitterBtn" type="button">
						<i class="fa-brands fa-twitter"></i>
					</button>
				</li>
				<li>
					<button class="instaBtn" type="button">
						<i class="fa-brands fa-instagram"></i></i>
					</button>
				</li>
			</ul>
			</div>
		
	</footer>
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