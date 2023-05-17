
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
	*{
	margin: 0;
	padding: 0;
	text-align: center;
	}

    table{
    width: 100%;
        border: solid 1px;
    }
    
</style>
</head>
<body>

<%@ include file="admin_navbar.jsp"%>
		<table class="container">
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
   AccOpenManagementDAO amoDAO = new AccOpenManagementDAO();
   List<AccOpenManagementDTO> amoList = amoDAO.OpeningRequestInfoList();

		for(AccOpenManagementDTO item : amoList){
	%>
			<tr>
				<form action="admin_tap_request_approved.jsp" method="post">
					<td><%=item.getName()%></td>
					<td><input type="text"  class="sub"  name="accnum"   value="<%=item.getAccnum()%>" readonly></td>
					<td><%=item.getAccType()%></td>
					<td><input type="text"  class="sub" name="requestDate"  value="<%=item.getRequestDate()%>" readonly></td>
					<td><button type="submit">승인</button></td>
				</form>
			</tr>
	<%
		}
	%>
		</tbody>	
	</table>
</div>


   
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <%@ include file="./footer.jsp"%>
</body>
</html>