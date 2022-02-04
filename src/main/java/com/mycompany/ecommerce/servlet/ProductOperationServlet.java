/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ecommerce.servlet;

import com.mycompany.ecommerce.dao.CategoryDao;
import com.mycompany.ecommerce.dao.ProductDao;
import com.mycompany.ecommerce.helper.FactoryProvider;
import com.mycompany.ecommerce.model.Category;
import com.mycompany.ecommerce.model.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author MeGa
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
//               add Category
                String cTitle = request.getParameter("category_name");
                String cDescrition = request.getParameter("category_description");
                Category category = new Category();
                category.setCategoryName(cTitle);
                category.setCategoryDescription(cDescrition);

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                Integer cId = categoryDao.saveCategory(category);
                HttpSession session = request.getSession();
                session.setAttribute("message", "Category Added Successfully");
                response.sendRedirect("admin_deshboard.jsp");
                return;

            } else if (op.trim().equals("addProduct")) {
//               add product
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                Integer pPrice = Integer.parseInt(request.getParameter("pPrice"));
                Integer pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                Integer pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                Integer catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpDiscount(pDiscount);
                p.setpPrice(pPrice);
                p.setpQuantity(pQuantity);
                p.setpPic(part.getSubmittedFileName());

                // get category by id
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                Category c = categoryDao.getCategoryById(catId);
                p.setCategory(c);

                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

                productDao.saveProduct(p);
                //                pic upload
//                find out the path to upload photo
                try {
                    String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                    System.out.println("Path Location : " + path);
                    FileOutputStream fo = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fo.write(data);
                    fo.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("Error : " + e.getMessage());
                }

                HttpSession session = request.getSession();
                session.setAttribute("message", "Product Added Successfully");
                response.sendRedirect("admin_deshboard.jsp");
                return;

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
