<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dto.MemberDTO"%>
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
			session.setAttribute("loc", request.getServletPath()); %>
		<script>
			alert("로그인이 필요한 페이지입니다");
			location.href="main_login.jsp";
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
	<h3>삼조뱅크 입출금통장</h3>
	<form name="savingCreateForm" action="createNormal_proc.jsp">
	
	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼조뱅크 입출금통장 특약 (1)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
		<p class="text">		제 1장 공통 제1조(약관의 목적) 이 약관은 고객이 미래에셋증권주식회사(이하 "회사"라 한다)와 다음 각 호에 필요한
			사항을 정함을 목적으로 한다. 1. 고객이 회사와 거래하기 위해 모든 거래의 기본이 되는 계좌를 개설함에 있어 고객과
			회사간의 권리, 의무관계 등 필요한 사항 2. 고객이 실명확인업무대행계약을 체결한 금융기관(이하 "제휴은행" 이라 한다)을
			통해 실명확인을 거쳐 회사의 증권계좌를 개설하여 회사가 제공하는 서비스를 이용함에 있어 회사와 고객간의 서비스 이용에 관한
			제반사항 등 필요한 사항 3. 자본시장과 금융투자에 관한 법률 제4조에서 정한 채무증권, 수익증권, 투자계약증권,
			파생결합증권 및 환매조건부 채권매매 등
			&#60;별첨&#62;에서 정한 증권 등의 거래만으로 한정하는 금융상품 계좌의 개설에 필요한 사항 제2조(용어의 정의) ①
			종합계좌 : 제도적으로 각각 운영해야하는 상품을(선물옵션 거래 계좌 및 한도 상품 등) 제외한 당사의 매매가능한 개별상품을
			종합적으로 관리 할 수 있는 계좌를 말한다. ② "개별상품"이라 함은 종합계좌 내에서 매매거래를 할 수 있는 각각의 상품을
			말한다. ③ 제휴은행 : 회사가 증권계좌의 개설대행 등을 위하여 업무제휴 계약을 맺은 금융기관 또는 입출금 업무등과 관련하여
			회사와 업무계약을 체결한 은행을 말한다. ④ 연계계좌 : 회사에 개설된 고객계좌와 연결된 제휴은행의 가상계좌를 말한다. ⑤
			이체출금기관 : 고객이 어떠한 물품을 구매하거나 용역을 이용하고 그 대금(이하 "구매대금"이라 한다)을 납부하기 위하여 그
			물품이나 용역을 제공한 자(이하 "판매자"라 한다) 또는 판매자가 지정한 금융기관에 신청하여 구매대금을 고객계좌에서 출금하여
			충당하는 기관을 말한다. ⑥ 자동화기기 : 회사, 은행 및 부가가치통신망 사업자의 관리 하에 설치되고 운영되는
			ATM(Automated-Teller Machine) 및 CD(Cash Dispenser)를 말한다. 제3조(계좌의 이용)
			① 고객은 회사가 제공하는 상품의 거래를 개시하고자 할 경우 회사가 정한 절차에 따라 계좌를 개설하여야 한다. ② 개별상품의
			거래는 다음 각호와 같다. 1. 개별상품의 거래는 매수/매도 가능금액 또는 출금 가능금액의 범위 내에서 가능하다. 2.
			고객은 영업시간 중 언제든지 개별상품의 관련약관을 열람하거나 교부를 청구할 수 있다. ③ 고객이 랩어카운트 서비스 또는
			CMA서비스를 이용하고자 하는 경우에는 종합계좌를 사용하여야 한다. 제4조(계좌개설의 신청방법 등) ① 고객이 계좌개설을
			신청할 때에는 계좌개설신청서에 필요한 사항을 기재한 다음 인감을 날인하거나 서명을 하여(이하 인감과 서명을 합하여 "거래인감
			등"이라 한다) 회사에 제출하여야 한다. ② 다음 각 호의 경우에 고객은 계좌의 추가개설 없이도 회사와 이미 거래하고 있는
			계좌(이하 "기존계좌"라 한다)로 거래가 가능하다. 1. 기존계좌에 허용된 거래종류 중에서 추가 거래를 하거나 거래종류의
			일부를 해지할 때 2. 제도변경 또는 전산시스템 개선등에 의하여 신규 거래종류가 기존계좌에 허용되는 경우 ③ 다음 각 호의
			경우 고객은 계좌개설신청서를 제출하여 계좌를 개설하여야 한다. 1. 회사와 처음 거래를 개시하고자 할 때 2. 회사에
			기존계좌가 있는 경우로서 다음 각목에 해당되는 경우 가. 기존계좌에 허용된 거래종류와 다른 종류의 거래를 신청할 때 나.
			기존계좌에 허용된 거래종류이나 별도의 계좌에서 거래하고자 하는 경우 제5조(거래인감 등의 등록) 고객이 계좌를 개설할 때에는
			거래인감 등을 등록하여야 한다. 단, 은행을 통한 계좌개설, 일괄 계좌개설, 비대면 실명확인에 의한 계좌개설 등의 경우는
			그러하지 아니하다. 제6조(비밀번호의 등록) ① 비밀번호는 4~8자리 숫자(영문자 포함)로 등록이 가능하며, 다음 각 호에
			해당하는 숫자(영문자 포함)는 비밀번호로 등록할 수 없다. 1. 동일한 숫자 2. 실명확인번호 3. 연속하는 숫자의 조합
			4. 계좌번호 5. 고객연락처 ② 고객은 계좌별로 비밀번호를 등록한다. ③ 자동화기기(ATM/CD)를 이용하고자 하는 고객은
			비밀번호 앞4자리 는 숫자로 등록해야 한다. ④ 모바일, ARS를 이용하고자 하는 고객은 비밀번호를 숫자로만 등록 해야
			한다. 제7조(통보신청) ① 고객은 월간 거래내역 및 잔액 · 잔량현황의 통보여부와 통보방법을 계좌개설시 회사에 등록하여야
			하며, 이의 변경을 원할 경우 영업점에 별도로 신청 하여야 한다. ② 통보방법은 계좌별로 적용된다. ③ 고객은 통보를 원하지
			않을 경우 우편통보사절원을 작성하여 회사에 제출하여야 하고, 우편통보사절기간을 연장하고자 하는 경우 2년 마다
			우편통보사절원을 재작성 하여 회사에 제출하여야 한다. 제8조(월간거래내용 등의 통지) ① 월간 거래내역 및 잔액 ·
			잔량현황의 우편통보 여부는 계좌별로 다르게 적용할 수 있다. ② 회사는 월간 금융투자상품의 거래가 있는 계좌에 대하여 월간
			매매내역·손익내역, 월말잔액 · 잔량현황, 월말 현재 파생상품의 미결제약정현황 · 예탁재산잔고 · 위탁증거금 필요액 현황
			등(이하 “월간 매매내역등”이라 한다)을 다음달 20일까지, 반기동안 금융투자상품의 거래가 없는 계좌에 대하여는 반기말 잔액
			· 잔량현황을 그 반기 종료 후 20일까지 회사와 고객 간에 미리 합의된 방법(계좌부 등에 의하여 관리 · 기록되지 아니하는
			매매거래에 대하여는 1호만 해당한다)으로 통지한다. 다만, 고객이 통지를 받기를 원하지 아니하는 경우에는 영업점에 비치하거나
			인터넷 홈페이지에 접속하여 수시로 조회가 가능하게 함으로써 통지를 갈음할 수 있다. 회사는 고객이 거래를 개시하기 전에
			고객이 원하는 매매성립내용의 통지방법을 확인하여 이를 기록 · 유지하여야 한다. 1. 서면교부 2. 전화, 전신 또는 팩스
			3. 전자우편, 그 밖에 이와 비슷한 전자통신 4. 그 밖에 금융위원회가 정하여 고시하는 방법 ③ 다음 각 호의 1에
			해당하는 경우에는 월간 매매내역등 또는 반기말 잔액·잔량현황을 통지한 것으로 본다. 1. 통지한 월간 매매내역등 또는 반기말
			잔액 · 잔량현황이 3회 이상 반송된 고객계좌에 대하여 고객의 요구시 즉시 통지할 수 있도록 영업점에 이를 비치한 경우 2.
			반기동안 매매, 그 밖의 거래가 없는 계좌의 반기말 현재 예탁재산 평가액이 금융감독원장이 정하는 금액을 초과하지 않는 경우에
			그 계좌에 대하여 투자자 요구시 즉시 통지할 수 있도록 영업점에 반기말 잔액·잔량현황을 비치한 경우 3. 매매내역을 고객이
			수시로 확인할 수 있도록 통장 등 으로 거래하는 경우 4. 투자자로부터 일임받은 권한을 행사하여 단기금융집합투자기구의
			집합투자증권 등을 매수 또는 매도하였거나 증권을 환매하는 조건으로 매수 또는 매도한 내역 이외에 월간 금융투자상품의 거래가
			없는 계좌에 대하여 투자자의 요구시 즉시 통지할 수 있도록 지점, 그 밖에 영업소에 이를 비치한 경우 5. 맞춤식
			자산관리계좌(Wrap Account)에 대하여 투자일임보고서를 교부한 경우 ④ 회사는 제2항 이외에 감독기관의 지시 등
			필요한 경우 월간 거래내역 또는 잔액 · 잔량현황을 고객에게 통지할 수 있다. ⑤ 회사는 고객이 주소 등을 잘못 기재하였거나
			변경된 주소의 통보를 소홀히 하여 발생한 불이익에 대하여는 회사의 귀책사유가 없는 한 책임을 지지 아니한다.
			제9조(거래매체의 이용) ① 고객은 계좌개설시 다음 각 호에 나열된 거래매체를 발급 받아 이용할 수 있다. 1. 증권카드
			2. 연계카드 3. 제휴카드 4. 통장 5. 모바일통장 ② 증권카드 : 가장 기본적인 거래매체로서 회사의 영업점을 통한 거래
			및 자동화기기를 이용한 거래가 가능하다. ③ 연계카드 : 회사계좌에 은행의 연계계좌번호를 추가 등록시킨 카드로서 자동화기기를
			통한 거래가 가능하다. ④ 제휴카드 : 타 금융기관과 제휴하여 연계카드의 기능 및 신용/체크카드 등의 부가 기능을 하나로
			통합시킨 카드로서 사용등록 및 결제는 다음의 각 호에 따른다. 1. 제휴카드를 발급 받은 고객은 제휴금융기관이나 회사의
			영업점을 통하여 사용등록을 하여야 하며 사용등록을 하지 않을 경우 회사 계좌 잔액 및 잔량의 출금 및 출고가 불가능하다.
			2. 회사는 &#60;별첨&#62;에서 정한 시간에 결제대상 계좌에 인출가능금액으로 남은 예수금을 제휴카드 결제대금으로 사용할 수
			있다. ⑤ 통장 : 거래내역이 기장되는 거래매체로서 회사 영업점을 통한 거래 및 회사 자동화기기를 이용한 거래가 가능하다.
			⑥ 모바일통장 : 모바일 앱을 통해, 인증번호를 생성하여 거래하는 서비스 매체이며, 창구출금 또는 제휴 되어 있는
			자동화기기에서 이용이 가능하다. 제10조(현금 및 증권 등의 출납) ① 고객이 계좌의 자산을 인출하고자 하는 경우 소정의
			신청서에 등록한 거래인감 등을 제시하고 &#60;별첨&#62;에서 정한 거래매체를 영업점에 제시해야 한다. 단, 별도의 약정을
			체결한 고객의 경우에는 거래매체 및 거래인감 등이 없이도 회사가 정한 절차에 의하여 인출이 가능하다. ② 회사는 고객이
			제출한 거래매체 및 거래인감 등이 회사에 등록된 정보와 일치하였을 경우 인출요구한 자산을 고객에게 지급하며 필요한 경우
			추가로 실명확인증표를 요구할 수 있다. ③ 회사는 고객이 사이버 및 유선 한도를 신청한 경우, 그 신청한 금액을 요청 한도로
			적용되며, 별도로 신청하지 않은 경우 보안매체 기본한도를 자동으로 부여한다. 제11조(사고변경사항 신고) ① 고객이
			접근매체를 분실·멸실 하거나, 도난당한 때에는 지체 없이 회사에 전화 또는 방문하여 신고하여야 한다. 단, 제휴카드의
			경우에는 해당 은행이나 카드사로 신고할 수 있다. ② 고객은 신고한 거래인감 등, 비밀번호, 그 밖의 신고사항을 변경하고자
			하는 경우에는 회사에 신고하여야 한다. ③ 회사는 회사의 책임 있는 사유가 없는 한 제1항에서 정한 때에 고객의 책임 있는
			사유로 고객이 신고하지 아니하거나 게을리하는 등 발생한 손해에 대하여 책임을 지지 아니한다. 제12조(계좌의 수시폐쇄) ①
			고객은 회사에 개설한 계좌를 폐쇄하고자 할 경우, 회사에 계좌폐쇄신청을 해야 한다. 제13조(계좌의 통합 및 폐쇄) ①
			회사는 현금 및 금융투자상품 등 예탁자산의 합계가 10만원 이하이고 최근 6개월간 고객의 매매거래 및 입출금, 입출고 등이
			중단된 계좌를 타계좌와 구분하여 통합계좌로 별도관리 할 수 있다. ② 회사는 고객계좌의 잔액·잔량이 예탁자산의 합계가
			"영"이 된 날로부터 6개월이 경과한 경우 또는 고객이 계좌의 폐쇄를 요청한 경우에는 해당 계좌를 폐쇄할 수 있다.
			제14조(약관의 변경등) ① 회사는 이 약관을 변경하고자 하는 경우 변경내용(기존 고객에 대한 변경약관 적용 여부,
			신·구대비표 등)을 변경되는 약관의 시행일 20일 전에 고객이 확인할 수 있도록 회사의 영업점에 갖추어 두거나 인터넷
			홈페이지, 온라인 거래를 위한 컴퓨터 화면, 그 밖에 이와 유사한 전자통신매체를 통하여 게시한다. 다만, 자본시장법 등
			관계법령 또는 거래소 업무규정의 제·개정에 따른 제도변경 등으로 약관이 변경되는 경우로서 본문에 따라 안내하기가 어려운
			급박하고 부득이한 사정이 있는 경우에는 변경내용을 앞의 문장과 같은 방법으로 개정 약관의 시행일 전에 게시한다. ② 제1항의
			변경내용이 고객에게 불리하거나 중요한 내용인 경우에는 이를 서면 등 고객과 사전에 합의한 방법으로 변경되는 약관의 시행일
			20일 전까지 개별통지(신·구대비표 포함)하여야 한다. 다만 기존 고객에게 변경 전 내용이 그대로 적용되는 경우 또는 고객이
			변경내용에 대한 통지를 받지 아니하겠다는 의사를 명시적으로 표시한 경우에는 그러지 아니하다. ③ 회사는 제2항의 통지를 할
			경우 “고객은 약관의 변경에 동의하지 아니하는 경우 계좌를 폐쇄할 수 있으며, 통지를 받은 날로부터 변경되는 약관의 시행일
			전의 영업일까지 계좌폐쇄의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다”라는 취지의 내용을 통지하여야 한다.
			④ 고객이 제3항의 통지를 받은 날로부터 변경되는 약관의 시행일 전의 영업일까지 계약해지의 의사표시를 하지 아니하는 경우에는
			변경에 동의한 것으로 본다. ⑤ 회사는 약관을 영업점에 비치 또는 게시하여 고객이 요구할 경우 이를 교부하여야 하며, 인터넷
			홈페이지 온라인증권거래를 위한 컴퓨터 화면, 그 밖에 이와 유사한 전자통신매체에 게시하여 고객이 약관을 조회하고
			다운로드(화면출력 포함)받을 수 있도록 하여야 한다. 제15조(양도 및 질권설정 금지) 고객은 회사의 동의를 얻어 현금 및
			금융투자상품 등 예탁자산을 양도하거나 질권(채무자가 돈을 갚을 때까지 채권자가 담보물을 보유할 수 있고, 채무자가 돈을 갚지
			않을 때는 그 담보물에 대하여 우선적으로 변제를 받을 수 있는 권리를 말한다)을 설정할 수 있다. 제16조(약관적용 및 적용
			우선순위) ① 고객이 회사의 계좌에서 개별 상품 및 서비스를 이용하는 경우 해당 상품 및 서비스의 개별약관 및 약정서가 이
			약관에 우선한다. ② 이 약관에서 정하지 아니한 사항은 별도의 약정이 없는 한 관계법규(「자본시장과 금융투자업에 관한
			법률」등) 및 관련약관에서 정하는 바에 따르며 관계법규 및 관련약관에도 정함이 없을 경우에는 일반적인 상관례에 따른다. ③
			이 약관에 의한 서비스 중 전자금융거래에 관하여는 ‘전자금융거래이용에 관한 기본약관’ 및 ‘전자금융거래서비스 약관’ 및
			전자금융거래법령이 우선 적용된다. 제17조(분쟁조정) 고객은 회사와 분쟁이 발생하는 경우 회사의 민원처리기구에 그 해결을
			요구하거나 금융감독원, 한국금융투자협회 등에 분쟁조정을 신청할 수 있다. 제18조 (고객의 변경사항 통지) 고객은 주소와
			연락처, 일임권 또는 대리권의 범위 그 밖의 고객이 회사에 제공한 정보에 변경이 있는 때에는 지체 없이 그 변경내용을 회사에
			통지하여야 하며, 고객의 책임 있는 사유로 통지하지 아니하거나 게을리하는 등 발생하는 불이익에 대해서 회사의 책임 있는
			사유가 없는 한 회사는 책임을 지지 아니한다. 제19조 (통지의 효력 등) ① 서면에 의한 통지의 효력은 도달한 때로부터
			발생한다. 회사의 책임 있는 사유 없이 고객의 책임 있는 사유로 고객이 제18조에 의한 변경신고를 게을리하는 등 말미암아
			회사가 발송한 서면통지 또는 그 밖의 서류가 고객에게 연착하거나 도달하지 아니한 때에는 보통의 우송기간이 경과한 때에 도달한
			것으로 본다. 이 경우 고객의 권리의무에 관한 중요한 의사표시는 반드시 배달증명부 내용증명에 의하여야 하며, 배달증명부
			내용증명이 아닌 경우에는 도달한 것으로 보지 않고 다만 추정한다. ② 제1항의 규정에도 불구하고 회사는 고객이 전자우편에
			의한 통지방법에 별도로 동의한 경우에 한하여 전자우편으로 통지할 수 있다. 제20조 (거래제한) ① 계좌가「전기통신금융사기
			피해방지 및 피해금 환급에 관한 특별법」에 따른 사기이용계좌로 사용될 경우, 회사는 해당 계좌명의인에 대해 계좌개설 등
			금융거래를 제한할 수 있다. ② 제1항에 따라 계좌개설 등 금융거래가 제한될 경우 회사는 지체 없이 해당 계좌명의인에게 그
			사실을 통지한다. 제21조 (회사의 책임) ① 회사는 회사의 책임 있는 사유가 없는 경우로서 고객의 책임 있는 사유로 인하여
			고객에게 발생하는 손해에 대하여 책임을 지지 아니한다. ② 제1항에도 불구하고 전자금융거래시 접근매체(비밀번호 등)의 위조나
			변조로 발생한 사고, 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고, 전자금융거래를 위한 전자적 장치
			또는「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한
			방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 회사는 과실 여부를 불문하고 그
			손해를 배상하여야 한다. 단, 전자금융거래시 고객의 고의나 중대한 과실이 있는 경우 등은 전자금융거래 이용에 관한
			기본약관에서 정한 바에 따른다. ③ 제1항에도 불구하고 전자금융거래법 등 관련 법령에 고객에게 유리하게 적용될 수 있는
			규정이 있는 경우에는 그 법령을 우선 적용한다. 제22조(불가항력으로 인한 면책) 회사는 천재지변, 사변 이에 준하는
			불가항력의 사유로 인하여 서비스를 제공할 수 없는 경우와 지연되는 경우 이에 대한 책임을 지지 아니한다.  </p>

	<div class="consent_box">
		<span style="color: red;">*필수</span>
		<span>삼조뱅크 입출금통장 특약 (2)</span>
		<label>
		<input type="checkbox" name="chkbox1" class="consent1" required> 동의
		</label>
	</div>
	<p class="text">제2장 제휴금융기관 증권계좌 개설서비스 제23조(특약) ① 제휴금융기관 증권계좌개설 서비스를 이용할 수 있는 고객은 내국인
		개인고객으로 한정한다. ② 회사는 제휴금융기관 증권계좌개설 서비스에 의해 개설된 계좌에 대해서는 회사가 실명을 재확인하기
		전까지는 일부거래를 제한할 수 있다. 제24조(제휴금융기관 증권계좌개설 서비스의 신청 및 해지) ① 제휴금융기관 증권계좌개설
		서비스의 계약기간은 계좌개설일로부터 계좌의 폐쇄시까지로 한다. ② 제휴금융기관 증권계좌개설 서비스는 고객이 제휴은행의
		영업점에서 회사가 정한 소정의 신청서에 필요한 사항을 기재하고 서비스 이용을 신청하면, 실명확인을 받은 사실이 제휴은행으로부터
		회사에 통보되어 회사가 이를 승낙함으로써 성립한다. ③ 고객이 증권계좌를 폐쇄하고자 할 경우 회사 또는 제휴은행을 방문하여
		신청하여야 한다. 제25조(은행이체) ① 제휴은행에서 증권계좌를 개설한 고객은 증권계좌와 일대일로 연계된 제휴은행 계좌를
		통하여 거래자금의 입금과 출금이 가능하다. ② 은행이체 거래방법은 다음 각호와 같다. 1. 은행이체 가능시간은 회사가 정하여
		영업점 또는 전자적 장치 등을 통하여 게시하며, 변경시 영업점 또는 전자적 장치 등을 통하여 공지한다. 2. 제휴은행계좌와
		증권계좌간의 이체시 발생하는 수수료는 회사가 부담한다. 단,
		&#60;별첨&#62;에서 일정한 기준을 정하여 고객에게 이체수수료를 부담하게 하는 경우 회사는 이와 관련된 이체수수료 징수기준을
		시행일 1개월 전 고객에게 직접 통지하여야 하며, 이 경우 고객이 시행일 이전까지 이에 서면 등의 방법으로 동의하지 않는다는
		의사 표명을 한 경우 은행이체서비스를 해지할 수 있다. 3. 은행이체 가능시간 내에서의 이체거래시 출금계좌의 인출가능금액
		부족, 출금사고계좌의 등록의 사유로 이체가 실행되지 아니한 경우 이체거래신청의 효력이 자동으로 상실되며, 금융결제원 전산망
		장애등의 사정으로 이체가 불가능할 경우에는 장애복구 후 입출금 처리된다. 단, 지체없이 해당사정을 고객에게 통지하여야 한다.</p>
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
		<div class="submitBtns">
			<button type="submit" class="ok btn btn-success">개설신청</button>
			<button type="button" class="btn btn-danger cancelBtn">취소</button>
		</div>
	</form>
	</div>
<script type="text/javascript" src="./javascript/normalNotice.js"></script>
</body>

</html>