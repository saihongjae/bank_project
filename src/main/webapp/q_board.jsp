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
<script type="text/javascript" src="./javascript/signUp.js"></script>
<title>등록하기</title>

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
		<form action="board_insert.jsp"  method="post"  onsubmit="return formCheck();">
		
			<strong>아이디</strong>: <input type="text" name="id"  value="<%=userID%>"  readonly><br>
			
			<strong>제목</strong> : <input type="text" name="title"  required><br> 
			 
			<strong>내용</strong> : <textarea cols="100" rows="10" name="content"  placeholder="1000자 이내로 작성 하시오."  maxlength="1000" required></textarea><br>
			  
				<input type="submit" value="등록">
				
		</form>

	<script>
		function formCheck() {
			var length = document.forms[0].length-1; 
			
			for(var i = 0; i < length; i++){    
			    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			        alert(document.forms[0][i].name + "을/를 입력하세요."); 	 
			        document.forms[0][i].focus();           
			        return false;
			    }
			}
	</script>
</body>
</html>