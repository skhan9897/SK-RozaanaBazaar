package com.skrozana.controller.admin;

import com.skrozana.dao.OrderDAO;
import com.skrozana.model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/AdminPaymentServlet")
public class AdminPaymentServlet extends HttpServlet {
    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        if ("list".equals(action) || "success".equals(action) || "pending".equals(action) || "failed".equals(action)) {
            List<Order> orders = orderDAO.getAllOrders();
            // In a real app, we might filter by payment status here.
            // For now, we'll pass all orders to the list.
            request.setAttribute("payments", orders);
            request.getRequestDispatcher("/admin/payments/payment-list.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        }
    }
}
