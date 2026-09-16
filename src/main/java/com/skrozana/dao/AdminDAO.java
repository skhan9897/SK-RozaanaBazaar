package com.skrozana.dao;

import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class AdminDAO {
    
    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        // Optimized: Combined summary query to reduce DB round-trips
        String sql = "SELECT " +
                     "(SELECT COUNT(*) FROM users WHERE role = 'CUSTOMER') as totalUsers, " +
                     "(SELECT COUNT(*) FROM products) as totalProducts, " +
                     "(SELECT COUNT(*) FROM orders) as totalOrders, " +
                     "(SELECT IFNULL(SUM(total_amount), 0) FROM orders WHERE payment_status = 'Paid' OR order_status != 'Cancelled') as totalRevenue, " +
                     "(SELECT COUNT(*) FROM orders WHERE DATE(created_at) = CURDATE()) as todayOrders, " +
                     "(SELECT IFNULL(SUM(total_amount), 0) FROM orders WHERE DATE(created_at) = CURDATE() AND order_status != 'Cancelled') as todayRevenue, " +
                     "(SELECT COUNT(*) FROM products WHERE stock < 10) as lowStock, " +
                     "(SELECT COUNT(*) FROM orders WHERE order_status IN ('Pending', 'Placed')) as pendingOrders, " +
                     "(SELECT COUNT(*) FROM orders WHERE order_status = 'Delivered') as deliveredOrders";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }
}
