<%@page import="Shop.Paging"%>
<%@page import="Shop.boardDAO"%>
<%@page import="Shop.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
    
<%
    request.setCharacterEncoding("utf-8");

    	int no = Integer.parseInt(request.getParameter("no"));
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
		
    	boardDTO dto = new boardDTO(title,content,no);
    	boardDAO dao = new boardDAO();
    	dao.updateBoard(dto);

    	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
    	
    	//4. SQL 실행
    %>

	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='board.jsp';
		}
	</script>



