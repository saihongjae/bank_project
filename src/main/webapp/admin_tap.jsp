<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="./imgs/bank.png">
<title>삼조은행</title>
<style>
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

table {
	width: 100%;
	border: solid 1px;
}

table .sub {
border: none;
}
</style>
</head>

<body>
	<%@ include file="admin_navbar.jsp"%>
	<%
	if (userID == null || !userID.equals("kingsaihong")) { %>
	<script>
	Swal.fire({
		  icon: 'warning',
		  title: "로그인이 필요한 페이지입니다"
		})
		setTimeout("location.href = 'login_tap.jsp'",1000);
	</script>
	<% 
	return;
	}
	AccOpenManagementDAO amoDAO=new AccOpenManagementDAO(); 
	List<AccOpenManagementDTO> amoList = amoDAO.OpeningNormalRequestInfoList();
	List<AccOpenManagementDTO> amoList2 = amoDAO.OpeningDslRequestInfoList();
	if (amoList.size() == 0 && amoList2.size() == 0) { %>

	<div class="alert alert-primary" style="margin: 30px;" role="alert">
	 승인 대기 중인 개설 요청이 없습니다.
	</div>
	<%
	return;
	}
	%>
	<table class="container" style="padding: 30px;">
		<thead>
			<tr>
				<th>이름</th>
				<th>계좌번호</th>
				<th>통장 타입</th>
				<th>요청시간</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (amoList.size() != 0) {
				for(AccOpenManagementDTO item : amoList){
			%>
			<tr>
				<form action="admin_tap_request_approved.jsp" method="post">
					<td><input type="text" class="sub" name="name"
						value="<%=item.getName()%>" readonly></td>
					<td><input type="text" class="sub" name="accnum"
						value="<%=item.getAccNum()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="balance" value="<%=item.getBalance()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="regular" value="<%=item.getRegularDate()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="term" value="<%=item.getTerm()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="monthly" value="<%=item.getRegularDate()%>" readonly></td>
					<td><input type="text" class="sub" name="type"
						value="<%=item.getAccType()%>" readonly></td>
					<td><input type="text" class="sub" name="requestDate"
						value="<%=item.getRequestDate()%>" readonly></td>
					<td><button type="submit" class="btn btn-outline-dark" style="width: 100%;">승인</button></td>
				</form>
			</tr>
			<% } } %>
			<% if (amoList2.size() !=0) { for(AccOpenManagementDTO item : amoList2){ %>
			<tr>
				<form action="admin_tap_request_approved.jsp" method="post">
					<td><input type="text" class="sub" name="name"
						value="<%=item.getName()%>" readonly></td>
					<td><input type="text" class="sub" name="accnum"
						value="<%=item.getAccNum()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="balance" value="<%=item.getBalance()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="regular" value="<%=item.getRegularDate()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="term" value="<%=item.getTerm()%>" readonly></td>
					<td style="display: none;"><input type="hidden" class="sub"
						name="monthly" value="<%=item.getRegularDate()%>" readonly></td>
					<td><input type="text" class="sub" name="type"
						value="<%=item.getAccType()%>" readonly></td>
					<td><input type="text" class="sub" name="requestDate"
						value="<%=item.getRequestDate()%>" readonly></td>
					<td><button type="submit" class="btn btn-outline-dark" style="width: 100%;">승인</button></td>
				</form>
			</tr>
			<% } } %>
		</tbody>
	</table>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>

</html>