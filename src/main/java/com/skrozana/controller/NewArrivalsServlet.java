package com.skrozana.controller;

import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewArrivalsServlet")
public class NewArrivalsServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Fetch all active products
        List<Product> products = productDAO.getAllProducts();
        
        request.setAttribute("products", products);
        request.setAttribute("title", "New Arrivals ✨");
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}
