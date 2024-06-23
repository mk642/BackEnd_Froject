<%@page import="Shop.LoginnDAO"%>
<%@page import="Shop.LoginnDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	
 	request.setCharacterEncoding("utf-8");
	int price = Integer.valueOf(request.getParameter("price"));
	LoginnDAO dao = new LoginnDAO();
 	String email = (String)session.getAttribute("email");
	LoginnDTO dto = dao.selectOne(email);
	dao.buy(dto, price);
	

 
%>
<%session.removeAttribute("cartList"); %>
<script>
	alert("구매 완료되었습니다!");
	
	location.href="../login/main.jsp";
</script>