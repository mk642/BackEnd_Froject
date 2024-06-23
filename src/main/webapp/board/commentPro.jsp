<%@page import="Shop.commentDAO"%>
<%@page import="Shop.commentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
    

	<%	
 	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	int fno = Integer.valueOf(request.getParameter("pno"));
	String sName = (String) session.getAttribute("name"); 
	


	commentDTO dto = new commentDTO(sName,content);
 	
	commentDAO dao = new commentDAO();
	dao.insertComment(dto, fno);
	

 
%>


<script>

	location.href="content.jsp?id=<%=fno%>"; 
</script> 