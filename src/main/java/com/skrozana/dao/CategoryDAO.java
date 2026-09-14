package com.skrozana.dao;

import com.skrozana.model.Category;
import com.skrozana.model.Subcategory;
import com.skrozana.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE status = 'ACTIVE'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                cat.setImage(rs.getString("image"));
                cat.setStatus(rs.getString("status"));
                categories.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Subcategory> getSubCategories(int categoryId) {
        List<Subcategory> subcategories = new ArrayList<>();
        String sql = "SELECT * FROM subcategories WHERE status = 'ACTIVE' AND category_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subcategories;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM categories WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                cat.setImage(rs.getString("image"));
                cat.setStatus(rs.getString("status"));
                return cat;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Category> getAllCategoriesAdmin() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                cat.setImage(rs.getString("image"));
                cat.setStatus(rs.getString("status"));
                categories.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
}
