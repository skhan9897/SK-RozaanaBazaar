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

@WebServlet("/admin/AdminSettingsServlet")
public class AdminSettingsServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "profile";

        if ("changePassword".equals(action)) {
            request.getRequestDispatcher("/admin/settings/change-password.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/admin/settings/profile.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("changePassword".equals(action)) {
            handlePasswordChange(request, response);
        }
    }

    private void handlePasswordChange(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");
        
        if (admin == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPass = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        // Simple validation
        if (!newPass.equals(confirmPass)) {
            request.setAttribute("errorMsg", "New passwords do not match!");
            request.getRequestDispatcher("settings/change-password.jsp").forward(request, response);
            return;
        }

        // Verification from database
        User dbUser = userDAO.loginUser(admin.getEmail(), currentPass);
        if (dbUser != null) {
            if (userDAO.updatePassword(admin.getId(), newPass)) {
                request.setAttribute("successMsg", "Password updated successfully! Please login again with new credentials.");
                // Optionally logout after password change
                session.invalidate();
                request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Database error! Could not update password.");
                request.getRequestDispatcher("settings/change-password.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMsg", "Current password (website-generated) is incorrect!");
            request.getRequestDispatcher("settings/change-password.jsp").forward(request, response);
        }
    }
}
