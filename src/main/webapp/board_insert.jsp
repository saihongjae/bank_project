<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); 

	    String title = request.getParameter("title");    
	    String writer = request.getParameter("writer"); 
	    String regdate = request.getParameter("regdate");
	    String content = request.getParameter("content");
	    
	    if (title == null || title == "") out.println("제목을 작성해주세요");
	    if (writer == null || writer == "") out.println("작성자 입력해주세요");
	    
	    if (regdate == null || regdate == "") out.println("작성일 입력해주세요");
	    else if(!Pattern.matches("^[0-9]*$", regdate))out.println("숫자로 입력해주세요");
		
			try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_id = "scott";
		String db_pw = "tiger";

		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		Statement stmt = conn.createStatement();     
		 
		 String sql = "INSERT INTO bank_board "+			 
		                "(idx, title, writer, regdate, count, content) "+			 
		                "VALUES (board_seq, '"+title+"', '"+writer+"' , sysdate,', '1', '"+content+"')";
		 
		
			stmt.executeUpdate(sql);
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
			//finally {
		//	out.print("<script>location.href='./boardList.jsp';</script>");
//	}
	%>
		
	
	


</body>
</html>
