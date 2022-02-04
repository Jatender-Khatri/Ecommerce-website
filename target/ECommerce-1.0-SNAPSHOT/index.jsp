<%-- 
    Document   : index
    Created on : Feb 1, 2022, 2:48:54 PM
    Author     : MeGa
--%>

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
        <div class="row mt-3">
            <% 
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                List<Product> pList = productDao.getAllProducts();
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> cList = categoryDao.getCategorys();
            %>
            <!--show category-->
            <div class="col-md-2 mx-2">
                <h1>Number of Category is  <%= cList.size() %></h1>
                <% 
                    for (Category category : cList) {
                            out.println(category.getCategoryName() + "<br>");
                        }
                %>
            </div>
            <!--show product-->
            <div class="col-md-8">
                <h1>Number of the Product is <%= pList.size() %></h1>
                <% 
                    for (Product product : pList) {
                            out.println(product.getpPic() + "<br>");
                            out.println(product.getpName() + "<br><br>");
                        }
                %>
            </div>
        </div>
    </body>
</html>
