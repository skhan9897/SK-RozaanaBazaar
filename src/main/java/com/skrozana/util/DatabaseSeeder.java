package com.skrozana.util;

import java.sql.*;
import java.util.Random;

/**
 * Utility to seed the database with 500+ premium products across all categories.
 */
public class DatabaseSeeder {
    private static final Random random = new Random();

    public static void main(String[] args) {
        seedDatabase();
    }

    public static void seedDatabase() {
        System.out.println(">>> SEEDER: Starting database seeding process...");
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println(">>> SEEDER ERROR: Could not connect to database.");
                return;
            }

            ensureTablesExist(conn);

            String checkSql = "SELECT COUNT(*) FROM products";
            try (Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery(checkSql)) {
                if (rs.next() && rs.getInt(1) >= 500) {
                    System.out.println(">>> SEEDER: Database already has " + rs.getInt(1) + " products. Skipping.");
                    return;
                }
            }

            ensureAllCategories(conn);

            System.out.println(">>> SEEDER: Inserting 500+ products...");
            
            // Mobiles & Tablets
            insertBulk(conn, 1, 101, "Smartphone", new String[]{"iPhone 15", "Galaxy S24", "OnePlus 12", "Pixel 8", "Redmi Note 13", "Realme GT"}, 50, "MOB");
            insertBulk(conn, 1, 102, "Tablet", new String[]{"iPad Air", "Galaxy Tab S9", "Lenovo Tab P11", "Xiaomi Pad 6"}, 30, "TAB");
            
            // Computers & Laptops
            insertBulk(conn, 2, 201, "Laptop", new String[]{"MacBook Air M3", "Dell XPS 13", "HP Spectre x360", "Lenovo Yoga", "Asus Vivobook", "Acer Swift"}, 50, "LAP");
            insertBulk(conn, 2, 202, "Monitor", new String[]{"Samsung Odyssey", "LG UltraGear", "Dell UltraSharp", "BenQ Mobiuz"}, 30, "MON");
            
            // Electronics & Audio
            insertBulk(conn, 3, 301, "Headphones", new String[]{"Sony WH-1000XM5", "Bose QC Ultra", "AirPods Max", "Sennheiser Momentum 4", "JBL Tune"}, 50, "AUD");
            
            // TV & Entertainment
            insertBulk(conn, 4, 401, "Smart TV", new String[]{"Sony Bravia OLED", "Samsung Neo QLED", "LG WebOS", "TCL Mini LED", "Xiaomi TV Pro"}, 40, "TV");
            
            // Fashion (Men/Women/Kids)
            insertBulk(conn, 5, 501, "Men Shirt", new String[]{"Levis Casual", "Puma Sport", "Louis Philippe Formal", "Jack & Jones"}, 40, "FSH_M");
            insertBulk(conn, 6, 601, "Women Ethnic", new String[]{"Biba Kurta", "FabIndia Saree", "W for Woman", "Aurelia Set"}, 40, "FSH_W");
            insertBulk(conn, 7, 701, "Kids Wear", new String[]{"Mothercare Suit", "Gini & Jony", "FirstCry Exclusive"}, 30, "KID");
            
            // Grocery & Food
            insertBulk(conn, 8, 801, "Grocery Staples", new String[]{"Fortune Oil", "Aashirvaad Atta", "Daawat Basmati", "Tata Salt"}, 50, "GRO");
            
            // Beauty & Personal Care
            insertBulk(conn, 11, 1101, "Skin Care", new String[]{"Loreal Paris", "Nivea Cream", "Mamaearth Serum", "The Derma Co"}, 40, "BTY");
            
            // Footwear
            insertBulk(conn, 12, 1201, "Shoes", new String[]{"Nike Air Max", "Adidas Ultraboost", "Puma RS-X", "Reebok Classic", "Skechers Arch Fit"}, 50, "SHOE");
            
            //            // Sports & Fitness
            insertBulk(conn, 13, 1301, "Fitness Gear", new String[]{"Dumbbell Set", "Yoga Mat Pro", "Treadmill X1", "Cycle Master"}, 30, "SPT");

            System.out.println(">>> SEEDER: Inserting 360 images for sample products...");
            seed360Images(conn);

            System.out.println(">>> SEEDER: 500+ Products seeded successfully!");
        } catch (Exception e) {
            System.err.println(">>> SEEDER ERROR: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void seed360Images(Connection conn) throws SQLException {
        // Pick top 10 products and add 360 images
        String getProductsSql = "SELECT id, product_name FROM products LIMIT 10";
        String insertImageSql = "INSERT INTO product_images (product_id, image_url, image_type, image_order) VALUES (?, ?, '360', ?)";
        
        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(getProductsSql);
             PreparedStatement ps = conn.prepareStatement(insertImageSql)) {
            
            while (rs.next()) {
                int productId = rs.getInt("id");
                String name = rs.getString("product_name").toLowerCase().replace(" ", "-");
                for (int i = 1; i <= 24; i++) {
                    // Pattern for Unsplash random frame (mocking 24 angles)
                    String imageUrl = "https://source.unsplash.com/800x800/?" + name + "&sig=" + (productId * 100 + i);
                    
                    ps.setInt(1, productId);
                    ps.setString(2, imageUrl);
                    ps.setInt(3, i);
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        }
    }

    private static void ensureTablesExist(Connection conn) throws SQLException {
        try (Statement stmt = conn.createStatement()) {
            stmt.execute("CREATE TABLE IF NOT EXISTS categories (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "category_name VARCHAR(100) NOT NULL, " +
                    "parent_id INT DEFAULT 0, " +
                    "image VARCHAR(255), " +
                    "status ENUM('active', 'inactive') DEFAULT 'active', " +
                    "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                    ")");

            stmt.execute("CREATE TABLE IF NOT EXISTS products (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "category_id INT NOT NULL, " +
                    "subcategory_id INT, " +
                    "product_name VARCHAR(255) NOT NULL, " +
                    "brand VARCHAR(100), " +
                    "description TEXT, " +
                    "price DECIMAL(10, 2) NOT NULL, " +
                    "discount DECIMAL(10, 2) DEFAULT 0.00, " +
                    "final_price DECIMAL(10, 2) NOT NULL, " +
                    "stock INT DEFAULT 0, " +
                    "sku VARCHAR(100), " +
                    "image VARCHAR(255), " +
                    "image2 VARCHAR(255), " +
                    "image3 VARCHAR(255), " +
                    "image4 VARCHAR(255), " +
                    "rating DECIMAL(3, 2) DEFAULT 0.00, " +
                    "status ENUM('active', 'inactive') DEFAULT 'active', " +
                    "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
            stmt.execute("CREATE TABLE IF NOT EXISTS product_images (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "product_id INT NOT NULL, " +
                    "image_url VARCHAR(255) NOT NULL, " +
                    "image_type ENUM('NORMAL', '360') DEFAULT 'NORMAL', " +
                    "image_order INT DEFAULT 0, " +
                    "is_primary BOOLEAN DEFAULT FALSE, " +
                    "FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE" +
                    ")");
        }
    }

    private static void ensureAllCategories(Connection conn) throws SQLException {
        String catSql = "INSERT INTO categories (id, category_name, parent_id, status) VALUES (?, ?, 0, 'active') ON DUPLICATE KEY UPDATE category_name = VALUES(category_name)";
        Object[][] cats = {
            {1, "Mobiles & Tablets"}, {2, "Computers & Laptops"}, {3, "Electronics"},
            {4, "TV & Entertainment"}, {5, "Men Fashion"}, {6, "Women Fashion"},
            {7, "Kids & Baby"}, {8, "Grocery & Food"}, {9, "Snacks & Beverages"},
            {10, "Home & Kitchen"}, {11, "Beauty & Personal Care"}, {12, "Footwear"},
            {13, "Sports & Fitness"}, {14, "Accessories"}, {15, "Other"}
        };
        try (PreparedStatement ps = conn.prepareStatement(catSql)) {
            for (Object[] cat : cats) {
                ps.setInt(1, (Integer) cat[0]);
                ps.setString(2, (String) cat[1]);
                ps.executeUpdate();
            }
        }
    }

    private static void insertBulk(Connection conn, int catId, int subId, String type, String[] models, int count, String prefix) throws SQLException {
        String sql = "INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'active')";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 1; i <= count; i++) {
                String model = models[random.nextInt(models.length)];
                String brand = model.contains(" ") ? model.substring(0, model.indexOf(" ")) : model;
                String name = model + " " + (100 + i) + " Premium Edition";
                
                double mrp = 500 + random.nextDouble() * 150000;
                mrp = Math.round(mrp * 100.0) / 100.0;
                int discPercent = random.nextInt(60);
                double discAmt = Math.round((mrp * discPercent / 100.0) * 100.0) / 100.0;
                double sellingPrice = mrp - discAmt;
                
                String sku = "SKR-" + prefix + "-" + (1000 + i);
                String desc = "Experience the best-in-class " + type + " with the " + name + ". Featuring premium design and top-tier performance.";
                
                // Using exact Unsplash signatures to guarantee unique, correct images for 500 products
                String imgUrl = "https://source.unsplash.com/800x800/?" + type.toLowerCase().replace(" ", "-") + "," + brand.toLowerCase() + "&sig=" + (catId * 1000 + i);

                ps.setInt(1, catId);
                ps.setInt(2, subId);
                ps.setString(3, name);
                ps.setString(4, brand);
                ps.setString(5, desc);
                ps.setDouble(6, mrp);
                ps.setDouble(7, discAmt);
                ps.setDouble(8, sellingPrice);
                ps.setInt(9, random.nextInt(500));
                ps.setString(10, sku);
                ps.setString(11, imgUrl);
                ps.setDouble(12, 3.5 + random.nextDouble() * 1.5);
                
                ps.addBatch();
            }
            ps.executeBatch();
            System.out.println(">>> SEEDER: Inserted " + count + " " + type + " items.");
        }
    }
}
