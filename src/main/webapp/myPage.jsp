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
<title>profile</title>

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
				<th>아이디 </th>
					<td><%=userID%></td>
					
				</tr>

				<tr>
					<th>이름 </th>
					<td><%=mypageDto.getName()%></td>
				</tr>
				
				<%--<tr>
				<th>비밀번호 :</th>				
			 	<td>
					<input type="text" class="form-control" id="inputPW"
					name="pw" value="<%=mypageDto.getPw()%>">
				</td> 
				</tr>--%>

				<tr>
					<th>전화번호 </th>
					<td>
					<input type="text" class="form-control" id="inputPhone"
						name="phone" placeholder="변경된 전화번호" maxLength="11"
						value="<%=mypageDto.getPhone()%>">
					</td>
				</tr>
				
				<tr>
					<th>Email </th>
					<td>
				<input type="text" class="form-control" required 
						name="emailId" id="inputEmail" placeholder="변경된 이메일아이디" 
						value="<%=email.substring(0, email.indexOf('@'))%>" >
					<span>@</span>
				<input type="text" class="form-control" required
						name="emailAddr" id="inputEmailAddr" placeholder="도메인 직접 입력해주세요" 
						value="<%=email.substring(email.indexOf('@')+1)%>" pattern="[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$">
					</td>
				</tr>
				
				<tr>
					<th>가입날짜 :</th>
					<td><%=mypageDto.getRegdate()%></td>
				</tr>
			</table>
		</div>
	</form>
	<button id="updateBtn" type="button" class="btn btn-warning">수정</button>

	<script>	
		document.getElementById('updateBtn').addEventListener('click', ()=>{
		let form = document.memberProfileForm;
		
		let inputPhone = document.getElementById('inputPhone');
		if(inputPhone.value == "" || (inputPhone.value.length != 11)){
			alert('전화번호를 바르게 입력해주세요');
			inputPhone.focus();
		}
		if(inputEmail.value == ""){
			alert('이메일을 바르게 입력해주세요');
			inputPhone.focus();
		}else {
			if(confirm('수정하시겠습니까?')){
				form.action = 'updateProfile.jsp';
				form.submit();
			}				
		}
	});
	</script>
</body>
</html>