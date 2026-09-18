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
        
        // Handle Pagination & Sorting
        int page = 1;
        int pageSize = 20;
        try {
            if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
            if (request.getParameter("size") != null) pageSize = Integer.parseInt(request.getParameter("size"));
        } catch (NumberFormatException e) {}

        String sortBy = request.getParameter("sort");
        int offset = (page - 1) * pageSize;

        // Fetch all main categories
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        // Fetch products with pagination & sorting
        List<Product> products = productDAO.getAllProducts(offset, pageSize, sortBy);
        
        // Auto-seed if database is empty or has very few products
        if (products.isEmpty() && page == 1) {
            try {
                System.out.println(">>> HomeServlet: Catalog check triggered DatabaseSeeder...");
                com.skrozana.util.DatabaseSeeder.seedDatabase();
                
                categories = categoryDAO.getAllCategories();
                products = productDAO.getAllProducts(0, pageSize, sortBy);
                
                request.setAttribute("categories", categories);
            } catch (Exception e) {
                System.err.println(">>> HomeServlet Error: Seeding failed: " + e.getMessage());
            }
        }

        // AJAX Support for "Load More"
        if ("true".equals(request.getParameter("ajax"))) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            com.google.gson.Gson gson = new com.google.gson.Gson();
            response.getWriter().write(gson.toJson(products));
            return;
        }

        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("currentSort", sortBy);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
