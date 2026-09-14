package com.skrozana.dao;

import com.skrozana.model.Merchant;
import com.skrozana.model.User;
import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

public class MerchantDAO {

    public String registerMerchant(User user, Merchant merchant) throws Exception {
        // Check if email or mobile already exists
        String checkSql = "SELECT id FROM users WHERE email = ? OR mobile = ?";
        
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) throw new Exception("Database connection failed!");

            try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
                psCheck.setString(1, user.getEmail());
                psCheck.setString(2, user.getMobile());
                ResultSet rsCheck = psCheck.executeQuery();
                if (rsCheck.next()) {
                    return "EXISTS"; 
                }
            }

            conn.setAutoCommit(false);
            
            // Fixed column count to match DB structure
            String userSql = "INSERT INTO users (name, email, mobile, password, address, city, state, pincode, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'ADMIN', 'ACTIVE')";
            String merchantSql = "INSERT INTO merchants (user_id, merchant_id, business_name, business_type, pan_number, gstin, business_address, terms_accepted, verification_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'ACTIVE')";

            String merchantId = "SKR-MER-" + (1000 + new Random().nextInt(9000));
            String initialPassword = generateRandomPassword();
            
            try (PreparedStatement psUser = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS)) {
                psUser.setString(1, user.getName());
                psUser.setString(2, user.getEmail());
                psUser.setString(3, user.getMobile());
                psUser.setString(4, initialPassword);
                psUser.setString(5, merchant.getBusinessAddress()); 
                psUser.setString(6, "N/A"); 
                psUser.setString(7, "N/A"); 
                psUser.setString(8, "000000"); 
                
                psUser.executeUpdate();
                ResultSet rs = psUser.getGeneratedKeys();
                
                if (rs.next()) {
                    int userId = rs.getInt(1);
                    
                    try (PreparedStatement psMerch = conn.prepareStatement(merchantSql)) {
                        psMerch.setInt(1, userId);
                        psMerch.setString(2, merchantId);
                        psMerch.setString(3, merchant.getBusinessName());
                        psMerch.setString(4, merchant.getBusinessType());
                        psMerch.setString(5, merchant.getPanNumber());
                        psMerch.setString(6, merchant.getGstin());
                        psMerch.setString(7, merchant.getBusinessAddress());
                        psMerch.setBoolean(8, merchant.isTermsAccepted());
                        
                        psMerch.executeUpdate();
                    }
                    
                    conn.commit();
                    return merchantId + "|" + initialPassword;
                }
            }
        } catch (Exception e) {
            if (conn != null) conn.rollback();
            throw e; // Re-throw to catch in Servlet
        } finally {
            if (conn != null) conn.close();
        }
        return null;
    }

    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 8; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }
    
    public User loginMerchant(String merchantId, String password) {
        String sql = "SELECT u.* FROM users u JOIN merchants m ON u.id = m.user_id WHERE m.merchant_id = ? AND u.password = ? AND u.role = 'ADMIN'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, merchantId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
