package com.skrozana.controller;

import com.skrozana.dao.CartDAO;
import com.skrozana.dao.OrderDAO;
import com.skrozana.model.Cart;
import com.skrozana.model.Order;
import com.skrozana.model.OrderItem;
import com.skrozana.model.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private CartDAO cartDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        orderDAO = new OrderDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        List<Cart> cartItems = cartDAO.getCartByUser(user.getId());
        if (cartItems.isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        double totalAmount = 0;
        List<OrderItem> orderItems = new ArrayList<>();
        for (Cart cartItem : cartItems) {
            totalAmount += cartItem.getPrice() * cartItem.getQuantity();
            
            OrderItem orderItem = new OrderItem();
            orderItem.setProductId(cartItem.getProductId());
            orderItem.setProductName(cartItem.getProductName());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPrice(cartItem.getPrice());
            orderItem.setSubtotal(cartItem.getPrice() * cartItem.getQuantity());
            orderItems.add(orderItem);
        }

        Order order = new Order();
        order.setUserId(user.getId());
        order.setOrderNumber(UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        order.setTotalAmount(totalAmount);
        order.setShippingAddress(address);
        order.setPaymentMethod(paymentMethod);
        order.setPaymentStatus("Pending");
        order.setOrderStatus("Placed");

        int orderId = orderDAO.placeOrder(order, orderItems);

        if (orderId > 0) {
            request.setAttribute("orderNumber", order.getOrderNumber());
            request.getRequestDispatcher("order-success.jsp").forward(request, response);
        } else {
            response.sendRedirect("checkout.jsp?error=failed");
        }
    }
}
