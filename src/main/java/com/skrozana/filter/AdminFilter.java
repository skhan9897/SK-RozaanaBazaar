package com.skrozana.filter;

import com.skrozana.model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        String requestURI = req.getRequestURI();
        
        // Allow access to login.jsp and AdminLoginServlet inside /admin without filtering
        if (requestURI.endsWith("login.jsp") || requestURI.contains("AdminLoginServlet")) {
            chain.doFilter(request, response);
            return;
        }
        
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        User adminUser = (session != null) ? (User) session.getAttribute("admin") : null;
        
        if ((user != null && "ADMIN".equals(user.getRole())) || adminUser != null) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/admin/login.jsp");
        }
    }

    @Override
    public void destroy() {}
}
