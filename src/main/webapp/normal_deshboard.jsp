<%-- 
    Document   : normal_deshboard
    Created on : Feb 3, 2022, 7:08:57 PM
    Author     : MeGa
--%>

<%@page import="com.mycompany.ecommerce.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are not normal ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is for normal user</h1>
    </body>
</html>
