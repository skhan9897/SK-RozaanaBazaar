package com.skrozana.dao;

import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AdminDAO {
    
    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        // Optimized: Combined summary query to reduce DB round-trips
        String sql = "SELECT " +
                     "(SELECT COUNT(*) FROM users WHERE UPPER(role) = 'CUSTOMER') as totalUsers, " +
                     "(SELECT COUNT(*) FROM products) as totalProducts, " +
                     "(SELECT COUNT(*) FROM orders) as totalOrders, " +
                     "(SELECT IFNULL(SUM(total_amount), 0) FROM orders WHERE UPPER(payment_status) = 'PAID' OR UPPER(order_status) != 'CANCELLED') as totalRevenue, " +
                     "(SELECT COUNT(*) FROM orders WHERE DATE(created_at) = CURDATE()) as todayOrders, " +
                     "(SELECT IFNULL(SUM(total_amount), 0) FROM orders WHERE DATE(created_at) = CURDATE() AND UPPER(order_status) != 'CANCELLED') as todayRevenue, " +
                     "(SELECT COUNT(*) FROM products WHERE stock < 10) as lowStock, " +
                     "(SELECT COUNT(*) FROM orders WHERE UPPER(order_status) IN ('PENDING', 'PLACED')) as pendingOrders, " +
                     "(SELECT COUNT(*) FROM orders WHERE UPPER(order_status) = 'DELIVERED') as deliveredOrders";

        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return stats;
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                
                if (rs.next()) {
                    stats.put("totalUsers", rs.getInt("totalUsers"));
                    stats.put("totalProducts", rs.getInt("totalProducts"));
                    stats.put("totalOrders", rs.getInt("totalOrders"));
                    stats.put("totalRevenue", rs.getDouble("totalRevenue"));
                    stats.put("todayOrders", rs.getInt("todayOrders"));
                    stats.put("todayRevenue", rs.getDouble("todayRevenue"));
                    stats.put("lowStock", rs.getInt("lowStock"));
                    stats.put("pendingOrders", rs.getInt("pendingOrders"));
                    stats.put("deliveredOrders", rs.getInt("deliveredOrders"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching dashboard stats: " + e.getMessage());
            e.printStackTrace();
        }
        return stats;
    }
}
