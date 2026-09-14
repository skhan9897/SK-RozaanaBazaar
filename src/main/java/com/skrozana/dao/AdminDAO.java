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
        try (Connection conn = DBConnection.getConnection()) {
            
            // Total Users
            String sqlUser = "SELECT COUNT(*) FROM users WHERE role = 'CUSTOMER'";
            try (PreparedStatement ps = conn.prepareStatement(sqlUser)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("totalUsers", rs.getInt(1));
            }
            
            // Total Products
            String sqlProd = "SELECT COUNT(*) FROM products";
            try (PreparedStatement ps = conn.prepareStatement(sqlProd)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("totalProducts", rs.getInt(1));
            }
            
            // Total Orders
            String sqlOrder = "SELECT COUNT(*) FROM orders";
            try (PreparedStatement ps = conn.prepareStatement(sqlOrder)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("totalOrders", rs.getInt(1));
            }
            
            // Total Revenue
            String sqlRev = "SELECT SUM(total_amount) FROM orders WHERE payment_status = 'Paid' OR order_status != 'Cancelled'";
            try (PreparedStatement ps = conn.prepareStatement(sqlRev)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("totalRevenue", rs.getDouble(1));
            }

            // Today's Orders
            String sqlTodayOrders = "SELECT COUNT(*) FROM orders WHERE DATE(created_at) = CURDATE()";
            try (PreparedStatement ps = conn.prepareStatement(sqlTodayOrders)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("todayOrders", rs.getInt(1));
            }

            // Today's Revenue
            String sqlTodayRev = "SELECT SUM(total_amount) FROM orders WHERE DATE(created_at) = CURDATE() AND order_status != 'Cancelled'";
            try (PreparedStatement ps = conn.prepareStatement(sqlTodayRev)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("todayRevenue", rs.getDouble(1));
            }

            // Low Stock Items (Stock < 10)
            String sqlLowStock = "SELECT COUNT(*) FROM products WHERE stock < 10";
            try (PreparedStatement ps = conn.prepareStatement(sqlLowStock)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("lowStock", rs.getInt(1));
            }

            // Pending Orders
            String sqlPending = "SELECT COUNT(*) FROM orders WHERE order_status = 'Pending' OR order_status = 'Placed'";
            try (PreparedStatement ps = conn.prepareStatement(sqlPending)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("pendingOrders", rs.getInt(1));
            }

            // Delivered Orders
            String sqlDelivered = "SELECT COUNT(*) FROM orders WHERE order_status = 'Delivered'";
            try (PreparedStatement ps = conn.prepareStatement(sqlDelivered)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) stats.put("deliveredOrders", rs.getInt(1));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }
}
