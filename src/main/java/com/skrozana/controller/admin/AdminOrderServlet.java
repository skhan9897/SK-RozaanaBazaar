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

@WebServlet("/admin/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {
    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";

        if ("updateStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            orderDAO.updateOrderStatus(id, status);
            String statusFilter = request.getParameter("statusFilter");
            if (statusFilter != null && !statusFilter.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/AdminOrderServlet?action=list&status=" + statusFilter);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/AdminOrderServlet?action=list");
            }
        } else if ("details".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = orderDAO.getOrderById(id);
            request.setAttribute("order", order);
            request.getRequestDispatcher("/admin/orders/order-details.jsp").forward(request, response);
        } else {
            String statusFilter = request.getParameter("status");
            List<Order> orders;
            if (statusFilter != null && !statusFilter.isEmpty() && !"All".equalsIgnoreCase(statusFilter)) {
                orders = orderDAO.getOrdersByStatus(statusFilter);
            } else {
                orders = orderDAO.getAllOrders();
            }
            request.setAttribute("orders", orders);
            request.setAttribute("currentStatus", statusFilter != null ? statusFilter : "All");
            request.getRequestDispatcher("/admin/orders/order-list.jsp").forward(request, response);
        }
    }
}
