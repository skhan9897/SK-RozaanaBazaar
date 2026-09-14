package com.skrozana.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/AdminCouponServlet")
public class AdminCouponServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
            case "expired":
                request.getRequestDispatcher("/admin/coupons/coupon-list.jsp").forward(request, response);
                break;
            case "add":
            case "edit":
                request.getRequestDispatcher("/admin/coupons/add-coupon.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/admin/coupons/coupon-list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
