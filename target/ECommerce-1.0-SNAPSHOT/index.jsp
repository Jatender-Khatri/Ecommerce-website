<%-- 
    Document   : index
    Created on : Feb 1, 2022, 2:48:54 PM
    Author     : MeGa
--%>

<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart - Home</title>
        
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>Creating Session Factory object</h1>
        <%
            out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
