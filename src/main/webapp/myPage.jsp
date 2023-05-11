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
<%@page import="bank.oracle.PWManager"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>

</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	
	mypageDAO mypageDao = new mypageDAO();
	mypageDTO mypageDto = new mypageDTO();
	
	mypageDto = mypageDao.PersonInfo(userID);
	
	

	%>

	<div class=middle>
		<table class="table table-hover">
			<tr>
				<p>
					<strong>아이디 : <%=userID %></strong>
				</p>
			</tr>

			<tr>
				<th>이름 :</th>
				<td><%=mypageDto.getName() %></td>
			</tr>
			<tr>
				<th>비밀번호 :</th>
				<td><%=mypageDto.getPw() %></td>
			</tr>
			<tr>
				<th>전화번호 :</th>
				<td><%=mypageDto.getPhone()%></td>
			</tr>
			<tr>
				<th>Email :</th>
				<td><%=mypageDto.getEmail()%></td>
			</tr>
			<tr>
				<th>가입날짜 :</th>
				<td><%=mypageDto.getRegdate()%></td>
			</tr>
		</table>
	</div>
	<button id="updateBtn" type="button" class="btn btn-warning">수정</button>
	<button id="deleteBtn" type="button" class="btn btn-danger">취소</button>

	<script>
	
	document.getElementById('deleteBtn').addEventListener('click', ()=>{
		let form = document.personDetailForm;
		if(confirm('삭제하시겠습니까?')){
			form.action = 'deletePerson_proc.jsp';
			form.submit();
		}
	});
	
	document.getElementById('updateBtn').addEventListener('click', ()=>{
		let form = document.personDetailForm;
		
		let inputName = document.getElementById('inputName');
		if(inputName.value == ""){
			alert('이름은 필수입니다');
			inputName.focus();
		} else {
			if(confirm('수정하시겠습니까?')){
				form.action = 'updatePerson_proc.jsp';
				form.submit();
			}				
		}
	});
	<a href="./main.jsp">
	</script>
</body>
</html>