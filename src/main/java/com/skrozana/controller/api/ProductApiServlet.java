package com.skrozana.controller.api;

import com.google.gson.Gson;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/products")
public class ProductApiServlet extends HttpServlet {
    private ProductDAO productDAO;
    private Gson gson;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        gson = new Gson();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String categoryIdStr = request.getParameter("categoryId");
        List<Product> products;

        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            int categoryId = Integer.parseInt(categoryIdStr);
            products = productDAO.getProductsByCategory(categoryId);
        } else {
            products = productDAO.getAllProducts();
        }

        String jsonResponse = gson.toJson(products);
        out.print(jsonResponse);
        out.flush();
    }
}
