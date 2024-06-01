<!--
	작성자 : manki
	작성일 : 2024. 5. 28.
	기능 : 
-->
<%@page import="Shop.LoginnDAO"%>
<%@page import="Shop.LoginnDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import ="java.sql.*, javax.naming.*, javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	

<%
request.setCharacterEncoding("utf-8");

String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

LoginnDTO dto = new LoginnDTO(email, pwd);
	
LoginnDAO dao = new LoginnDAO();
dao.validateUser(dto);
    if (dao.validateUser(dto)) {
    	String name = dao.userName(dto);
        session.setAttribute("name", name);
        response.sendRedirect("main.jsp");
        
    } else {
%>	
        <script type="text/javascript">
       
            if (confirm("존재하지 않는 사용자입니다. 등록하시겠습니까?") == true) {
                location.href = 'signup.jsp';
             
            } else {
                history.back();
            }
        </script>
<%
    }
%>

</body>
</html>