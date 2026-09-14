package com.skrozana.controller.admin;

import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null && "ADMIN".equals(user.getRole())) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", user);
            session.setAttribute("user", user); // Fallback logic matching filter criteria code checks
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("errorMsg", "Access Denied: Invalid Admin Credentials!");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
