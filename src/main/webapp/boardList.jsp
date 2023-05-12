<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<title>게시글 조회</title>
<%@ include file="navBar.jsp"%>
<style type="text/css">
.bb {
	display: flex;
	font-weight: 800;
	justify-content: center;
}

.aa {
	padding: 15px;
}
</style>
<div>
	<h3 class="tit_cont">게시글 리스트</h3>
	<div>
		<ul id="localNav" class="tab_cont">
			<li id="lnb_Ask" class=""><a href="./q_board.jsp" role="tab"
				aria-selected="true" class="link_tab">등록하기</a></li>
			<li id="lnb_MyHistory" class="on"><a href="#" role="tab"
				aria-selected="false" class="link_tab">조회하기</a></li>
		</ul>
	</div>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<%
	int idx = 1;
	 
    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
   String regdate = rs.getString("SYSDATE");

    String content = request.getParameter("content");
	%>
		<table>
		<tr>
				<th>제목</th>

				<th>작성자</th>
				
				<th>날짜</th>

		</tr>
		<tr>
				<td><%=title %></td>
				<td><%=writer %></td>
				<td><%=content %>
	<%-- 			<td><%=regdate %></td>--%>

			</tr>
			</table>
			
			
			
			
			
		
	
			
	




		<ul class="bb">
			<li class="aa"><a href="#">&laquo;</a></li>
			<%-- 유니코드 &laquo = << --%>
			<li class="aa"><a class="w3-green" href="./boardList.jsp">1</a></li>
			<li class="aa"><a href="#">2</a></li>
			<li class="aa"><a href="#">3</a></li>
			<li class="aa"><a href="#">4</a></li>
			<li class="aa"><a href="#">5</a></li>
			<li class="aa"><a href="#">&raquo;</a></li>
			<%-- 유니코드 &raquo = >>--%>
		</ul>


		</form>
</body>
</html>