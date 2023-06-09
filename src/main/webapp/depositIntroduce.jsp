<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/depositPage.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<div class="productWrapper">
	<h1>삼조 S드림 정기예금</h1>
	<p>기쁜 날마다, 고금리의 즐거움을 드립니다. 높은 금리의 즐거움까지 누릴 수 있는 정기예금입니다.</p>
	<div class="underTxts">
		<dl class="threeRows">
			<dd>자유롭게 자금 관리가 가능한 삼조원큐 전용 정기예금</dd>
			<dt>특징</dt>
		</dl>
		<dl class="twoRows">
			<dd>최대 <br /> 36개월</dd>
			<dt>기간</dt>
		</dl>
		<dl>
			<dd>1억원</dd>
			<dt>최고가입한도</dt>
		</dl>
		<dl>
			<dd>연 2.90 <span>%</span></dd>
			<dt>최대금리</dt>
		</dl>
	</div>
	<div class="productInfo">
	<dl>
		<dt>상품특징</dt>
		<dd>
		<ul>
			<li>높은 금리로 갈아탈 수 있는 옵션 보너스 제공</li>
			<li>입출금과 거치식 예금의 장점만을 모은 편리하고 유용한 상품</li>
			<li>내집마련, 결혼, 출산 등 기쁜 날 해지 시 해당 기간별 고시 이율 적용 </li>
		</ul>
		</dd>
		<dt>가입대상</dt>
		<dd>실명의 개인 또는 개인사업자</dd>
		<dt>예금종류</dt>
		<dd>정기예금</dd>
		<dt>가입기간</dt>
		<dd>1년제</dd>
		<dt>최저가입금액</dt>
		<dd>1백만원 이상 단, 인터넷뱅킹 및 스마트폰뱅킹은 최저 1만원 이상 (원단위)</dd>
		<dt>이자지급방법</dt>
		<dd>만기일시지급식 : 만기(후)해지시 이자를 지급</dd>
		<dt>금리</dt>
		<dd>
			<div>
				<table class="table">
					<thead>
						<tr class="table-success">
							<th>계약기간</th>
							<th>기본금리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>12개월 이상 24개월 미만</td>
							<td><span>연 2.90%</span></td>
						</tr>
						<tr>
							<td>24개월 이상 36개월 미만</td>
							<td><span>연 2.90%</span></td>
						</tr>
						<tr>
							<td>36개월</td>
							<td><span>연 2.90%</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</dd>
	</dl>
	</div>
	<div>
		<a href="./depositNotice.jsp" class="btn btn-success">개설 신청</a>
		<a href="./main.jsp" class="btn btn-outline-danger">뒤로가기</a>
	</div>
	</div>
		<%@ include file="./footer.jsp"%>
</body>
</html>