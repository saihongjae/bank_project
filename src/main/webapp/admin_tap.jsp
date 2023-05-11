<%@page import="bank.dto.AccOpenManagementDTO"%>
<%@page import="java.util.List"%>
<%@page import="bank.dao.AccOpenManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .nav {
        width: 100%;
        height: 110px;
        border: solid 1px;
    }
    .selectionBar {
        width: 100%;
        height: 54px;
        border: solid 1px;
    }
    
    .request {
    border: solid 1px;
    display: flex;
    }
</style>
</head>
<body>
	
<table class="table">
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
					<td><input type="text"  name="accnum"   value="<%=item.getAccnum()%>" readonly></td>
					<td><%=item.getAccType()%></td>
					<td><input type="text"  name="requestDate"  value="<%=item.getRequestDate()%>" readonly></td>
					<td><button type="submit">승인</button></td>
				</form>
			</tr>
	<%
		}
	%>
		</tbody>	
	</table>

   
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    
</body>
</html>