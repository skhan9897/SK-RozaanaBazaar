package com.skrozana.dao;

import com.skrozana.util.DBConnection;
import com.skrozana.util.TokenService;
import java.sql.*;
import java.util.Calendar;

public class PersistentSessionDAO {

    public void saveSession(int userId, String userType, String selector, String rawToken, String deviceInfo, int days) {
        String tokenHash = TokenService.hashToken(rawToken);
        
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, days);
        Timestamp expiresAt = new Timestamp(cal.getTimeInMillis());

        String sql = "INSERT INTO persistent_sessions (user_id, user_type, selector, token_hash, device_info, expires_at) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ps.setString(2, userType);
            ps.setString(3, selector);
            ps.setString(4, tokenHash);
            ps.setString(5, deviceInfo);
            ps.setTimestamp(6, expiresAt);
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Integer validateSession(String selector, String rawToken) {
        String sql = "SELECT user_id, token_hash, expires_at FROM persistent_sessions WHERE selector = ? AND revoked = FALSE";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, selector);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String hashedToken = rs.getString("token_hash");
                Timestamp expiresAt = rs.getTimestamp("expires_at");
                
                if (expiresAt.after(new Timestamp(System.currentTimeMillis())) && TokenService.verifyToken(rawToken, hashedToken)) {
                    return rs.getInt("user_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void rotateToken(String selector, String newRawToken) {
        String newTokenHash = TokenService.hashToken(newRawToken);
        String sql = "UPDATE persistent_sessions SET token_hash = ?, last_used_at = CURRENT_TIMESTAMP WHERE selector = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, newTokenHash);
            ps.setString(2, selector);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void revokeSession(String selector) {
        String sql = "UPDATE persistent_sessions SET revoked = TRUE WHERE selector = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, selector);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void revokeAllSessions(int userId) {
        String sql = "UPDATE persistent_sessions SET revoked = TRUE WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
