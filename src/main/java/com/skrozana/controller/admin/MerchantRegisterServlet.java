package com.skrozana.controller.admin;

import com.skrozana.dao.MerchantDAO;
import com.skrozana.model.Merchant;
import com.skrozana.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/MerchantRegisterServlet")
public class MerchantRegisterServlet extends HttpServlet {
    private MerchantDAO merchantDAO;

    @Override
    public void init() {
        merchantDAO = new MerchantDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Extract User Details
        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setMobile(request.getParameter("mobile"));
        
        // Extract Merchant Details
        Merchant merchant = new Merchant();
        merchant.setBusinessName(request.getParameter("businessName"));
        merchant.setBusinessType(request.getParameter("businessType"));
        merchant.setPanNumber(request.getParameter("pan"));
        merchant.setGstin(request.getParameter("gstin"));
        merchant.setBusinessAddress(request.getParameter("address"));
        merchant.setTermsAccepted(request.getParameter("terms") != null);
        
        String result = merchantDAO.registerMerchant(user, merchant);
        
        if (result != null) {
            if ("EXISTS".equals(result)) {
                request.setAttribute("errorMsg", "This email is already registered as a merchant. Please Login.");
                request.getRequestDispatcher("merchant-register.jsp").forward(request, response);
            } else {
                String[] parts = result.split("\\|");
                request.setAttribute("merchantId", parts[0]);
                request.setAttribute("password", parts[1]);
                request.getRequestDispatcher("merchant-success.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMsg", "Registration Failed! Please try again.");
            request.getRequestDispatcher("merchant-register.jsp").forward(request, response);
        }
    }
}
