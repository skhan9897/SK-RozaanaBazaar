package com.skrozana.dao;

import com.skrozana.model.Order;
import com.skrozana.model.OrderItem;
import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    
    public int placeOrder(Order order, List<OrderItem> items) {
        String orderSql = "INSERT INTO orders (user_id, order_number, total_amount, shipping_address, payment_method, payment_status, order_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String itemSql = "INSERT INTO order_items (order_id, product_id, product_name, quantity, price, subtotal) VALUES (?, ?, ?, ?, ?, ?)";
        
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.err.println("Error placing order: Connection is null");
                return 0;
            }
            conn.setAutoCommit(false);
            
            try (PreparedStatement ps = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, order.getUserId());
                ps.setString(2, order.getOrderNumber());
                ps.setDouble(3, order.getTotalAmount());
                ps.setString(4, order.getShippingAddress());
                ps.setString(5, order.getPaymentMethod());
                ps.setString(6, order.getPaymentStatus());
                ps.setString(7, order.getOrderStatus());
                
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int orderId = rs.getInt(1);
                    
                    try (PreparedStatement psItem = conn.prepareStatement(itemSql)) {
                        for (OrderItem item : items) {
                            psItem.setInt(1, orderId);
                            psItem.setInt(2, item.getProductId());
                            psItem.setString(3, item.getProductName());
                            psItem.setInt(4, item.getQuantity());
                            psItem.setDouble(5, item.getPrice());
                            psItem.setDouble(6, item.getSubtotal());
                            psItem.addBatch();
                            
                            // Update stock
                            String updateStockSql = "UPDATE products SET stock = stock - ? WHERE id = ?";
                            try (PreparedStatement psStock = conn.prepareStatement(updateStockSql)) {
                                psStock.setInt(1, item.getQuantity());
                                psStock.setInt(2, item.getProductId());
                                psStock.executeUpdate();
                            }
                        }
                        psItem.executeBatch();
                    }
                    
                    // Clear cart for user
                    String clearCartSql = "DELETE FROM cart WHERE user_id = ?";
                    try (PreparedStatement psClear = conn.prepareStatement(clearCartSql)) {
                        psClear.setInt(1, order.getUserId());
                        psClear.executeUpdate();
                    }
                    
                    conn.commit();
                    return orderId;
                }
            }
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            System.err.println("Error placing order: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
        return 0;
    }

    public List<Order> getOrdersByUser(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return orders;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setOrderNumber(rs.getString("order_number"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setPaymentStatus(rs.getString("payment_status"));
                    order.setOrderStatus(rs.getString("order_status"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching orders for user: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return orders;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setOrderNumber(rs.getString("order_number"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setPaymentStatus(rs.getString("payment_status"));
                    order.setOrderStatus(rs.getString("order_status"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all orders: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE UPPER(order_status) = ? ORDER BY created_at DESC";
        if ("Pending".equalsIgnoreCase(status)) {
            sql = "SELECT * FROM orders WHERE (UPPER(order_status) = ? OR UPPER(order_status) = 'PLACED') ORDER BY created_at DESC";
        }
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return orders;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, status.toUpperCase());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setOrderNumber(rs.getString("order_number"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setPaymentStatus(rs.getString("payment_status"));
                    order.setOrderStatus(rs.getString("order_status"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching orders by status: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }

    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET order_status = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, status);
                ps.setInt(2, orderId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating order status: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public Order getOrderById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setOrderNumber(rs.getString("order_number"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setPaymentStatus(rs.getString("payment_status"));
                    order.setOrderStatus(rs.getString("order_status"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                    return order;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching order by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public java.util.Map<String, Integer> getOrdersByState() {
        java.util.Map<String, Integer> stateData = new java.util.HashMap<>();
        String sql = "SELECT u.state, COUNT(o.id) as count FROM orders o JOIN users u ON o.user_id = u.id GROUP BY u.state";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return stateData;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String state = rs.getString("state");
                    if (state != null && !state.isEmpty()) {
                        stateData.put(state, rs.getInt("count"));
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching orders by state: " + e.getMessage());
            e.printStackTrace();
        }
        return stateData;
    }
}
