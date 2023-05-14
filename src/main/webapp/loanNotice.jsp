<%@page import="bank.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.MemberDAO"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="./css/commonNotice.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("id") == null) { // null이 아니면 로그인한 것
		session.setAttribute("loc", request.getServletPath());
	%>
	<script>
		alert("로그인이 필요한 페이지입니다");
		location.href = "main_login.jsp";
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
	<h3>삼편한 직장인대출S</h3>
	<form name="savingCreateForm" action="createLoan_proc.jsp">
	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼편한 직장인대출S 특약 (1)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
			<p class="text">① 제 1 조의 대출금리는 대출기간 시작일 현재 기준금리 및 가산금리에 의해 결정되며, 변동금리에 의한
				대출금리는 매 금리변동주기가 도래하는 날에 변 경하여 적용합니다. ② 「고정금리」 대출은 은행에서 고시하는 금리를 적용하여
				은행여신거래기본약관 제 3 조 제 3 항에 따른 부득이한 경우를 제외하고는 대출기간 종료일까 지 동일한 금리를 적용합니다.
				③ 「변동금리」 대출은 기준금리의 변동에 따라 대출금리가 변경되는 여신을 말하며, 기준금리는 다음 각 호와 같이
				적용합니다. 1. 신규취급액기준 COFIX 는 대출기간 시작일과 매 금리변동주기(6 개월)가 도래하는 날에 2 영업일 전의
				전국은행연합회 최종 고시 신규취급액기준 COFIX 를 적용합니다. 2. 신 잔액기준 COFIX 는 대출기간 시작일과 매
				금리변동주기(6 개월)가 도래하는 날에 2 영업일 전의 전국은행연합회 최종 고시 신 잔액기준 COFIX 를 적용합니다.
				3. 금융채유통수익률(3 개월물, 6 개월물, 1 년물, 5 년물)은 대출기간 시작일과 매 금리변동주기(3 개월, 6
				개월, 1 년, 5 년)가 도래하는 날에 2 영 업일 전의 한국금융투자협회에 최종 고시된 나이스피앤아이, 한국자산평가,
				KIS 자산평가, 에프앤자산평가의 금융채(AAA)유통수익률 평균값을 적용 합니다. 4. 국고채유통수익률(5 년물)은
				대출기간 시작일과 매 금리변동주기(5 년)가 도래하는 날에 2 영업일 전의 한국금융투자협회에 최종 고시된 나이스피앤 아이,
				한국자산평가, KIS 자산평가, 에프앤자산평가의 국고채권유통수익률 평균값을 적용합니다. ④ 수신금리 연동 기준금리는
				예·적금담보대출에 적용하며, 담보 예·적금의 수신금리에 연동하여 대출금리를 적용합니다. ⑤ 가산금리는 기준금리에 더하여
				적용하는 금리로 본인의 신용, 담보조건, 대출기간 및 은행거래상황에 따라 결정되며, 대출기간 시작일부터 대출기간 종
				료일까지 변경되지 않습니다. 단, 대출기간 중 조건변경을 하거나 대출기간 종료일이 도래하여 기한연장을 하고자 하는 경우에는
				해당 시점의 변경된 조건 에 따라 가산금리가 변경될 수 있습니다. 제 3 조 지연배상금 (연체이자) ①
				이자·분할상환금·분할상환 원금과 이자를 약정한 지급 기일(이하 “약정 납입일”)에 지급하지 않으면 지급하여야 할 금액에
				대하여, 약정 납입일의 다음 날부터 지연배상금(연체이자)를 지급하기로 합니다. ② 대출기간 종료일에 채무를 이행하지
				아니하거나, 은행여신거래기본약관 제 7 조에 의하여 기한의 이익(약정한 기간 동안 대출금을 상환하지 않고 사용 할 수 있는
				채무자의 이익)을 상실한 경우에는, 기한의 이익 상실일의 다음 날부터 남아있는 대출원금에 대하여, 지연배상금을 지급하기로
				합니다. ③ 지연배상금(연체이자)의 일부를 상환하더라도 연체금리를 적용하는 시작일자(연체발생일)은 약정 납입일의 다음 날로
				하며, 약정 납입일이 변경된 경우 에는 변경된 약정 납입일의 다음 날로 합니다. ④ 연체중인 분할상환금(원금과 이자)의
				일부를 상환하더라도 연체금리를 적용하는 시작일자(연체발생일)은 약정 납입일의 다음 날로 하며, 해당 분할상환 금을 전액
				상환할 때까지 변경되지 않습니다. ⑤ 마이너스 통장 방식의 한도거래인 경우, 약정한 대출한도금액을 초과하여 이자가 발생한
				경우, 이를 곧 갚기로 하며, 한도를 초과한 금액(이하 “미수이 자”)에 대하여 지연배상금(연체이자)를 지급하기로 합니다.
				미수이자가 발생한 때로부터 계속하여 1 개월 간 갚지 않은 경우에는 은행여신거래기본약관 제 7 조에 따라 기한의 이익을
				상실하기로 하며, 기한의 이익 상실일의 다음 날부터 남아있는 대출원금에 대하여 연체금리를 적용한 지연배상금(연체이자)를
				지급하기로 합니다. ⑥ 본인 명의의 예·적금을 담보로 한 예·적금담보대출에 대하여는 연체이자를 부과하지 않기로 하되, 약정
				납입일에 이자를 상환하지 않고, 1 개월 간 갚지 않으면 은행여신거래기본약관 제 7 조에 따라 기한의 이익이 상실되며,
				이에 곧 대출금을 갚기로 합니다. 대출금을 갚지 않는 경우에는 은행이 은행여신거 래기본약관 제 10 조에 의해 대출금과
				담보 예·적금을 상계하기로 합니다. 제 4 조 마이너스 통장 방식 한도거래에 대한 약정 ① 이 약정에 의한 채무가 있는
				때에는 연계된 입출금 계좌(이하 “모계좌”)에 입금된 자금(다른 금융기관 발행 자기앞수표 등 증권류의 금액은 결제될 때까
				지 이 자금에서 제외하며, 입금된 증권 등은 이 약정에 의한 채무의 담보로서 은행에 양도한 것으로 합니다)은 자동적으로
				대출금 변제(상환)에 충당하기로 하며, 지연배상금, 미수이자, 대출원금의 순서로 갚도록 합니다. ② 모계좌에 대해 그 예금
				잔액을 초과해서 지급을 요구(입출금 계좌에 연결하여 사용하는 체크카드의 대금청구 포함)하거나, 정기적 지급금 및 각종 요금
				등의 자동납부 요구가 있는 때에는 모계좌에 연결된 대출금을 지급하는 것으로 합니다. ③ 매월 결산일에 전월 결산일 익일부터
				당월 결산일까지 매일의 대출사용금액에 대출금리를 곱하여 대출이자를 산정하고, 결산일에 모계좌에서 지급하거 나 대출한도금액
				범위 내에서 대출금에 더하기로 합니다. ④ 대출이자 계산을 위한 매일의 대출사용금액은 다음과 같이 산정합니다. •
				대출사용금액 = 해당일 마감시점 대출잔액 + (해당일 하루 중 최고 대출잔액 – 전일자 마감시점 대출잔액 또는 해당일
				마감시점 대출잔액 중 큰 금액) • 「대출잔액」은 모계좌에 마이너스 값으로 표시된 금액을 의미하며, 최고 대출잔액이란
				절대값을 기준으로 최고값을 의미합니다. • 「마감」은 매일의 대출사용금액을 산정하기 위한 기준 시간(24:00)을
				의미합니다. ⑤ 대출한도금액 사용 제한 1. 은행은 채무자가 신용정보관리규약상 신용거래정보 중 연체정보, 대위변제(채무자를
				대신하여 이해관계인이나 제 3 자가 채무를 갚아주는 행위) · 대 지급(채무자가 기일 내에 돈을 갚지 못한 경우 지급보증을
				한 은행(또는 정부)에서 대신 지급하여 주는 것)정보, 부도정보, 관련인정보, 금융질서문란정 보, 공공기록정보로 등록된
				경우에는 대출한도금액에도 불구하고 대출금 사용을 제한할 수 있습니다. 단, 은행이 정한 자동이체 지급인 경우는 예외로 할
				수 있습니다. 2. 은행은 사용을 제한하는 경우에는 그 사실을 즉시 본인에게 통지하기로 합니다. 3. 제 1 호에서 정한
				사유가 해소되어 정상적인 여신거래가 가능한 경우 은행은 사용 제한을 해제하기로 합니다. 제 5 조 중도상환해약금 ① 본인이
				은행에서 받은 대출금을 약정기일(기한연장된 경우 연장된 기일 포함, 이하 같음) 전에 상환할 때에는 제 1 조에서 정한
				바에 따라 은행에 중도상 환해약금을 지급하기로 합니다. ② 제 1 조의 중도상환대출금액 등의 계산은 다음 각 호와
				같습니다. 1. 「대출기간」은 최초 대출기간 시작일부터 약정기일까지의 일수로 계산하되, 3 년을 초과하는 경우에는 3 년을
				적용합니다. 2. 「중도상환대출금액」은 약정기일 이전에 상환하는 대출금액으로 하며 분할상환대출인 경우 약정한 분할상환 기일
				전에 상환하는 대출금액을 포함합 니다. 3. 「대출잔여일수」는 중도상환하는 날의 다음 날부터 당초 약정기일까지의 일수를
				말하며, 분할상환대출금의 경우에는 각 분할상환금별로 계산하되 분 할상환기일이 먼저 도래하는 순서대로 중도상환하는 것으로
				합니다. ③ 다음의 각호의 경우에는 중도상환해약금을 면제하기로 합니다. 1. 대출금의 잔여일수가 3 개월 미만인 경우 2.
				은행여신거래기본약관 제 7 조에서 정한 기한의 이익 상실 및 제 10 조에서 정한 상계 등의 사유로 은행이 대출금을 기일
				전에 회수하는 경우 3. 채무자의 사망 또는 천재지변에 의한 경우 4. 기타 은행이 정하는 경우 제 6 조 인지세의 부담
				① 이 약정서 작성에 따른 인지세는 각 50%씩 본인과 은행이 부담합니다. ② 제 1 항에 의하여 본인이 부담하기로 한
				인지세를 은행이 대신 지급한 경우에는 은행여신거래기본약관 제 4 조에 준하여 곧 갚기로 합니다.</p>
	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼편한 직장인대출S 특약 (2)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
			<p class="text">제 7 조 담보권 설정 ① 이 약정에 의한 채무를 담보하기 위하여 제 1 조에 표시된 (근)질권의 목적인 예금
				등에 질권을 설정하기로 합니다. ② 제 1 항의 질권의 효력은 원금ㆍ수익권(이 계약 이후에 적립되는 금액을 포함합니다)과
				이에 부수하는 이자ㆍ수익의 수익권, 특별장려금, 법정장려금 등 에 미칩니다. ③ 예금 등이
				기간연장ㆍ개서ㆍ갱신ㆍ분할ㆍ병합ㆍ증액ㆍ감액 또는 이자 원가된 경우에도 그 위에 질권의 효력이 미침을 승인하며, 그 목적인
				신탁이 기 간연장되거나 연체로 말미암아 자동연장처리된 경우에 있어서도 그에 대한 수익권 위에 효력이 미침을 승인합니다. ④
				은행은 제 1 항에 의한 질권을 행사하지 아니하고, 은행여신거래기본약관이 정하는 바에 따라 은행의 채권과 제 1 조에
				표시된 (근)질권의 목적인 예금 등을 상계할 수 있습니다. 제 8 조 담보ㆍ보험 본인은 은행의 다른 의사표시가 없는 한,
				이 약정에 의해 실행된 대출로 매입 또는 건축한 해당 부동산을 은행에 담보로 제공하기로 하며, 은행이 요청하는 경우 은행이
				동의하는 종류와 금액의 보험에 가입하고 그 보험금 청구권에 은행을 위하여 질권을 설정하기로 합니다. 제 9 조 대출채권의
				양도ㆍ신탁 승낙 및 피담보채권의 확정 특약 사항 ① 본인은 은행이 국내 또는 해외에서 채권 유동화를 위해 이 약정에 따른
				대출채권 및 근저당권의 전부 및 일부를 은행의 승계인 또는 수탁인 등 제 3 자에 게 양도(신탁 포함)가 가능함을
				이해합니다. 또한, 본인에 대한 서면통지를 통해 채권 양수인이 본인에 대하여 대출채권 및 근저당권을 행사할 수 있기로 하
				되, 대출채권 및 근저당권의 양도통지를 실제로 받을 시점까지 은행에 대하여 가지는 항변사유로 채권 양수인에게 대항할 수
				있기로 합니다. ② 본인은 제 1 항의 양도와 관련하여 이에 대항하지 않는 경우 근저당권의 피담보채권은 은행이 약정에 의한
				대출채권을 양도하는 시점에서 확정됨에 동 의하며, 본인은 피담보채권(담보물에 의하여 담보되는 대출채권)의 확정에 따라 이
				약정에 의한 대출채권을 담보하기 위하여 설정된 근저당권을 더 이상 추가대출 등에 활용할 수 없음을 이해하며, 이에 이의를
				제기하지 않을 것임을 확인합니다. ③ 본인은 제 1 항의 양도와 관련하여 매매, 상속, 증여 등에 의하여 담보 부동산의
				소유권을 제 3 자에게 이전하는 경우 제 3 자 앞 채무인수가 불가능하다 는 점을 이해하며 이에 이의를 제기하지 않을
				것임을 확인합니다. ④ 본인은 제 1 항의 양도와 관련하여 대출조건 변경이 제한된다는 점과 대출채권 등의 양도일까지 후순위
				대출이 제한된다는 점을 이해하며 이에 이의를 제기하지 않을 것임을 확인합니다. ⑤ 제 1 항 및 제 2 항에 대하여 은행이
				채권양도통지 또는 근저당권의 피담보채권 확정통지를 서면으로 하여 이 약정에 따른 대출채권 양도사실을 안 경우 에는 본인은
				양도사실을 안 날로부터 10 일 이내에 이 약정에 의한 대출을 해지할 수 있습니다. 제 10 조 자동연장 및 자동상환 ①
				대출기간 종료일 도래 전, 기한연장에 대한 내부 심사를 통해 승인 결과가 안내되며, 기한연장 조건에 동의하여 약정을 체결한
				경우에는 대출기간 종료 일에 대출기간이 자동으로 연장됩니다. 단, 대출기간 종료일 기준, 금융기관 연체 등 대출 취급 거절
				사유가 발생하거나 상환조건 등 기준을 충족하지 못한 경우에는 대출기간이 연장되지 않습니다. ② 대출기간 종료일까지 기한연장
				약정을 체결하지 않은 경우에는 대출기간 종료일에 은행여신거래기본약관 제 10 조에 의해 상계하기로 합니다. 단, 자동 이체
				계좌의 지급가능금액이 대출금 상환금액 총액보다 적은 경우에는 자동 상환 대상에서 제외되며, 본인은 이를 곧 상환하기로
				합니다. 제 11 조 대출실행 중단 은행은 대출 계약 체결 후 대출 실행 전에 차주에게 대출 증가, 연체 발생, 신용등급
				또는 개인신용평점 하락 등 차주의 신용위험, 상환능력이 악화되거나 차주가 제공한 정보의 내용이 달라져 대출 실행에 중대한
				영향을 미치는 경우 대출을 실행하지 않을 수 있습니다. 제 12 조 금리 우대 조건 ① 제 1 조의 ‘대출금리의 연이율’은
				아래와 같이 본인이 선택한 금리 우대 항목의 우대 이율만큼 인하된 이율이며, 우대 항목별 적용기준은 아래 기재된 각 항목의
				우대 조건 및 제 2 항에서 정한 바에 따릅니다. 금리 우대 항목 우대 조건 우대 이율 □ ( ) ( ) 연 ( )% □
				( ) ( ) 연 ( )% □ ( ) ( ) 연 ( )% ② 제 1 항의 금리 우대 조건에 관하여 다음 각 호의 기준을
				적용합니다. 1. 제 1 항의 우대 조건상 별도로 적용기간을 정하지 않은 경우, 우대 이율은 제 1 조에서 정한 대출기간
				시작일부터 대출기간 종료일까지 적용됩니다. 2. 본인이 대출 계약 체결 시 제 1 항에 따른 금리 우대 항목을 선택하지
				않을 경우, 자동으로 우대 금리가 적용되지는 않습니다. 3. 대출 계약을 철회하거나 약정 기일 전 해지한 경우, 대출
				재신청 시에는 제 1 항의 금리 우대 항목이 부활하여 적용되지 않습니다.</p>
		<label>이름 <input type="text" id="name" name="name"
			class="form-control" placeholder="이름" readOnly value="<%=memName%>">
		</label> 
		<div class="ssnInput">
		<label style="display: block;">주민번호</label>
		 <input type="text" class="form-control"
			required name="ssn1" id="inputSsn1" placeholder="주민번호 앞자리"
			autoComplete="false" readOnly value="<%=memSsn.substring(0, 6)%>"><input type="password" class="form-control" required name="ssn2"
			id="inputSsn2" placeholder="주민번호 뒷자리" autoComplete="false" readOnly
			value="<%=memSsn.substring(6, 13)%>">
		</div>
		<br />
		<label> 상환방법 <input type="text" id="way" name="way"
			class="form-control" placeholder="이름" readOnly value="원리금균등상환">
		</label> 
		<br />
		<button type="button" class="checkLimitBtn btn btn-outline-danger">한도조회</button>
		<div class="limitWrapper" style="display: none;">
		<input type="hidden" id="pw1"
			name="pw1" placeholder="신규계좌 비밀번호" required maxLength="4" value="0000">
	 	<input type="hidden" id="pw2"
			name="pw2" placeholder="신규계좌 비밀번호 확인" required maxlength="4" value="0000">
			<p class="p-3 text-info-emphasis bg-info-subtle border border-info-subtle rounded-3" style="margin-top: 20px;">
 			<%=memName %>님의 한도는 <span style="font-size: 22px; font-weight: bolder;">1 억원</span> 입니다.
			</p>
		<label style="width: 100%; margin-bottom: 10px;"> 대출 금액 입력 <input type="number" min="1000000"
			name="monthly" max="100000000" class="form-control" required /> </label>
		<div class="moneyBtns">
			<button type="button" data-money="100000" class="btn btn-secondary">+10만원</button>
			<button type="button" data-money="1000000" class="btn btn-secondary">+100만원</button>
			<button type="button" data-money="5000000" class="btn btn-secondary">+500만원</button>
			<button type="button" data-money="10000000" class="btn btn-secondary">+1000만원</button>
		</div>
		<p class="warningText2 text-danger" style="display: none;">최대
			1억원까지 대출이 가능합니다.</p>
		<label style="width: 100%;">
			기간 선택 
			<select class="form-select" name="term"
				aria-label="saving term selector">
				<option value="12">12개월</option>
				<option value="24">24개월</option>
				<option value="36">36개월</option>
				<option value="48">48개월</option>
				<option value="60">60개월</option>
			</select> 
		</label>
		<label style="width: 100%;">
			정기 출금일 <select class="form-select" name="regular" aria-label="saving term selector">
				<option value="1">1일</option>
				<option value="8">8일</option>
				<option value="15">15일</option>
				<option value="22">22일</option>
			</select>
		</label>
		<button type="button" class="calculBtn btn btn-outline-success">대출 납입 계산하기</button>
		</div>
		<div class="resultWrapper" style="display: none;">
		<div class="aboveBtns" style="display: flex;">
			<div class="leftWing" style="display: block;">
				<p class="text1">연 <span>3.59</span> %</p>
				<p class="text1">
					<span class="totalTerm">12</span>개월 만기
				</p>
			</div>
			<div class="rightWing">
			<label>총 납입 금액<input type="text" class="totalPrincipal" value="만기예상원금" name="principal" readOnly /></label> 
			<label>총 이자<input type="text" class="totalInterest" value="(세전)만기예상이자" name="interest" readOnly /></label>
			<input type="hidden" name="monthly2" value= "2548880" />
			</div>
		
		</div>
		<table class="table">
			<thead>
			<tr>
				<th scope="col">총 회차</th>
				<th scope="col">1회 납입금액</th>
				<th scope="col">원금</th>
				<th scope="col">이자</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="totalLength">12</td>
				<td class="totalLoanMoney">(30000000 / 12) + (30000000 * 0.0359 / 12)</td>
				<td class="totalPrincipal2">(30000000 / 12)</td>
				<td class="totalInterest2">(30000000 * 0.0359 / 12)</td>
			</tr>
			</tbody>
		</table>	
		<div class="submitBtns">
			<button type="submit" class="ok btn btn-success">대출 신청</button>
			<button type="button" class="btn btn-danger cancelBtn">취소</button>
			</div>
		</div>
	</form>
	</div>
	<script type="text/javascript" src="./javascript/loanNotice.js"></script>
</body>

</html>