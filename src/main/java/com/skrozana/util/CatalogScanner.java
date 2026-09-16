package com.skrozana.util;

import com.skrozana.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CatalogScanner {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("Failed to connect to the database.");
                return;
            }

            System.out.println("=== PREPARING DATABASE SCHEMA ===");
            try (Statement stmt = conn.createStatement()) {
                try {
                    stmt.execute("ALTER TABLE products ADD COLUMN image2 VARCHAR(255)");
                    System.out.println("Added column image2");
                } catch (Exception e) { System.out.println("Column image2 already exists or failed to add."); }
                
                try {
                    stmt.execute("ALTER TABLE products ADD COLUMN image3 VARCHAR(255)");
                    System.out.println("Added column image3");
                } catch (Exception e) { System.out.println("Column image3 already exists or failed to add."); }
                
                try {
                    stmt.execute("ALTER TABLE products ADD COLUMN image4 VARCHAR(255)");
                    System.out.println("Added column image4");
                } catch (Exception e) { System.out.println("Column image4 already exists or failed to add."); }
            }

            System.out.println("\n=== STARTING PRODUCT CATALOG SCAN ===");
            
            int totalProducts = 0;
            int withAtLeastOneImage = 0;
            int withoutAnyImages = 0;
            int missingMultipleImageSlots = 0; 
            
            String sql = "SELECT p.id, p.product_name, p.brand, p.image, p.image2, p.image3, p.image4, c.category_name " +
                         "FROM products p LEFT JOIN categories c ON p.category_id = c.id";
            
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                 
                while (rs.next()) {
                    totalProducts++;
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setProductName(rs.getString("product_name"));
                    p.setBrand(rs.getString("brand"));
                    p.setImage(rs.getString("image"));
                    p.setImage2(rs.getString("image2"));
                    p.setImage3(rs.getString("image3"));
                    p.setImage4(rs.getString("image4"));
                    String catName = rs.getString("category_name");
                    if (catName == null) catName = "General";
                    
                    String img1 = p.getImage();
                    String img2 = p.getImage2();
                    String img3 = p.getImage3();
                    String img4 = p.getImage4();
                    
                    int populatedCount = 0;
                    if (img1 != null && !img1.trim().isEmpty()) populatedCount++;
                    if (img2 != null && !img2.trim().isEmpty()) populatedCount++;
                    if (img3 != null && !img3.trim().isEmpty()) populatedCount++;
                    if (img4 != null && !img4.trim().isEmpty()) populatedCount++;
                    
                    if (populatedCount > 0) {
                        withAtLeastOneImage++;
                    } else {
                        withoutAnyImages++;
                    }
                    
                    int missingSlots234 = 0;
                    if (img2 == null || img2.trim().isEmpty()) missingSlots234++;
                    if (img3 == null || img3.trim().isEmpty()) missingSlots234++;
                    if (img4 == null || img4.trim().isEmpty()) missingSlots234++;
                    
                    if (missingSlots234 > 1) {
                        missingMultipleImageSlots++;
                    }
                    
                    if (img1 != null && !img1.trim().isEmpty()) imagePathCounts.put(img1, imagePathCounts.getOrDefault(img1, 0) + 1);
                    if (img2 != null && !img2.trim().isEmpty()) imagePathCounts.put(img2, imagePathCounts.getOrDefault(img2, 0) + 1);
                    if (img3 != null && !img3.trim().isEmpty()) imagePathCounts.put(img3, imagePathCounts.getOrDefault(img3, 0) + 1);
                    if (img4 != null && !img4.trim().isEmpty()) imagePathCounts.put(img4, imagePathCounts.getOrDefault(img4, 0) + 1);
                    
                    if (img1 == null || img1.trim().isEmpty() ||
                        img2 == null || img2.trim().isEmpty() ||
                        img3 == null || img3.trim().isEmpty() ||
                        img4 == null || img4.trim().isEmpty()) {
                        
                        // We store the category name in the description temporarily or just use a map
                        p.setDescription(catName); 
                        productsToUpdate.add(p);
                    }
                }
            }
            
            System.out.println("TOTAL PRODUCTS: " + totalProducts);
            System.out.println("PRODUCTS WITH AT LEAST 1 IMAGE: " + withAtLeastOneImage);
            System.out.println("PRODUCTS WITHOUT ANY IMAGES: " + withoutAnyImages);
            System.out.println("COUNT OF PRODUCTS MISSING MULTIPLE IMAGES (image2, image3, image4): " + missingMultipleImageSlots);
            
            System.out.println("IDENTIFY DUPLICATE IMAGE PATHS:");
            boolean foundDuplicates = false;
            for (Map.Entry<String, Integer> entry : imagePathCounts.entrySet()) {
                if (entry.getValue() > 1) {
                    System.out.println("  - Path: " + entry.getKey() + " (Occurrences: " + entry.getValue() + ")");
                    foundDuplicates = true;
                }
            }
            if (!foundDuplicates) {
                System.out.println("  No duplicate image paths found.");
            }
            
            System.out.println("\n=== POPULATING MISSING IMAGE SLOTS ===");
            System.out.println("Products needing update: " + productsToUpdate.size());
            
            String updateSql = "UPDATE products SET image=?, image2=?, image3=?, image4=? WHERE id=?";
            int updatedCount = 0;
            try (PreparedStatement ups = conn.prepareStatement(updateSql)) {
                for (Product p : productsToUpdate) {
                    String catName = p.getDescription(); // Recovered category name
                    Map<String, String> generated = ImageGenerationService.generateAndSaveImages(p, catName);
                    
                    String f1 = p.getImage();
                    String f2 = p.getImage2();
                    String f3 = p.getImage3();
                    String f4 = p.getImage4();
                    
                    if (f1 == null || f1.trim().isEmpty()) f1 = generated.get("image");
                    if (f2 == null || f2.trim().isEmpty()) f2 = generated.get("image2");
                    if (f3 == null || f3.trim().isEmpty()) f3 = generated.get("image3");
                    if (f4 == null || f4.trim().isEmpty()) f4 = generated.get("image4");
                    
                    ups.setString(1, f1);
                    ups.setString(2, f2);
                    ups.setString(3, f3);
                    ups.setString(4, f4);
                    ups.setInt(5, p.getId());
                    
                    ups.addBatch();
                    updatedCount++;
                    
                    if (updatedCount % 50 == 0) {
                        ups.executeBatch();
                    }
                }
                ups.executeBatch();
            }
            System.out.println("Successfully updated " + updatedCount + " products with exactly 4 professional images assigned.");
            System.out.println("=== CATALOG SCAN AND UPDATE COMPLETE ===");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
