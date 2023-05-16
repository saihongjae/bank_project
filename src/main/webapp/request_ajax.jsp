<%@page import="bank.dao.accountTransferDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String accNum = request.getParameter("accNum");
	accountTransferDAO dao = new accountTransferDAO();
	String checkedBalance = dao.checkBalance(accNum);
	out.print(checkedBalance);
%>
