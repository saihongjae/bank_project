<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bank.dao.mypageDAO"%>
<%@page import="bank.dto.mypageDTO"%>
<%@page import="bank.oracle.DBConnectionManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="bank.dao.MemberDAO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css"
	rel="stylesheet">
	<link href="./css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script	src=" https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js">
</script>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");

	mypageDAO mypageDao = new mypageDAO();
	mypageDTO mypageDto = new mypageDTO();
	mypageDto = mypageDao.PersonInfo(userID);
	String email = mypageDto.getEmail();
	%>

	<form name='memberProfileForm' action='' method="post">
		<div class=middle>
			<table class="table table-hover">

				<tr>
					<th>아이디</th>
					<td><%=userID%></td>

				</tr>

				<tr>
					<th>이름</th>
					<td><%=mypageDto.getName()%></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" class="form-control" id="inputPhone"
						name="phone" placeholder="변경된 전화번호" required maxLength="11"
						value="<%=mypageDto.getPhone()%>"></td>
				</tr>

				<tr>
					<th>Email</th>
					<td><input type="text" class="form-control" required
						name="emailId" id="inputEmail" placeholder="변경된 이메일아이디" required
						value="<%=email.substring(0, email.indexOf('@'))%>"> <span>@</span>
						<input type="text" class="form-control" required name="emailAddr"
						id="inputEmailAddr" placeholder="도메인 직접 입력해주세요" required
						value="<%=email.substring(email.indexOf('@') + 1)%>"
						pattern="[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"></td>
				</tr>

				<tr>
					<th>가입날짜 :</th>
					<td><%=mypageDto.getRegdate()%></td>
				</tr>
			</table>
		</div>
	</form>
	<button id="updateBtn" type="button" class="btn btn-warning">수정</button>
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
	
		document.getElementById('updateBtn').addEventListener('click', ()=>{
		let form = document.memberProfileForm;
		
		let inputPhone = document.getElementById('inputPhone');
		if(inputPhone.value == "" || (inputPhone.value.length != 11)){
			Swal.fire({
				  icon: 'warning',
				  text: '전화번호를 바르게 입력해주세요'
				})
			inputPhone.focus();
			return;
		}
		let inputEmail = document.getElementById('inputEmail');
		if(inputEmail.value == ""){
			Swal.fire({
				  icon: 'warning',
				  text: '이메일 아이디를 바르게 입력해주세요'
				})
			inputEmail.focus();
			return;
		}
		if(inputEmailAddr.value == ""){
			Swal.fire({
				  icon: 'warning',
				  text: '이메일 주소를 바르게 입력해주세요'
				})
			inputEmailAddr.focus();
			return;
		}
		
		Swal.fire({ 
			  title: '수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				  if(result.isConfirmed){
					  form.action = './updateProfile.jsp';
					  form.submit();
				  }
				 })  
	});
	</script>
</body>
</html>