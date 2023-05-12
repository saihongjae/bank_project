<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page import="java.beans.Statement" %>
		<%@page import="java.sql.Connection" %>
			<%@page import="java.sql.DriverManager" %>
				<%@page import="java.sql.PreparedStatement" %>
					<%@page import="java.sql.ResultSet" %>
						<%@page import="java.sql.SQLException" %>
							<%@page import="java.util.*" %>
								<%@page import="bank.oracle.DBConnectionManager" %>
									<%@page import="bank.oracle.PWManager" %>
										<%@page import="bank.dao.MemberDAO" %>

											<!DOCTYPE html>
											<html>

											<head>
												<meta charset="UTF-8">
												<title>Insert title here</title>
											</head>

											<body>
												<% request.setCharacterEncoding("UTF-8"); String
													id=request.getParameter("id"); String
													pass=request.getParameter("pw"); String loc="" ; MemberDAO
													memberDao=new MemberDAO(); boolean
													isLoggedIn=memberDao.loginMember(id, PWManager.encryption(pass)); if
													(isLoggedIn) { session.setAttribute("id", id); // id를 세션값으로 설정 if
													(session.getAttribute("loc") !=null) {
													loc=((String)session.getAttribute("loc")).substring(1); } %>
													<script>
														alert("<%=id%> 님 환영합니다 :) ");
														if ("<%= loc %>" != "") {
															location.href = "<%= loc %>";
														} else {
															location.href = "main.jsp";
														}
													</script>
													<% } else { %>
														<script>
															alert("로그인 실패");
															history.back();
														</script>
														<% } %>

											</body>

											</html>