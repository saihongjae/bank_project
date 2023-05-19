<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/signUp.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js
"></script>
</head>
<body>
<%@ include file="navBar.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
if (userID != null) { // null이 아니면 로그인한 것 %>
<script>
	Swal.fire({
	  icon: 'info',
	  title: "이미 가입이 완료된 회원입니다."
	})
	setTimeout("location.href='./main.jsp'",3000);

</script>
<% 
return;
} %>

	<div class="signUpWrapper">
	<h1>회원가입 폼</h1>
	<form name="memberAddForm" action="signUpMember_proc.jsp" method="post">
	<div>
		<label for="inputName" class="form-label">이름</label> 
		<input type="text" class="form-control" required maxLength="10"
			name="name" id="inputName" placeholder="이름을 입력하세요" autoComplete="false">
	</div>
	<div>
	<label for="formGroupSsn1" class="form-label">주민번호를 입력하세요</label> 
		<input type="text" class="form-control" required minLength="6" maxLength="6"
			name="ssn1" id="inputSsn1" placeholder="주민번호 앞자리" autoComplete="false">
			-
		<input type="password" class="form-control" required minLength="7" maxLength="7"
			name="ssn2" id="inputSsn2" placeholder="주민번호 뒷자리" autoComplete="false">
	</div>
		<div>
		<label for="inputId" class="form-label">id</label> 
		<input type="text" class="form-control" required maxLength="20"
			name="id" id="inputId" placeholder="ID를 입력하세요" autoComplete="false">
	</div>
	<div>
		<label for="inputPw" class="form-label">비밀번호</label> 
		<input type="password" class="form-control" required minLength="6"
			name="pw" id="inputPw" placeholder="비밀번호를 입력하세요" autoComplete="false">
		
	</div>
	<div>
		<label for="inputPw2" class="form-label">비밀번호 확인</label> 
		<input type="password" class="form-control" required minLength="6"
			name="pw2" id="inputPw2" placeholder="비밀번호를 다시 입력하세요" autoComplete="false">
		<span class="warningTxt">비밀번호가 일치하지 않습니다</span>
	</div>
	<div>
		<label for="inputEmail" class="form-label">이메일</label> 
		<input type="text" class="form-control" required 
			name="email" id="inputEmail" placeholder="이메일을 입력하세요" autoComplete="false">
		<span>@</span>
		<input type="text" class="form-control" required
			name="emailAddr" id="inputEmailAddr" autoComplete="false" pattern="[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$">
		<select name="emailAddrs" class="addrsSelect">
			<option value="">직접 입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="kakao.com">kakao.com</option>
			<option value="yahoo.com">yahoo.com</option>
		</select>
	</div>
	<div style="margin-bottom: 10px;">
		<label for="inputPhone" class="form-label">휴대폰</label> 
		<input type="tel" class="form-control" required maxLength="11"
			name="phone" id="inputPhone" placeholder="연락처를 입력하세요" autoComplete="false">
		<span>(-)없이 숫자만 입력해주세요</span>
	</div>
	<button id="signUpBtn" type="submit" class="btn btn-success">회원가입</button>
	<button id="cancelBtn" type="button" class="btn btn-outline-danger">취소</button>
	</form>
	</div>
	<script type="text/javascript" src="./javascript/signUp.js"></script>
		<%@ include file="./footer.jsp"%>
</body>
</html>

