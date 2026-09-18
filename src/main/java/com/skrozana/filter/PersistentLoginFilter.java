package com.skrozana.filter;

import com.skrozana.dao.PersistentSessionDAO;
import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import com.skrozana.util.TokenService;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class PersistentLoginFilter implements Filter {

    private PersistentSessionDAO sessionDAO;
    private UserDAO userDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        sessionDAO = new PersistentSessionDAO();
        userDAO = new UserDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();

        User user = (User) session.getAttribute("user");
        User admin = (User) session.getAttribute("admin");

        if (user == null) {
            checkAndRestoreSession(httpRequest, httpResponse, "remember_me", "user");
        }

        if (admin == null) {
            checkAndRestoreSession(httpRequest, httpResponse, "admin_remember", "admin");
        }

        chain.doFilter(request, response);
    }

    private void checkAndRestoreSession(HttpServletRequest request, HttpServletResponse response, String cookieName, String sessionAttr) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (value.contains(":")) {
                        String[] parts = value.split(":");
                        String selector = parts[0];
                        String rawToken = parts[1];

                        Integer userId = sessionDAO.validateSession(selector, rawToken);
                        if (userId != null) {
                            User restoredUser = userDAO.getUserById(userId);
                            if (restoredUser != null && "active".equals(restoredUser.getStatus())) {
                                request.getSession().setAttribute(sessionAttr, restoredUser);
                                if ("user".equals(sessionAttr)) {
                                    request.getSession().setAttribute("user", restoredUser);
                                }

                                // Token Rotation
                                String newRawToken = TokenService.generateRandomToken();
                                sessionDAO.rotateToken(selector, newRawToken);
                                
                                Cookie newCookie = new Cookie(cookieName, selector + ":" + newRawToken);
                                newCookie.setMaxAge(30 * 24 * 60 * 60);
                                newCookie.setHttpOnly(true);
                                newCookie.setPath(cookieName.equals("admin_remember") ? "/admin/" : "/");
                                response.addCookie(newCookie);
                            } else {
                                // Invalid user or inactive account
                                sessionDAO.revokeSession(selector);
                                clearCookie(response, cookieName);
                            }
                        } else {
                            // Invalid or expired token
                            clearCookie(response, cookieName);
                        }
                    }
                    break;
                }
            }
        }
    }

    private void clearCookie(HttpServletResponse response, String cookieName) {
        Cookie cookie = new Cookie(cookieName, "");
        cookie.setMaxAge(0);
        cookie.setPath(cookieName.equals("admin_remember") ? "/admin/" : "/");
        response.addCookie(cookie);
    }

    @Override
    public void destroy() {}
}
