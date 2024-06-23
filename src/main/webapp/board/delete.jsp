<%@page import="Shop.Paging"%>
<%@page import="Shop.boardDAO"%>
<%@page import="Shop.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*,javax.naming.*,javax.sql.DataSource" %>
    
<%
    request.setCharacterEncoding("utf-8");
    	
    	String no = request.getParameter("no");
    	boardDAO dao = new boardDAO();
    	dao.deleteOne(no);
    %>
	
<script>
		let ans = alert("삭제되었습니다!");
		if (!ans){
			location.href='board.jsp';
		}
</script>


