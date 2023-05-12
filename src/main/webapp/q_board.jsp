<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="bank.dao.MemberDAO"%>
<%@page import="bank.dto.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./javascript/signUp.js"></script>
<title>등록하기</title>
<%@ include file="navBar.jsp"%><br>
	<div>
		<h3 class="tit_cont">1:1 문의</h3>
		<div>
			<ul id="localNav" class="tab_cont">
				<li id="lnb_Ask" class="on"><a href="#" role="tab"
					aria-selected="true" class="link_tab">등록하기</a></li>
				<li id="lnb_MyHistory" class=""><a href="./boardList.jsp"
					role="tab" aria-selected="false" class="link_tab">조회하기</a></li>
			</ul>
		</div>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
		<form action="./board_insert.jsp" method="post" onsubmit="return formCheck();">
			제목 : <input type="text" name="title" required><br> 
			작성자 : <input type="text" name="writer" required><br> 
			날짜 : <input type="text" name="regdate" required><br> 
				<input type="submit" value="등록">
		</form>

	<script>
	<%--
	function formCheck() {
	    var title = document.forms[0].title.value;     
	    var writer = document.forms[0].writer.value;
	    var regdate = document.forms[0].regdate.value;
	    var content = document.forms[0].content.value; 
	     
	    if (title == null || title == ""){
	        alert('제목을 입력하세요');          
	        document.forms[0].title.focus();  
	        return false;                    
	    }
	    if (writer == null ||  writer  == ""){   
	        alert('작성자를 입력하세요'); 
	        document.forms[0].writer.focus();            
	        return false;               
	    }
 
	    if (content == null ||  content == ""){
	        alert('내용을 입력하세요'); 
	        document.forms[0].content.focus();
	        return false;
	    }
	     
	    if (regdate == null || regdate == "" ){
	        alert('날짜를 입력하세요');   
	        document.forms[0].regdate.focus();
	        return false;            
	    }
	} 
	--%>
		function formCheck() {
			var length = document.forms[0].length-1; 
			
			for(var i = 0; i < length; i++){    
			    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			        alert(document.forms[0][i].name + "을/를 입력하세요."); 	 
			        document.forms[0][i].focus();           
			        return false;
			    }
			}
	</script>


		<%-- 
		<div>
			<div class="module_content">
				<form action="./q_board_proc.jsp" method="post" autocomplete="off">
					<fieldset>
						<legend class="screen_out">1:1문의 입력폼</legend>
						<div class="wrap_subject">
							<strong class="tit_subject" name="title">1:1 문의 내용입력</strong> <em
								class="emph_g"><div style="float: left;">
								
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
  <path
											d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
</svg>
								</div> 표시는 필수 입력 사항입니다. </em>
						</div>
						<div class="cont_bundle">
							<div class="cont_item">
								<strong class="tit_item">답변 받을 이메일주소</strong>
								<div>
									<label for="inputEmail" class="form-label"></label> <input
										type="text" class="form-control" required name="email"
										id="inputEmail" placeholder="이메일을 입력하세요" autoComplete="false">
									<span>@</span> <input type="text" class="form-control" required
										name="emailAddr" id="inputEmailAddr" autoComplete="false"
										pattern="[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"> <select
										name="emailAddrs" class="addrsSelect">
										<option value="">직접 입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="kakao.com">kakao.com</option>
										<option value="yahoo.com">yahoo.com</option>
									</select>
								</div>
							</div>
							<div class="cont_item br_btm">

								<strong class="tit_item">답변 받을 휴대폰번호</strong>
								<p class="desc_info">
									<input type="tel" class="form-control" required maxLength="11"
										name="phone" id="inputPhone" placeholder="연락처를 입력하세요"
										autoComplete="false"> <span>(-) 없이 숫자만 입력해주세요</span>
								</p>
							</div>
							<div class="cont_item">
								<strong class="tit_item"><label for="inpTit">제목</label>
									<svg width="16" height="16" fill="currentColor"
										class="bi bi-check" viewBox="0 0 16 16">
  <path
											d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
</svg></strong>
								<div class="box_inp">
									<!-- 활성화시 클래스 on추가 -->
									<input class="inp_g" id="inpTit" maxlength="100"
										name="questionTitle" placeholder="제목을 입력해 주세요."
										title="제목을 입력해 주세요" type="text" value="" required>
								</div>
							</div>
							<div class="cont_item">
								<strong class="tit_item"><label for="inpTxt" name="content">문의내용</label>
									<svg width="16" height="16" fill="currentColor"
										class="bi bi-check" viewBox="0 0 16 16">
  <path
											d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
</svg></strong>
								<div class="box_textarea">
									<textarea class="inp_g" id="inpTxt" maxlength="1000"
										name="questionContents" placeholder="내용을 입력해 주세요."
										title="내용을 입력해 주세요" required></textarea>
									<span class="txt_byte"><span class="screen_out">현재
											입력자수</span><span class="byte_size">0</span>/<span class="screen_out">전체
											입력 가능자수</span><span class="maxbyte_size">1000</span></span>
								</div>
							</div>
						</div>

						<div class="wrap_btn">
							<button class="btn_g btn_check" type="submit">문의하기</button>
							<button class="btn_g" id="cancelAsk" type="reset">취소하기</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
--%>
</body>
</html>