package com.skrozana.controller;

import com.skrozana.dao.ProductDAO;
import com.skrozana.dao.ProductImageDAO;
import com.skrozana.model.Product;
import com.skrozana.model.ProductImage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {
    private ProductDAO productDAO;
    private ProductImageDAO productImageDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        productImageDAO = new ProductImageDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Product product = productDAO.getProductById(id);
                if (product != null) {
                    List<ProductImage> gallery = productImageDAO.getImagesByProductId(id);
                    List<ProductImage> images360 = productImageDAO.get360Images(id);
                    
                    request.setAttribute("product", product);
                    request.setAttribute("gallery", gallery);
                    request.setAttribute("images360", images360);
                    
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
