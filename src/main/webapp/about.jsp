<%-- 
    Document   : about
    Created on : Feb 1, 2022, 3:45:52 PM
    Author     : MeGa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycard - About</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/about.css"/>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>
        <div class="wrapper">

            <div class="background-container">
                <div class="bg-1"></div>
                <div class="bg-2"></div>

            </div>
            <div class="about-container">

                <div class="image-container">
                    <img src="img/computer.jpg" alt="">

                </div>

                <div class="text-container">
                    <h1>About us</h1>
                    <p>My name is Raja Jetinder Kumar and I am from Umerkot, Sindh, Pakistan <br>I am currently studing in Mehran University of Engineering and Jamshoro in Computer System Department in Final Year. <br>I am currently working on Java Programming and Web Development.</p>
                    <a href="https://www.linkedin.com/in/jatender-khatri/">Read More</a>
                </div>

            </div>
        </div>
    </body>
</html>
