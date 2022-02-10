<%-- 
    Document   : index
    Created on : Feb 1, 2022, 2:48:54 PM
    Author     : MeGa
--%>

<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="com.mycompany.ecommerce.model.Category"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.dao.ProductDao"%>
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
        <div class="container-fluid">
            <div class="row mt-3">
                <%                    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

                    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> cList = categoryDao.getCategorys();
                    Helper h = new Helper();
                    String cat = request.getParameter("category");

                    List<Product> pList = null;
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        pList = productDao.getAllProducts();
                    } else {
                        Integer cid = Integer.parseInt(cat.trim());
                        pList = productDao.getAllProductById(cid);
                    }
                %>
                <!--show category-->
                <div class="col-md-2 mx-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>


                        <%
                            for (Category category : cList) {
                        %>
                        <a href="index.jsp?category=<%= category.getCategoryId()%>" class="list-group-item list-group-item-action"><%= category.getCategoryName()%></a>
                        <%
                            }

                        %>
                    </div>
                </div>
                <!--show product-->
                <div class="col-md-9">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%                                    for (Product p : pList) {
                                %>
                                <div class="card product-cart">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPic()%>" style="max-height: 140px; min-width: 100%; width: auto;" class="card-img-top m-2" alt="..."/>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text"><%= h.get15Words(p.getpDesc())%></p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)">Cart</button>
                                        <button class="btn btn-outline-primary">&#8360; <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8360; <%= p.getpPrice()%> </span> <span class="text-secondary price-discount-label"><%= p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>
                                <%
                                    }
                                    if (pList.size() == 0) {
                                        out.println("<div class = 'container text center'><h1>No items in this Category</h1></div>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include  file="components/common_models.jsp" %>
    </body>
</html>
