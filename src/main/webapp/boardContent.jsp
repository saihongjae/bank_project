<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<%@ include file="navBar.jsp"%>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = null;
	if (session.getAttribute("id") != null) { // null이 아니면 로그인한 것
		userID = (String) session.getAttribute("id");
	}
	%>
	<div>
		<h3 class="tit_cont">1:1 문의</h3>
		<div>
			<ul id="localNav" class="tab_cont">
			<%	if (userID != null) { %>
				<li id="lnb_Ask" class="on"><a href="./q_board.jsp" role="tab"
					aria-selected="true" class="link_tab">등록하기</a></li>
			<%	} else {%> 
				<script>alert("로그인 하세요.")</script>	
			<%	} %>
			<%	if (userID != null) { %>
				<li id="lnb_MyHistory"><a href="./boardList.jsp" role="tab"
					aria-selected="false" class="link_tab">조회하기</a></li>
			<%	} else { 

				} %>
			</ul>
		</div>
		<div>
			<div class="module_content">
				<h4 class="screen_out">접수하기</h4>
				<p class="desc_login">
					고객님의 금융관련 상담 및 문의사항에 대한<br>해결을 위해 최선을 다하겠습니다.
				</p>
				<div class="box_login">
					<div class="info_login">
					<%	if (userID != null) { %>						
					<%	} else {%>
						<a class="link_login open_login_window" href="./main_login.jsp">로그인</a>					
						<p class="desc_info">
							로그인 시 개인정보 입력 절차 없이 이용할 수 있으며<br>과거 상담 내역도 확인할 수 있습니다.
						</p>
						<%} %>
					</div>
				</div>




			</div>
		</div>
	</div>









	<%-- <div>
		<h3 class="tit_cont">1:1 문의</h3>
		<div>
			<ul id="localNav" class="tab_cont">
				<li id="Ask" class="on"><a href="./q_board.jsp" role="tab"
					aria-selected="true" class="link_tab">등록하기</a></li>
				<li id="MyHistory">
				<a href="./boardList.jsp" role="tab" aria-selected="false"
					class="link_tab">조회하기</a>
				</li>
			</ul>
		</div>
		<div>
			<div class="modul_content">
				<h4 class="screen_out">접수하기</h4>
				<p class="desc_login">
					"고객님의 금융관련 상담 및 문의사항에 대한"<br> "해결을 위해 최선을 다하겠습니다."
				</p>
				<div class="box_login">
					<div class="info_login">
						<span class=""></span> <a
							class="" href="./login.jsp">로그인<span
							class=""></span></a>
						<p class="desc_info">
							로그인 시 개인정보 입력 절차 없이 이용할 수 있으며<br>과거 상담 내역도 확인할 수 있습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>--%>
</body>
</html>