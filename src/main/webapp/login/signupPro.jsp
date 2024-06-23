<!--
	작성자 : manki
	작성일 : 2024. 5. 27.
	기능 : 
	
	수정자 : 전종민
-->
<%@page import="Shop.LoginnDAO"%>
<%@page import="Shop.LoginnDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>

	<%	
 	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

 	LoginnDTO dto = new LoginnDTO(email, name, pwd);
 	
	LoginnDAO dao = new LoginnDAO();
	dao.insert(dto);
	
 	response.sendRedirect("login.jsp");
 
%>
