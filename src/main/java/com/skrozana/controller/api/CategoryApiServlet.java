package com.skrozana.controller.api;

import com.google.gson.Gson;
import com.skrozana.dao.CategoryDAO;
import com.skrozana.model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/categories")
public class CategoryApiServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private Gson gson;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
        gson = new Gson();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        List<Category> categories = categoryDAO.getAllCategories();
        
        String jsonResponse = gson.toJson(categories);
        out.print(jsonResponse);
        out.flush();
    }
}
