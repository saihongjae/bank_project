<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="./css/mainPage.css" rel="stylesheet" type="text/css">

<title>삼조은행</title>
</head>

<body>
	<%@ include file="navBar.jsp"%>
	<ul class="mainMenu">
		<li>상품소개
			<ul class="innerMenu">
				<li><a href="normalProduce.jsp">입출금통장</a></li>
				<li><a href="depositProduce.jsp">예금</a></li>
				<li><a href="savingProduce.jsp">적금</a></li>
				<li><a href="loanProduce.jsp">대출</a></li>
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
				<li><a href="./boardContent.jsp">1대 1 문의</a></li>
				<li>답변 확인</li>
			</ul>
		</li>
	</ul>
	<div class="mainContent1">
		<div class="txtWrapper">
			<h3>
				이미 모두의 은행 <br /> 지금은 삼조은행
			</h3>
			<p>
				한 사람, 한 사람을 위해 시작한 은행이 <br /> 더 많은 사람들이 찾는 모두의 은행이 되었습니다.
			</p>
			<p>
				보내고, 받고, 모으고, 쓰는 <br /> 당신의 모든 일이 바뀌고 있습니다.
			</p>
		</div>
		<div class="imgWrapper">
			<img src="./imgs/main1.png" class="mainImg" width="100%"
				height="100%" />
		</div>
	</div>
	<div class="productIntroduce">
		<h3>
			삼조은행의 <strong>추천 상품</strong>을 확인해 보세요.
		</h3>
		<ul class="products">
			<li><a href="./depositProduce.jsp"> <span class="productKeyword">예금</span> <span
					class="productImg"> <img src="./imgs/piggy-bank.png" />
				</span> 삼조 S드림 정기예금
				<span class="pbText">새롭게 금융거래를 시작하는
				고객님을 응원하는 예금!</span>
			</a></li>
			<li><a href="savingProduce.jsp"> <span class="productKeyword">적금</span> <span
					class="productImg"> <img src="./imgs/saving.png" />
				</span> 삼조뱅크 자유적금
				<span class="pbText">조건이나 손해없이
				누구나 자유로운 적금!</span>
			</a></li>
			<li><a href="loanProduce.jsp"> <span class="productKeyword">대출</span> <span
					class="productImg"> <img src="./imgs/signing.png" />
				</span> 삼편한 직장인대출S
				<span class="pbText">직장인이라면 누구나 받을 수 있는
				간편한 대출</span>
			</a></li>
		</ul>
	</div>
	<%@ include file="./footer.jsp"%>
</body>

</html>