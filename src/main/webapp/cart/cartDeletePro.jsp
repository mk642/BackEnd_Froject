<%@page import="Shop.itemDAO"%>
<%@page import="Shop.itemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
    
<%
    request.setCharacterEncoding("utf-8");

    String no = request.getParameter("no");
	int sno = (int) session.getAttribute("no"); 
            	
    itemDAO dao = new itemDAO();
    itemDTO dto = new itemDTO(sno);
    		
    dao.deleteCartItem(dto); 		
	
    
    %>
    
	<script>
		let ans = alert("삭제되었습니다!");
		if (!ans){
			location.href='?.jsp';
		}
	</script>
	
