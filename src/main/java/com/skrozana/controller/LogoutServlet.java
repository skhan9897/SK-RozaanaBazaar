package com.skrozana.controller;

import com.skrozana.dao.PersistentSessionDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Handle Persistent Session Revocation
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("remember_me".equals(cookie.getName()) || "admin_remember".equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (value.contains(":")) {
                        String selector = value.split(":")[0];
                        new PersistentSessionDAO().revokeSession(selector);
                    }
                    
                    Cookie clearCookie = new Cookie(cookie.getName(), "");
                    clearCookie.setMaxAge(0);
                    clearCookie.setPath(cookie.getName().equals("admin_remember") ? "/admin/" : "/");
                    response.addCookie(clearCookie);
                }
            }
        }

        HttpSession session = request.getSession();
        session.invalidate();
        
        response.sendRedirect("login.jsp");
    }
}
