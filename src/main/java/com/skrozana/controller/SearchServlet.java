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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String query = request.getParameter("q");
        
        if (query == null || query.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<Product> searchResults = productDAO.searchProducts(query);
        
        request.setAttribute("products", searchResults);
        request.setAttribute("searchQuery", query);
        
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
