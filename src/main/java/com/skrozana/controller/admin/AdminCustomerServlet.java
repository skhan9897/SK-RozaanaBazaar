package com.skrozana.controller.admin;

import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/AdminCustomerServlet")
public class AdminCustomerServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        if ("details".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            User user = userDAO.getUserById(id);
            request.setAttribute("customer", user);
            request.getRequestDispatcher("/admin/customers/customer-details.jsp").forward(request, response);
        } else {
            List<User> customers = userDAO.getAllUsers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("/admin/customers/customer-list.jsp").forward(request, response);
        }
    }
}
