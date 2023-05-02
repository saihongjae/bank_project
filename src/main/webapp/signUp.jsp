<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 폼</h1>
	<form name='memberAddForm' action='signUpMember_proc.jsp' method="post">
	<div>
		<label for="inputName" class="form-label">이름</label> 
		<input type="text" class="form-control" required maxLength="10"
			name="name" id="inputName" placeholder="이름을 입력하세요">
	</div>
	<div>
	<label for="formGroupSsn1" class="form-label">주민번호를 입력하세요</label> 
		<input type="text" class="form-control" required maxLength="6"
			name="ssn1" id="inputSsn1" placeholder="주민번호 앞자리">
		<input type="password" class="form-control" required maxLength="6"
			name="ssn2" id="inputSsn2" placeholder="주민번호 뒷자리">
	</div>
		<div>
		<label for="inputId" class="form-label">id</label> 
		<input type="text" class="form-control" required
			name="id" id="inputId" placeholder="ID를 입력하세요">
	</div>
	<div>
		<label for="inputPw" class="form-label">비밀번호</label> 
		<input type="password" class="form-control" required
			name="pw" id="inputPw" placeholder="비밀번호를 입력하세요">
	</div>
	<div>
		<label for="inputPw2" class="form-label">비밀번호 확인</label> 
		<input type="password" class="form-control" required
			name="pw2" id="inputPw2" placeholder="비밀번호를 다시 입력하세요">
	</div>
	<div>
		<label for="inputEmail" class="form-label">이메일</label> 
		<input type="email" class="form-control" required
			name="email" id="inputEmail" placeholder="이메일을 입력하세요">
	</div>
	<div>
		<label for="inputPhone" class="form-label">휴대폰</label> 
		<input type="tel" class="form-control" required
			name="phone" id="inputPhone" placeholder="연락처를 입력하세요">
	</div>
	<button id="signUpBtn" type="button">회원가입</button>
	<button id="cancelBtn" type="button">취소</button>
	</form>
	<script>
		document.querySelector("#signUpBtn").addEventListener('click', ()=>{
			let form = document.memberAddForm;
			console.log('회원가입!!');
			form.submit();
		})
	</script>
</body>
</html>

