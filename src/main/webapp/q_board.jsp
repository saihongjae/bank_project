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
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<h3 class="tit_cont">1:1 문의</h3>
	<div>
		<ul id="localNav" class="tab_cont">
			<li id="lnb_Ask" class="on"><a href="" role="tab"
				aria-selected="true" class="link_tab">등록하기</a></li>
			<li id="lnb_MyHistory" class=""><a href="./boardList.jsp"
				role="tab" aria-selected="false" class="link_tab">조회하기</a></li>
		</ul>
	</div>
	<form action="board_insert.jsp" method="post" onsubmit="return formCheck();">
      <div class="mb-3">
         <label class="form-label"><strong>아이디</strong></label> <input
            type="text" class="form-control" value="<%=userID%>" name="id"
            aria-describedby="emailHelp" readonly>
      </div>

      <div class="mb-3">
         <label class="form-label"><strong>제목</strong></label> <input
            type="text" class="form-control" name="title" required>
      </div>

      <strong>문의 내용</strong>
      <div class="form-floating">
         <textarea class="form-control" placeholder="Leave a comment here"
            name="content" style="height: 100px" maxlength="1000" required></textarea>
         <label for="floatingTextarea2">문의 내용을 입력하세요(1,000자 이내)</label>
      </div>
      <br>
      <button type="submit" class="btn btn-primary">접수</button>
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

	<script>
		function formCheck() {
			var length = document.forms[0].length-1; 
			
			for(var i = 0; i < length; i++) {    
			    if(document.forms[0][i].value == null || document.forms[0][i].value == "") {
			        alert(document.forms[0][i].name + "을/를 입력하세요."); 	 
			        document.forms[0][i].focus();           
			        return false;
			    }
			}
		}
	</script>
</body>
</html>