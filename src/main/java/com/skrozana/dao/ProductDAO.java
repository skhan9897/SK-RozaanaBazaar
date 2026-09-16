package com.skrozana.dao;

import com.skrozana.model.Product;
import com.skrozana.util.DBConnection;
import com.skrozana.util.ImageGenerationService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    
    private void extractProduct(ResultSet rs, Product product) throws Exception {
        product.setId(rs.getInt("id"));
        product.setCategoryId(rs.getInt("category_id"));
        product.setSubcategoryId((Integer) rs.getObject("subcategory_id"));
        product.setProductName(rs.getString("product_name"));
        product.setBrand(rs.getString("brand"));
        product.setDescription(rs.getString("description"));
        product.setPrice(rs.getDouble("price"));
        product.setDiscount(rs.getDouble("discount"));
        product.setFinalPrice(rs.getDouble("final_price"));
        product.setStock(rs.getInt("stock"));
        product.setSku(rs.getString("sku"));
        product.setImage(rs.getString("image"));
        product.setImage2(rs.getString("image2"));
        product.setImage3(rs.getString("image3"));
        product.setImage4(rs.getString("image4"));
        product.setRating(rs.getDouble("rating"));
        product.setStatus(rs.getString("status"));
        product.setCreatedAt(rs.getTimestamp("created_at"));
    }

    public List<Product> searchProducts(String query) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT id, category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status, created_at FROM products WHERE (product_name LIKE ? OR description LIKE ? OR brand LIKE ?) AND status = 'ACTIVE' LIMIT 20";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            String searchTerm = "%" + query + "%";
            ps.setString(1, searchTerm);
            ps.setString(2, searchTerm);
            ps.setString(3, searchTerm);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                extractProduct(rs, product);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ? AND status = 'ACTIVE'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                extractProduct(rs, product);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProductsBySubcategory(int subcategoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE subcategory_id = ? AND status = 'ACTIVE'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, subcategoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                extractProduct(rs, product);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                extractProduct(rs, product);
                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getAllProducts() {
        return getAllProducts(0, 500); // Default high limit for compatibility
    }

    public List<Product> getAllProducts(int offset, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT id, category_id, subcategory_id, product_name, brand, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status FROM products LIMIT ? OFFSET ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                extractProduct(rs, product);
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean addProduct(Product p) {
        String sql = "INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, p.getCategoryId());
            ps.setObject(2, p.getSubcategoryId());
            ps.setString(3, p.getProductName());
            ps.setString(4, p.getBrand());
            ps.setString(5, p.getDescription());
            ps.setDouble(6, p.getPrice());
            ps.setDouble(7, p.getDiscount());
            ps.setDouble(8, p.getFinalPrice());
            ps.setInt(9, p.getStock());
            ps.setString(10, p.getSku());
            ps.setString(11, p.getImage());
            ps.setString(12, p.getImage2());
            ps.setString(13, p.getImage3());
            ps.setString(14, p.getImage4());
            ps.setDouble(15, p.getRating());
            ps.setString(16, p.getStatus());
            
            boolean success = ps.executeUpdate() > 0;
            if (success) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int productId = rs.getInt(1);
                    queueImageTask(productId);
                }
            }
            return success;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private void queueImageTask(int productId) {
        String sql = "INSERT INTO product_image_status (product_id, status) VALUES (?, 'PENDING')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET category_id=?, subcategory_id=?, product_name=?, brand=?, description=?, price=?, discount=?, final_price=?, stock=?, sku=?, image=?, image2=?, image3=?, image4=?, rating=?, status=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getCategoryId());
            ps.setObject(2, p.getSubcategoryId());
            ps.setString(3, p.getProductName());
            ps.setString(4, p.getBrand());
            ps.setString(5, p.getDescription());
            ps.setDouble(6, p.getPrice());
            ps.setDouble(7, p.getDiscount());
            ps.setDouble(8, p.getFinalPrice());
            ps.setInt(9, p.getStock());
            ps.setString(10, p.getSku());
            ps.setString(11, p.getImage());
            ps.setString(12, p.getImage2());
            ps.setString(13, p.getImage3());
            ps.setString(14, p.getImage4());
            ps.setDouble(15, p.getRating());
            ps.setString(16, p.getStatus());
            ps.setInt(17, p.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
