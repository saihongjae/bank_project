<%@page import="bank.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
<link href="./css/commonNotice.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
	<%
	if (session.getAttribute("id") == null) { // null이 아니면 로그인한 것
		session.setAttribute("loc", request.getServletPath());
	%>
	<script>
	Swal.fire({
		  icon: 'warning',
		  title: "로그인이 필요한 페이지입니다"
		})
		setTimeout("location.href = 'main_login.jsp'",1000);
	</script>
	<%
	return;
	}

	MemberDAO memberDao = new MemberDAO();
	MemberDTO memInfo = memberDao.selectMember((String) session.getAttribute("id"));
	String memName = memInfo.getName();
	String memSsn = memInfo.getSsn();
	%>
	<%@ include file="navBar.jsp"%>
	<div class="noticeWrapper">
	<h3>삼조 S드림 정기예금</h3>
	<form name="savingCreateForm" action="createDeposit_proc.jsp">
	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼조 S드림 정기예금 특약 (1)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
		<p class="text">제1조 약관의 적용『삼조뱅크 자유적금』이하 ‘이 예금’이라 함의 거래에는 이 특약을 적용하고, 이 특약에서 정하지
			않은 사항에 대해서는 예금거래기본약관 및 적립식예금 약관을 적용합니다. 제2조 예금과목 이 예금은 정기적금으로 합니다.
			제3조 가입대상 이 예금의 가입대상은 실명의 개인 및 개인사업자입니다. 제4조 상품유형 이 예금은 정기적립식 또는 자유적립식
			입니다. 제5조 가입기간 이 예금의 가입기간은 6개월 이상 60개월 이하로 합니다. 제6조 저축방법 이 예금의 저축방법은
			상품유형에 따라 다음과 같이 적용합니다. (1)정기적립식: 가입기간 동안 매월 약정한 날짜에 일정한 월 저축금을 입금합니다.
			※ 이 약관은 금융소비자 보호에 관한 법률 등 관련 법령 및 삼조은행의 내부통제기준에 따른 절차를 거쳐 제공됩니다.
			(2)자유적립식: 가입기간 동안 은행이 정한 저축한도 범위 내에서 저축금액과 횟수를 자유롭게 입금합니다. 제7조 저축금액
			(1)정기적립식: 제한 없습니다. (2)자유적립식: 가입기간 동안 은행이 정한 월 일천만원 저축한도 범위 내에서 저축금액과
			횟수를 자유롭게 입금합니다. 단, 가입기간 3/4 경과 후에는 이전 저축잔액의 1/2을 초과하여 입금 할 수 없습니다.
			제8조 최소신규금액 이 예금 신규금액은 일천원 이상으로 합니다. 제9조 이자율 적용 이 예금의 이자율은 예금일 당시 영업점
			또는 홈페이지에 고시된 적립유형별, 가입기간별 기본 이자율을 적용하고 신규일로부터 만기일 전전달 말일까지 거래 실적에 따라
			최고 연0.4%의 우대이자율을 적용하며, 가입기간이 12개월 이상인 만기해지계좌에 한하여 제공합니다. (1) 월말일자로
			정기예금 잔액 3백만원 이상의 보유실적이 1회 이상인 경우 (연 0.2%) 우대이자율을 적용합니다. 단, 마이홈플랜청약예금은
			제외합니다. (2) 월말일자로 마이홈플랜청약부금, 마이홈플랜청약저축, 마이홈플랜주택청약종합저축, ※ 이 약관은 금융소비자
			보호에 관한 법률 등 관련 법령 및 삼조은행의 내부통제기준에 따른 절차를 거쳐 제공됩니다. 마이홈플랜청약예금 잔액 30만원
			이상의 보유실적이 1회 이상인 경우 (연0.2%) 우대이자율을 적용합니다. (3) 적금상품 만기해지 후 3개월 이내 이
			상품을 신규하는 경우 (연0.2%) 우대이자율을 적용합니다. 단, 마이홈플랜청약부금, 마이홈플랜청약저축,
			마이홈플랜주택청약종합저축 제외합니다. (4) 신규금액 30만원 이상인 경우 (연0.1%) 우대이자율을 적용합니다. (5)
			비대면채널을 통하여 신규 하는 경우 (연0.1%) 우대이자율을 적용합니다. (6) 본 상품 가입 전 당행과 협약 중인
			지자체에서 발급한 「모범(성실)납세자 증명서」 또는 「마을세무사 위촉증명서」를 영업점에 제출하는 경우 (연0.2%)
			우대이자율을 적용합니다. (대상 지자체 및 증명서 제출기간은 당행과 지자체 협약에 따라 시행하는 「모범납세자 금융우대서비스」
			내용에 따릅니다.)</p>
	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼조 S드림 정기예금 특약 (2)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
	<p class="text">제10조 이자 이 예금의 이자는 상품유형에 따라 다음과 같이 적용합니다. (1) 정기적립식:
		월저축금을 매월 약정한 날짜에 입금하였을 때에는 은행은 만기일 이후 예금주의 요청에 의해 이자를 지급하고, 약정한 날짜보다
		빨리 입금하였거나 늦게 입금하였을 때에는 적립식예금 약관에서 정한 대로 이자를 지급합니다. (2) 자유적립식: 매 입금 건별로
		입금일로부터 만기일 전날까지의 기간에 대하여 이자를 계산하여 만기일 이후 예금주의 요청에 의해 지급합니다. ※ 이 약관은
		금융소비자 보호에 관한 법률 등 관련 법령 및 삼조은행의 내부통제기준에 따른 절차를 거쳐 제공됩니다. 제11조 중도해지이자율
		예금주가 만기일 전에 지급 청구 한 때와 정기적립식의 경우 만기일까지 약정한 모든 회차의 월 저축금을 입금하지 않고 만기일
		이후에 청구하였을 때에는 입금일로부터 지급일 전날까지의 기간에 대하여 가입일에 영업점 및 인터넷 홈페이지에 고시된
		중도해지이자율에 의해 지급합니다. 제12조 만기후이자율 예금주가 만기일 후에 찾고자 하는 경우에는 만기일부터 예금을 찾는 날
		전날까지의 기간에 대해 예금일 당시 영업점 또는 홈페이지에 고시된 (일반)정기적금의 만기후이자율로 계산한 이자를 더하여
		지급하며, (일반)정기적금의 만기지급이자율이 변경된 경우 만기후이자율은 변경된 (일반)정기적금의 만기지급이자율을 기준으로
		변경일로부터 기간구분하여 계산합니다. 제13조 특별중도해지 본인결혼, 본인 (배우자) 출산, 본인 전세 계약한 경우, 본인
		주택구입할 경우, 본인상해 또는 본인 질병으로 입원한 경우 긴급자금 마련을 위해 중도해지 하는 경우에는 신규할 때 적용한
		기본이자율을 적용합니다. 사유발생일 이전에 가입한 계좌로 사유 발생일로부터3개월 이내에 해지하는 계좌에 한하며 은행이 인정하는
		해당 증명서류를 제출하는 경우에 한합니다. (1) 본인결혼 : 예식장 계약서 또는 청첩장 ※ 이 약관은 금융소비자 보호에 관한
		법률 등 관련 법령 및 삼조은행의 내부통제기준에 따른 절차를 거쳐 제공됩니다. (2) 본인 및 배우자 출산 : 가족관계등록부
		(본인 출산한 경우-출산증명서 가능) (3) 본인 전세계약한 경우 : 전세계약서 (4) 본인 주택구입할 경우 : 매매계약서
		(5) 본인 상해 또는 질병으로 입원한 경우 : 입퇴원 확인서 제14조 계좌분할 이 예금의 정기적립식은 계좌분할이 가능하나
		자유적립식은 불가능합니다. 제15조 양도 및 담보제공 이 예금은 은행의 승낙을 받은 경우에 한하여 양도 및 담보제공이
		가능합니다.</p>
		<label>이름 <input type="text" id="name" name="name"
			class="form-control" placeholder="이름" readOnly value="<%=memName%>">
		</label> <br> 
		<div class="ssnInput">
		<label style="display: block;">주민번호</label>
		 <input type="text" class="form-control"
			required name="ssn1" id="inputSsn1" placeholder="주민번호 앞자리"
			autoComplete="false" readOnly value="<%=memSsn.substring(0, 6)%>"><input type="password" class="form-control" required name="ssn2"
			id="inputSsn2" placeholder="주민번호 뒷자리" autoComplete="false" readOnly
			value="<%=memSsn.substring(6, 13)%>">
		</div>
		<div class="pwInput">
		<label> 신규 비밀번호 <input type="password" id="pw1"
			name="pw1" placeholder="신규계좌 비밀번호" required class="form-control" maxLength="4">
		</label><label> 신규 비밀번호 확인 <input type="password" id="pw2"
			name="pw2" placeholder="신규계좌 비밀번호 확인" required class="form-control" maxLength="4">
		</label>
		</div>
		<p class="warningText1 text-danger" style="display: none;">비밀번호가
			서로 일치하지 않습니다.</p>
		<br />기간 선택 <select class="form-select" name="term"
			aria-label="saving term selector">
			<option value="12">12개월</option>
			<option value="18">18개월</option>
			<option value="24">24개월</option>
			<option value="36">36개월</option>
		</select> <br /> <label style="width: 100%; margin-bottom: 10px;"> 금액 입력 <input type="number" min="1000000"
			name="monthly" max="100000000" class="form-control" required />
		</label>
		<p class="warningText2 text-danger" style="display: none;">최소 100만원 이상 예금이 가능합니다.</p>
		<div class="moneyBtns">
			<button type="button" data-money="1000" class="btn btn-secondary">+1천원</button>
			<button type="button" data-money="10000" class="btn btn-secondary">+1만원</button>
			<button type="button" data-money="50000" class="btn btn-secondary">+5만원</button>
			<button type="button" data-money="100000" class="btn btn-secondary">+10만원</button>
			<button type="button" data-money="1000000" class="btn btn-secondary">+100만원</button>
		</div>
		<button type="button" class="btn btn-outline-success calculBtn" disabled>만기
			예상액 계산하기</button>
		<div class="resultWrapper" style="display: none;">
		<div class="aboveBtns" style="display: flex;">
			<div class="leftWing">
				<p class="text1">연 <span>2.90</span> %</p>
				<p class="text1">
					<span class="totalTerm">12</span>개월 만기
				</p>
			</div>
			<div class="rightWing">
			<label>만기 예상원금<input type="text" value="만기예상원금" name="principal" readOnly /></label> 
			<label>만기 예상이자<input type="text" value="(세전)만기예상이자" name="interest" readOnly /></label>
			</div>
		</div>
		<div class="submitBtns">
			<button type="submit" class="ok btn btn-success">개설 신청</button>
			<button type="button" class="btn btn-danger cancelBtn">취소</button>
		</div>
		</div>
	</form>
	</div>
	<%@ include file="./footer.jsp"%>
	<script type="text/javascript" src="./javascript/depositNotice.js"></script>
		<%@ include file="./footer.jsp"%>
	
</body>

</html>