<%@page import="Shop.itemDAO"%>
<%@page import="Shop.itemDTO"%>
<%@page import="Shop.cartDAO"%>
<%@page import="Shop.cartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource"%>
    

<%
//상품 번호를 가져옵니다.
int no = Integer.parseInt(request.getParameter("no"));
HttpSession Session = request.getSession();

// CartDAO 인스턴스를 가져와서 장바구니에 상품을 추가합니다.
cartDAO dao = cartDAO.getInstance();
dao.addToCart(no, Session);

// 장바구니 페이지 또는 이전 페이지로 리디렉션합니다.
response.sendRedirect("cartList.jsp");
%>
    
