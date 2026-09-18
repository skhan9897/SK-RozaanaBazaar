package com.skrozana.util;

import java.sql.*;
import java.util.Random;

/**
 * Utility to seed the database with premium products if the products table is empty.
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
            ensureBasicCategoriesAndSubcategories(conn);

            System.out.println("Seeding products...");
            
            // Total target: 500+ products
            insertProducts(conn, 1, 1, "Smartphone", new String[]{"iPhone 15 Pro", "Samsung Galaxy S24 Ultra", "Google Pixel 8 Pro", "OnePlus 12", "Nothing Phone (2)"}, 60, "MOB");
            insertProducts(conn, 1, 2, "Tablet", new String[]{"iPad Pro M2", "Samsung Galaxy Tab S9 Ultra", "Microsoft Surface Pro 9"}, 40, "TAB");
            insertProducts(conn, 2, 16, "Laptop", new String[]{"MacBook Pro M3 Max", "Dell XPS 17", "HP Spectre x360", "Razer Blade 16"}, 60, "LAP");
            insertProducts(conn, 3, 42, "Wireless Headphones", new String[]{"Sony WH-1000XM5", "Bose QuietComfort Ultra", "Apple AirPods Max", "Sennheiser Momentum 4"}, 60, "AUD");
            insertProducts(conn, 3, 45, "Smartwatch", new String[]{"Apple Watch Ultra 2", "Samsung Galaxy Watch 6 Classic", "Garmin Epix Pro"}, 50, "WCH");
            insertProducts(conn, 16, 175, "Gaming Console", new String[]{"PlayStation 5 Slim", "Xbox Series X", "Nintendo Switch OLED"}, 30, "GAM");
            insertProducts(conn, 2, 20, "Gaming Monitor", new String[]{"Samsung Odyssey Neo G9", "LG UltraGear OLED", "ASUS ROG Swift"}, 40, "MON");
            insertProducts(conn, 3, 55, "Mirrorless Camera", new String[]{"Sony A7R V", "Canon EOS R3", "Fujifilm X-T5"}, 40, "CAM");
            insertProducts(conn, 4, 60, "Coffee Machine", new String[]{"De'Longhi Magnifica", "Breville Barista Express", "Jura E8"}, 40, "KIT");
            insertProducts(conn, 5, 72, "Premium Shirt", new String[]{"Ralph Lauren Polo", "Tommy Hilfiger Classic", "Hugo Boss Slim Fit"}, 50, "FSH");
            insertProducts(conn, 8, 116, "Gourmet Rice", new String[]{"Lundberg Organic", "Lotus Foods Heirloom", "India Gate Select"}, 50, "GRO");

            System.out.println("Seeding completed successfully!");
        } catch (SQLException e) {
            System.err.println("SQL Error during seeding: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void ensureBasicCategoriesAndSubcategories(Connection conn) throws SQLException {
        // Categories
        String catSql = "INSERT IGNORE INTO categories (id, category_name, status) VALUES (?, ?, 'ACTIVE')";
        int[] catIds = {1, 2, 3, 4, 5, 8, 16};
        String[] catNames = {"Mobiles & Tablets", "Computers", "Electronics", "Home & Kitchen", "Fashion", "Grocery", "Gaming"};
        
        try (PreparedStatement ps = conn.prepareStatement(catSql)) {
            for (int i = 0; i < catIds.length; i++) {
                ps.setInt(1, catIds[i]);
                ps.setString(2, catNames[i]);
                ps.executeUpdate();
            }
        }

        // Subcategories (matching the IDs used in insertProducts)
        String subSql = "INSERT IGNORE INTO subcategories (id, category_id, subcategory_name, status) VALUES (?, ?, ?, 'ACTIVE')";
        int[][] subData = {
            {1, 1, "Smartphones"}, {2, 1, "Tablets"}, {16, 2, "Laptops"}, {20, 2, "Monitors"},
            {42, 3, "Audio"}, {45, 3, "Wearables"}, {55, 3, "Cameras"}, {60, 4, "Appliances"},
            {72, 5, "Men's Clothing"}, {116, 8, "Staples"}, {175, 16, "Consoles"}
        };
        
        try (PreparedStatement ps = conn.prepareStatement(subSql)) {
            for (int[] sub : subData) {
                ps.setInt(1, sub[0]);
                ps.setInt(2, sub[1]);
                ps.setString(3, sub[2]);
                ps.executeUpdate();
            }
        }
    }

    private static void insertProducts(Connection conn, int catId, int subCatId, String type, String[] models, int count, String prefix) throws SQLException {
        String sql = "INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'ACTIVE')";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < count; i++) {
                String baseModel = models[random.nextInt(models.length)];
                String brand = baseModel.contains(" ") ? baseModel.substring(0, baseModel.indexOf(" ")) : baseModel;
                String name = baseModel + " Gen " + (i + 1);
                
                double price = 1000 + random.nextDouble() * 199000;
                double discountPercent = 5 + random.nextInt(15);
                double discount = (price * discountPercent) / 100;
                double finalPrice = price - discount;
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
                ps.setDouble(7, discount);
                ps.setDouble(8, finalPrice);
                ps.setInt(9, stock);
                ps.setString(10, sku);
                ps.setString(11, image);
                ps.setString(12, image); // image2
                ps.setString(13, image); // image3
                ps.setString(14, image); // image4
                ps.setDouble(15, 4.0 + random.nextDouble());
                
                ps.addBatch();
            }
            ps.executeBatch();
            System.out.println("Inserted " + count + " " + type + " products.");
        }
    }
}
