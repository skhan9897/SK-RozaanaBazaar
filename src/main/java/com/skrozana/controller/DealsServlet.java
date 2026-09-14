package com.skrozana.controller;

import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DealsServlet")
public class DealsServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Fetch all products to filter deals, or get discounted products
        List<Product> allProducts = productDAO.getAllProducts();
        List<Product> dealProducts = new ArrayList<>();
        
        for (Product p : allProducts) {
            if (p.getDiscount() > 0 && "active".equals(p.getStatus())) {
                dealProducts.add(p);
            }
        }
        
        request.setAttribute("products", dealProducts);
        request.setAttribute("title", "Today's Hot Deals 🔥");
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}
