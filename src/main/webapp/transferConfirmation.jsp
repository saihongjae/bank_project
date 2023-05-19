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
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<title>삼조은행</title>
</head>
<body>
<%@ include file="navBar.jsp" %>


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
	return;
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
return;
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
return;
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
return;
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
return;
}
%>
<form action="depositExecution.jsp" method="post">
출금계좌번호
<input name="selectAcc" value="<%=request.getParameter("selectAcc")%>" readonly><br>
<br>

입금계좌번호
<input name="depositAcc" value="<%=request.getParameter("depositAcc")%>" readonly><br>
<br>

이체금액(원)
<input name="depositAmount" value="<%=request.getParameter("depositAmount")%>" readonly><br>
<br>

받는분 예금주명
<input name="name" value="<%=atDAO.accTransferCheck(request.getParameter("depositAcc"))%>" readonly><br>
<br>

<button>결제</button>
		

</form>
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
			<li>(주)삼조뱅크·최초롱·사업자번호 111-11-11111</li>
			<li>고객센터 <span>1599-8000</span></li>
			<li>평일 09:00 ~ 18:00 (은행휴무일 제외)</li>
		</ul>
		<div class="footerBottom">
			<p class="copyRight">Copyright © Samjo Bank Korea. All Rights
				Reserved.</p>
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

</body>
</html>