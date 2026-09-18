package com.skrozana.controller.admin;

import com.skrozana.dao.PersistentSessionDAO;
import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import com.skrozana.util.TokenService;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private UserDAO userDAO;
    private PersistentSessionDAO sessionDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        sessionDAO = new PersistentSessionDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("rememberMe"));

        User user = userDAO.loginUser(email, password);

        if (user != null && "ADMIN".equals(user.getRole())) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", user);
            session.setAttribute("user", user); // Fallback logic matching filter criteria code checks

            if (rememberMe) {
                String selector = UUID.randomUUID().toString();
                String rawToken = TokenService.generateRandomToken();
                String deviceInfo = request.getHeader("User-Agent");
                
                sessionDAO.saveSession(user.getId(), "ADMIN", selector, rawToken, deviceInfo, 30);
                
                Cookie cookie = new Cookie("admin_remember", selector + ":" + rawToken);
                cookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
                cookie.setHttpOnly(true);
                cookie.setPath("/admin/");
                response.addCookie(cookie);
            }

            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("errorMsg", "Access Denied: Invalid Admin Credentials!");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
