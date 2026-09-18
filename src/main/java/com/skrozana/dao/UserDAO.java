package com.skrozana.dao;

import com.skrozana.model.User;
import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean registerUser(User user) {
        // Check if email or mobile already exists
        if (isEmailExists(user.getEmail())) {
            System.out.println("Registration failed: Email already registered.");
            return false;
        }
        if (isMobileExists(user.getMobile())) {
            System.out.println("Registration failed: Mobile already registered.");
            return false;
        }

        String sql = "INSERT INTO users (name, email, mobile, password, address, city, state, pincode, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'CUSTOMER', 'ACTIVE')";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("Registration failed: Could not get database connection.");
                return false;
            }
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getMobile());
                ps.setString(4, user.getPassword());
                ps.setString(5, user.getAddress());
                ps.setString(6, user.getCity());
                ps.setString(7, user.getState());
                ps.setString(8, user.getPincode());
                
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error registering user: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    private boolean isEmailExists(String email) {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("Error checking email: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    private boolean isMobileExists(String mobile) {
        String sql = "SELECT id FROM users WHERE mobile = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, mobile);
                ResultSet rs = ps.executeQuery();
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("Error checking mobile: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND UPPER(status) = 'ACTIVE'";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setRole(rs.getString("role"));
                    user.setAddress(rs.getString("address"));
                    user.setCity(rs.getString("city"));
                    user.setState(rs.getString("state"));
                    user.setPincode(rs.getString("pincode"));
                    return user;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during login: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return users;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all users: " + e.getMessage());
            e.printStackTrace();
        }
        return users;
    }

    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, newPassword);
                ps.setInt(2, userId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating password: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setAddress(rs.getString("address"));
                    user.setCity(rs.getString("city"));
                    user.setState(rs.getString("state"));
                    user.setPincode(rs.getString("pincode"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                    return user;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
