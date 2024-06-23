<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();

%>
<script>
	alert("포인트가 부족합니다 ! ! !");
	location.href=".cartList.jsp";
</script>