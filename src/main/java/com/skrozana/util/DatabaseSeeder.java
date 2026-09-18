package com.skrozana.util;

import java.sql.*;
import java.util.Random;

/**
 * Utility to seed the database with premium products if the products table is empty.
 * Corrected version with fixed type mismatches and matching schema.
 */
public class DatabaseSeeder {
    private static final Random random = new Random();

    public static void main(String[] args) {
        seedDatabase();
    }

    public static void seedDatabase() {
        System.out.println("Starting database seeding process...");
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("Seeding failed: Could not connect to database.");
                return;
            }

            // Check if products table is empty
            String checkSql = "SELECT COUNT(*) FROM products";
            try (Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery(checkSql)) {
                if (rs.next() && rs.getInt(1) > 0) {
                    System.out.println("Products table already has data. Skipping seeding.");
                    return;
                }
            }

            // Ensure categories exist first
            ensureBasicCategories(conn);

            System.out.println("Seeding products...");
            
            // Total target: 500+ products
            // Using IDs that we will ensure exist in ensureBasicCategories
            insertProducts(conn, 1, 101, "Smartphone", new String[]{"iPhone 15 Pro", "Samsung Galaxy S24 Ultra", "Google Pixel 8 Pro", "OnePlus 12", "Nothing Phone (2)"}, 60, "MOB");
            insertProducts(conn, 1, 102, "Tablet", new String[]{"iPad Pro M2", "Samsung Galaxy Tab S9 Ultra", "Microsoft Surface Pro 9"}, 40, "TAB");
            insertProducts(conn, 2, 201, "Laptop", new String[]{"MacBook Pro M3 Max", "Dell XPS 17", "HP Spectre x360", "Razer Blade 16"}, 60, "LAP");
            insertProducts(conn, 3, 301, "Wireless Headphones", new String[]{"Sony WH-1000XM5", "Bose QuietComfort Ultra", "Apple AirPods Max", "Sennheiser Momentum 4"}, 60, "AUD");
            insertProducts(conn, 3, 302, "Smartwatch", new String[]{"Apple Watch Ultra 2", "Samsung Galaxy Watch 6 Classic", "Garmin Epix Pro"}, 50, "WCH");
            insertProducts(conn, 16, 1601, "Gaming Console", new String[]{"PlayStation 5 Slim", "Xbox Series X", "Nintendo Switch OLED"}, 30, "GAM");
            insertProducts(conn, 2, 202, "Gaming Monitor", new String[]{"Samsung Odyssey Neo G9", "LG UltraGear OLED", "ASUS ROG Swift"}, 40, "MON");
            insertProducts(conn, 3, 303, "Mirrorless Camera", new String[]{"Sony A7R V", "Canon EOS R3", "Fujifilm X-T5"}, 40, "CAM");
            insertProducts(conn, 4, 401, "Coffee Machine", new String[]{"De'Longhi Magnifica", "Breville Barista Express", "Jura E8"}, 40, "KIT");
            insertProducts(conn, 5, 501, "Premium Shirt", new String[]{"Ralph Lauren Polo", "Tommy Hilfiger Classic", "Hugo Boss Slim Fit"}, 50, "FSH");
            insertProducts(conn, 8, 801, "Gourmet Rice", new String[]{"Lundberg Organic", "Lotus Foods Heirloom", "India Gate Select"}, 50, "GRO");

            System.out.println("Seeding completed successfully!");
        } catch (SQLException e) {
            System.err.println("SQL Error during seeding: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void ensureBasicCategories(Connection conn) throws SQLException {
        // Main Categories (parent_id = 0)
        String catSql = "INSERT INTO categories (id, category_name, parent_id, status) VALUES (?, ?, 0, 'active') " +
                        "ON DUPLICATE KEY UPDATE category_name = VALUES(category_name)";
        
        Object[][] mainCats = {
            {1, "Mobiles & Tablets"},
            {2, "Computers"},
            {3, "Electronics"},
            {4, "Home & Kitchen"},
            {5, "Fashion"},
            {8, "Grocery"},
            {16, "Gaming"}
        };
        
        try (PreparedStatement ps = conn.prepareStatement(catSql)) {
            for (Object[] cat : mainCats) {
                ps.setInt(1, (Integer) cat[0]);
                ps.setString(2, (String) cat[1]);
                ps.executeUpdate();
            }
        }

        // Subcategories (parent_id = main_cat_id)
        String subSql = "INSERT INTO categories (id, category_name, parent_id, status) VALUES (?, ?, ?, 'active') " +
                        "ON DUPLICATE KEY UPDATE category_name = VALUES(category_name)";
        
        Object[][] subCats = {
            {101, "Smartphones", 1},
            {102, "Tablets", 1},
            {201, "Laptops", 2},
            {202, "Monitors", 2},
            {301, "Audio", 3},
            {302, "Wearables", 3},
            {303, "Cameras", 3},
            {401, "Appliances", 4},
            {501, "Men's Clothing", 5},
            {801, "Staples", 8},
            {1601, "Consoles", 16}
        };
        
        try (PreparedStatement ps = conn.prepareStatement(subSql)) {
            for (Object[] sub : subCats) {
                ps.setInt(1, (Integer) sub[0]);
                ps.setString(2, (String) sub[1]);
                ps.setInt(3, (Integer) sub[2]);
                ps.executeUpdate();
            }
        }
    }

    private static void insertProducts(Connection conn, int catId, int subCatId, String type, String[] models, int count, String prefix) throws SQLException {
        String sql = "INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'active')";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < count; i++) {
                String baseModel = models[random.nextInt(models.length)];
                String brand = baseModel.contains(" ") ? baseModel.substring(0, baseModel.indexOf(" ")) : baseModel;
                String name = baseModel + " Gen " + (i + 1);
                
                double price = 1000 + random.nextDouble() * 199000;
                // Round to 2 decimal places
                price = Math.round(price * 100.0) / 100.0;
                
                int discountPercent = 5 + random.nextInt(15);
                double discountAmt = Math.round((price * discountPercent / 100.0) * 100.0) / 100.0;
                double finalPrice = price - discountAmt;
                
                int stock = 10 + random.nextInt(100);
                String sku = "SKR-" + prefix + "-" + (10000 + random.nextInt(90000)) + i;
                String desc = "The " + name + " offers unparalleled performance in the " + type.toLowerCase() + " category. Designed for professionals and enthusiasts.";
                String image = "/images/products/" + prefix.toLowerCase() + "_" + (i % 5 + 1) + ".jpg";

                ps.setInt(1, catId);
                ps.setInt(2, subCatId);
                ps.setString(3, name);
                ps.setString(4, brand);
                ps.setString(5, desc);
                ps.setDouble(6, price);
                ps.setDouble(7, (double) discountPercent); // Based on schema, 'discount' might be a percentage or amount.
                // Re-calculating based on standard e-commerce logic (discount as amount usually, but let's check schema again)
                // schema: discount DECIMAL(10, 2) DEFAULT 0.00, final_price DECIMAL(10, 2) NOT NULL
                ps.setDouble(7, discountAmt); 
                ps.setDouble(8, finalPrice);
                ps.setInt(9, stock);
                ps.setString(10, sku);
                ps.setString(11, image);
                ps.setString(12, image); // image2
                ps.setString(13, image); // image3
                ps.setString(14, image); // image4
                ps.setDouble(15, Math.round((4.0 + random.nextDouble()) * 10.0) / 10.0);
                
                ps.addBatch();
            }
            ps.executeBatch();
            System.out.println("Inserted " + count + " " + type + " products.");
        }
    }
}
