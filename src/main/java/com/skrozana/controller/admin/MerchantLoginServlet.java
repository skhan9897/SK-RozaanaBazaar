package com.skrozana.controller.admin;

import com.skrozana.dao.MerchantDAO;
import com.skrozana.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/MerchantLoginServlet")
public class MerchantLoginServlet extends HttpServlet {
    private MerchantDAO merchantDAO;

    @Override
    public void init() {
        merchantDAO = new MerchantDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String merchantId = request.getParameter("merchantId");
        String password = request.getParameter("password");

        User user = merchantDAO.loginMerchant(merchantId, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", user);
            session.setAttribute("user", user);
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("errorMsg", "Invalid Merchant ID or Password!");
            request.getRequestDispatcher("merchant-login.jsp").forward(request, response);
        }
    }
}
