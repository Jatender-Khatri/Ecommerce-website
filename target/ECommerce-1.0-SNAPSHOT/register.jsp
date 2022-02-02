<%-- 
    Document   : register
    Created on : Feb 1, 2022, 6:56:23 PM
    Author     : MeGa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart - Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <%@include  file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/signupphoto.png" style="max-height: 100px" class="img-fluid" alt="alt"/>
                            </div>
                            <h3 class="text-center">Sign up here !!</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Username</label>
                                    <input name="user_name" required type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" required type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" required type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" required type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" required style="height: 200px" class="form-control" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
