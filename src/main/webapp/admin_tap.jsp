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
	<div class="nav">

    </div>
    <div class="selectionBar">
		
    </div>
    <%
		int id = Integer.parseInt(request.getParameter("id"));
		PersonDao personDao = new PersonDao();
		PersonDto personDto = personDao.selectPersonInfoById(id);
	%>
	<h1>사용자 상세정보</h1>
	
	<form name='personDetailForm' action='' method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">ID</label>
		  <input type="hidden" class="form-control" id="formGroupExampleInput"
		  		name="id" placeholder="Example input placeholder" value="<%=personDto.getId()%>">
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Name</label>
		  <input type="text" class="form-control" id="inputName"
		  		name="name" placeholder="Another input placeholder" value="<%=personDto.getName()%>">
		</div>
		
		<button id="updateBtn" type="button" class="btn btn-warning">수정</button>
		<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
	</form>
    
</body>
</html>