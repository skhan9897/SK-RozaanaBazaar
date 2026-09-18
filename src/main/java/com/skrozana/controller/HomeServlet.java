package com.skrozana.controller;

import com.skrozana.dao.CategoryDAO;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Category;
import com.skrozana.model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/index", "/home", "", "/HomeServlet"})
public class HomeServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Fetch all main categories for the homepage
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        // Fetch products for Today's Deals (Optimized with LIMIT)
        List<Product> products = productDAO.getAllProducts(0, 24);
        
        // Auto-seed if empty
        if (products.isEmpty()) {
            com.skrozana.util.DatabaseSeeder.main(null);
            products = productDAO.getAllProducts(0, 24);
        }
        
        request.setAttribute("products", products);
        
        // Forward to index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
