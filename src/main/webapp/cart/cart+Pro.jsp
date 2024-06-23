<%@page import="Shop.itemDAO"%>
<%@page import="Shop.itemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource"%>

<%
request.setCharacterEncoding("utf-8");

// 상품 정보 가져오기
int no = Integer.parseInt(request.getParameter("no"));


itemDAO dao = new itemDAO(); 
itemDTO dto = new itemDTO();
dao.addToCart(no, session);

// 장바구니 페이지로 리다이렉트
response.sendRedirect("../cart/cartList.jsp");
%>
    
