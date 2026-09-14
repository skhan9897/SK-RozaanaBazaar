package com.skrozana.controller;

import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Product product = productDAO.getProductById(id);
                if (product != null) {
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("product-details.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        // Fallback to home if product not found
        response.sendRedirect("index");
    }
}
