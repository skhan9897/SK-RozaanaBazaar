package com.skrozana.controller.admin;

import com.skrozana.dao.CategoryDAO;
import com.skrozana.model.Category;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/AdminCategoryServlet")
public class AdminCategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                listCategories(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            default:
                listCategories(request, response);
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategoriesAdmin();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/categories/category-list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Category> parentCategories = categoryDAO.getAllCategories();
        request.setAttribute("parents", parentCategories);
        request.getRequestDispatcher("/admin/categories/add-category.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryDAO.getCategoryById(id);
        List<Category> parentCategories = categoryDAO.getAllCategories();
        
        request.setAttribute("category", category);
        request.setAttribute("parents", parentCategories);
        request.getRequestDispatcher("/admin/categories/edit-category.jsp").forward(request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (categoryDAO.deleteCategory(id)) {
            response.sendRedirect(request.getContextPath() + "/admin/AdminCategoryServlet?action=list&msg=deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/AdminCategoryServlet?action=list&error=delete_failed");
        }
    }
}
