<%-- 
    Document   : login
    Created on : Feb 2, 2022, 6:56:31 PM
    Author     : MeGa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart - Login</title>

        <%@include file="components/common_css_js.jsp"  %>
        <link rel="stylesheet" href="css/footer.css"/>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-4">
                        <div class="card-header custom-bg text-center text-white">
                            <h3>Login Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include  file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input required name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input required name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a class="text-center d-block mb-2" href="register.jsp">If not registered Click Here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg">Login</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>    
            </div>
        </div>
                            <br><br>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
