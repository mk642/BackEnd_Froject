<%@page import="Shop.boardDAO"%>
<%@page import="Shop.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
     

	<%	
 	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String sName = (String) session.getAttribute("name"); 
	

	boardDTO dto = new boardDTO(sName, title, content);
 	
	boardDAO dao = new boardDAO();
	dao.insertBoard(dto);
	

 
%>

<script>
	alert("작성 되었습니다.");
	location.href="board.jsp";
</script>
