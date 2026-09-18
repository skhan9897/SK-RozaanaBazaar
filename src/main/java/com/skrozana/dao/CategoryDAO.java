package com.skrozana.dao;

import com.skrozana.model.Category;
import com.skrozana.model.Subcategory;
import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    
    private void extractCategory(ResultSet rs, Category cat) throws SQLException {
        try {
            cat.setId(rs.getInt("id"));
            cat.setName(rs.getString("category_name"));
            cat.setDescription(rs.getString("description"));
            cat.setImage(rs.getString("image"));
            cat.setStatus(rs.getString("status"));
        } catch (SQLException e) {
            System.err.println("CRITICAL: Failed to extract category field. Possible column mismatch.");
            String msg = e.getMessage().toLowerCase();
            if (msg.contains("id")) System.err.println("Failed column: id");
            else if (msg.contains("category_name")) System.err.println("Failed column: category_name");
            else if (msg.contains("description")) System.err.println("Failed column: description");
            else if (msg.contains("image")) System.err.println("Failed column: image");
            else if (msg.contains("status")) System.err.println("Failed column: status");
            throw e;
        }
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE UPPER(status) = 'ACTIVE'";
        
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return categories;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Category cat = new Category();
                    extractCategory(rs, cat);
                    categories.add(cat);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching active categories: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    public List<Subcategory> getSubCategories(int categoryId) {
        List<Subcategory> subcategories = new ArrayList<>();
        String sql = "SELECT * FROM subcategories WHERE UPPER(status) = 'ACTIVE' AND category_id = ?";
        
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return subcategories;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, categoryId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Subcategory sub = new Subcategory();
                    sub.setId(rs.getInt("id"));
                    sub.setCategoryId(rs.getInt("category_id"));
                    sub.setName(rs.getString("subcategory_name"));
                    sub.setImage(rs.getString("image"));
                    sub.setStatus(rs.getString("status"));
                    subcategories.add(sub);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching subcategories: " + e.getMessage());
            e.printStackTrace();
        }
        return subcategories;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM categories WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return null;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    Category cat = new Category();
                    extractCategory(rs, cat);
                    return cat;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching category by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public List<Category> getAllCategoriesAdmin() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return categories;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Category cat = new Category();
                    extractCategory(rs, cat);
                    categories.add(cat);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all categories (admin): " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    public boolean addCategory(Category c) {
        String sql = "INSERT INTO categories (category_name, description, image, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, c.getName());
                ps.setString(2, c.getDescription());
                ps.setString(3, c.getImage());
                ps.setString(4, c.getStatus());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error adding category: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateCategory(Category c) {
        String sql = "UPDATE categories SET category_name=?, description=?, image=?, status=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, c.getName());
                ps.setString(2, c.getDescription());
                ps.setString(3, c.getImage());
                ps.setString(4, c.getStatus());
                ps.setInt(5, c.getId());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error updating category: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return false;
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error deleting category: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
