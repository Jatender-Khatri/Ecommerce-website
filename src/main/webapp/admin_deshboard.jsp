<%-- 
    Document   : admin
    Created on : Feb 3, 2022, 7:08:06 PM
    Author     : MeGa
--%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.ecommerce.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%                               
        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> list = categoryDao.getCategorys();
        
// getting count
        Map<String,Long> map = Helper.getCounts(FactoryProvider.getFactory());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart - Admin</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/style1.css"/>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <!--for message-->
            <div class="container-fluid mt-1">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/team.png" alt="user_icon"/>
                            </div>
                            <h1><%= map.get("countUser") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/list.png" alt="user_icon"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/delivery-box.png" alt="user_icon"/>
                            </div>
                            <h1><%= map.get("countProduct") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/add-to-cart.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/plus.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--add category form-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button style="color: white" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory">
                            <div class="form-group">
                                <input required type="text" name="category_name" class="form-control" placeholder="Enter Category Title">
                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px" required placeholder="Enter Category Description" name="category_description" class="form-control" ></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--close add category form-->

        <!--add product model-->

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="#add-product-model" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button  style="color: white;" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span style="color: white;" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--add form-->
                        <form action="ProductOperationServlet"  method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addProduct">
                            <div class="form-group">
                                <input required type="text" class="form-control" name="pName" placeholder="Enter Title of Product" />
                            </div>
                            <div class="form-group">
                                <textarea style="height: 150px;" required placeholder="Enter Product Description" name="pDesc" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <input required type="number" class="form-control" name="pPrice" placeholder="Enter Price of Product" />
                            </div>
                            <div class="form-group">
                                <input  type="number" class="form-control" name="pDiscount" placeholder="Enter Discount Price of Product if avaiable" />
                            </div>
                            <div class="form-group">
                                <input required type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" />
                            </div>

                            <div class="form-group">
                                <select name="catId" class="form-control">
                                    <option selected disabled>---- Select Product ----</option>
                                    <%
                                        for (Category category : list) {
                                    %>


                                    <option value="<%= category.getCategoryId()%>"><%= category.getCategoryName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label><br>
                                <input type="file" name="pPic" required>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>

                        </form>
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--close add product model-->
        <%@include file="components/common_models.jsp" %>
        
    </body>
</html>
