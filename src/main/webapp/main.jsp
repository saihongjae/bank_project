<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/commonStyle.css" rel="stylesheet" type="text/css">
<link href="./css/mainPage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<ul class="mainMenu">
		<li>상품소개
			<ul class="innerMenu">
				<li><a href="account_opening.jsp">비대면 계좌 개설</a></li>
				<li><a href="accountProduceList.jsp">예적금</a></li>
				<li>대출</li>
			</ul>
		</li>
		<li>조회
			<ul class="innerMenu">
				<li>거래내역조회</li>
				<li>계좌조회</li>
			</ul>
		</li>
		<li>사회공헌
			<ul class="innerMenu">
				<li>후원하기</li>
				<li>후원내역</li>
			</ul>
		</li>
		<li>고객센터
			<ul class="innerMenu">
				<li>자주하는 질문</li>
				<li>1대 1 문의</li>
				<li>답변 확인</li>
			</ul>
		</li>
	</ul>
	<div class="mainContent1">
	<div class="txtWrapper">
		<h3>이미 모두의 은행 <br /> 지금은 삼조은행</h3>
		<p> 한 사람, 한 사람을 위해 시작한 은행이 <br /> 더 많은 사람들이 찾는 모두의 은행이 되었습니다. </p>
		<p>	보내고, 받고, 모으고, 쓰는 <br /> 당신의 모든 일이 바뀌고 있습니다. </p>
	</div>
		<img src="./imgs/main1.png" width="400px" height="400px"/>
		
	</div>
</body>
</html>