package com.skrozana.controller;

import com.skrozana.dao.CategoryDAO;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Category;
import com.skrozana.model.Product;
import com.skrozana.model.Subcategory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String catIdStr = request.getParameter("id");
        String subCatIdStr = request.getParameter("subId");
        
        if (catIdStr == null) {
            // List all main categories
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("category.jsp").forward(request, response);
        } else if (subCatIdStr != null) {
            // List products in this subcategory
            int subCatId = Integer.parseInt(subCatIdStr);
            List<Product> products = productDAO.getProductsBySubcategory(subCatId);
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } else {
            // List subcategories and products in this category
            int catId = Integer.parseInt(catIdStr);
            Category category = categoryDAO.getCategoryById(catId);
            List<Subcategory> subcategories = categoryDAO.getSubCategories(catId);
            List<Product> products = productDAO.getProductsByCategory(catId);
            
            request.setAttribute("category", category);
            request.setAttribute("subcategories", subcategories);
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }
}
