-- =============================================================================
-- SKRozaanaBazaar - COMPLETE DATABASE SYNC SCRIPT
-- This script reconstructs categories, subcategories, and populates 200+ products
-- =============================================================================

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE products;
TRUNCATE TABLE subcategories;
TRUNCATE TABLE categories;
SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- 1. CATEGORIES (Total 22)
-- ==========================================
INSERT INTO categories (id, category_name, status) VALUES
(1, 'Mobiles & Tablets', 'ACTIVE'),
(2, 'Computers & Laptops', 'ACTIVE'),
(3, 'Electronics', 'ACTIVE'),
(4, 'TV & Entertainment', 'ACTIVE'),
(5, 'Men Fashion', 'ACTIVE'),
(6, 'Women Fashion', 'ACTIVE'),
(7, 'Kids & Baby', 'ACTIVE'),
(8, 'Grocery & Food', 'ACTIVE'),
(9, 'Snacks & Beverages', 'ACTIVE'),
(10, 'Beauty & Personal Care', 'ACTIVE'),
(11, 'Home & Kitchen', 'ACTIVE'),
(12, 'Cleaning & Household', 'ACTIVE'),
(13, 'Furniture', 'ACTIVE'),
(14, 'Electrical', 'ACTIVE'),
(15, 'Sports & Fitness', 'ACTIVE'),
(16, 'Gaming', 'ACTIVE'),
(17, 'Automotive', 'ACTIVE'),
(18, 'Footwear', 'ACTIVE'),
(19, 'Bags & Luggage', 'ACTIVE'),
(20, 'Books & Stationery', 'ACTIVE'),
(21, 'Pet Supplies', 'ACTIVE'),
(22, 'Tools & Hardware', 'ACTIVE');

-- ==========================================
-- 2. SUBCATEGORIES (Mapping all 200+)
-- ==========================================

-- 1. Mobiles & Tablets
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(1, 'Smartphones'), (1, 'Tablets'), (1, 'Mobile Covers'), (1, 'Screen Guards'), (1, 'Tempered Glass'),
(1, 'Chargers'), (1, 'USB Cables'), (1, 'Lightning Cables'), (1, 'Power Banks'), (1, 'Mobile Stands'),
(1, 'Car Mobile Holders'), (1, 'Selfie Sticks'), (1, 'OTG Adapters'), (1, 'Wireless Chargers'), (1, 'SIM Adapters');

-- 2. Computers & Laptops
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(2, 'HP Laptop'), (2, 'Dell Laptop'), (2, 'Lenovo Laptop'), (2, 'Asus Laptop'), (2, 'Acer Laptop'),
(2, 'MSI Laptop'), (2, 'MacBook'), (2, 'Desktop'), (2, 'Monitor'), (2, 'Keyboard'),
(2, 'Mouse'), (2, 'Webcam'), (2, 'Speakers'), (2, 'UPS'), (2, 'Printer'),
(2, 'Scanner'), (2, 'Laptop Bag'), (2, 'Laptop Stand'), (2, 'Cooling Pad'), (2, 'HDMI Cable'),
(2, 'USB Hub'), (2, 'SSD'), (2, 'HDD'), (2, 'RAM'), (2, 'Pen Drive'), (2, 'Memory Card');

-- 3. Electronics
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(3, 'Bluetooth Earbuds'), (3, 'Bluetooth Headphones'), (3, 'Wired Earphones'), (3, 'Wireless Headphones'),
(3, 'Bluetooth Speakers'), (3, 'Soundbar'), (3, 'Home Theatre'), (3, 'Microphone'), (3, 'Smart Speaker'),
(3, 'Radio'), (3, 'MP3 Player'), (3, 'Gaming Headset');

-- 4. TV & Entertainment
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(4, 'LED TV'), (4, 'Smart TV'), (4, 'Android TV'), (4, 'QLED TV'), (4, 'OLED TV'),
(4, 'TV Stick'), (4, 'Set Top Box'), (4, 'DTH Accessories'), (4, 'TV Wall Mount'), (4, 'Remote'), (4, 'Projector'), (4, 'Projector Screen');

-- 5. Men's Fashion
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(5, 'T-Shirts'), (5, 'Shirts'), (5, 'Jeans'), (5, 'Trousers'), (5, 'Formal Pants'), (5, 'Track Pants'),
(5, 'Shorts'), (5, 'Kurta'), (5, 'Sherwani'), (5, 'Blazer'), (5, 'Suit'), (5, 'Jacket'),
(5, 'Sweatshirt'), (5, 'Hoodie'), (5, 'Innerwear'), (5, 'Night Suit'), (5, 'Belt'), (5, 'Wallet'),
(5, 'Sunglasses'), (5, 'Cap'), (5, 'Tie'), (5, 'Watch'), (5, 'Backpack');

-- 6. Women's Fashion
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(6, 'Saree'), (6, 'Kurti'), (6, 'Salwar Suit'), (6, 'Lehenga'), (6, 'Dress'), (6, 'Top'),
(6, 'Jeans'), (6, 'T-Shirt'), (6, 'Palazzo'), (6, 'Leggings'), (6, 'Skirt'), (6, 'Night Suit'),
(6, 'Dupatta'), (6, 'Ethnic Wear'), (6, 'Western Wear'), (6, 'Handbag'), (6, 'Purse'), (6, 'Sunglasses'), (6, 'Watch'), (6, 'Scarf'), (6, 'Hair Accessories');

-- 8. Grocery & Food
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(8, 'Wheat Atta'), (8, 'Multigrain Atta'), (8, 'Maida'), (8, 'Besan'), (8, 'Suji'), (8, 'Rice Flour'),
(8, 'Basmati Rice'), (8, 'Sona Masoori Rice'), (8, 'Toor Dal'), (8, 'Moong Dal'), (8, 'Rajma'),
(8, 'Mustard Oil'), (8, 'Sunflower Oil'), (8, 'Soybean Oil'), (8, 'Coconut Oil'), (8, 'Ghee'), (8, 'Butter'),
(8, 'Turmeric'), (8, 'Red Chilli'), (8, 'Garam Masala'), (8, 'Sugar'), (8, 'Jaggery'), (8, 'Salt');

-- 9. Snacks & Beverages
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(9, 'Parle-G'), (9, 'Good Day'), (9, 'Oreo'), (9, 'Bourbon'), (9, 'Chips'), (9, 'Namkeen'),
(9, 'Bhujia'), (9, 'Popcorn'), (9, 'Tea'), (9, 'Coffee'), (9, 'Green Tea'), (9, 'Soft Drinks'), (9, 'Juice'), (9, 'Energy Drinks');

-- 11. Home & Kitchen
INSERT INTO subcategories (category_id, subcategory_name) VALUES
(11, 'Pressure Cooker'), (11, 'Fry Pan'), (11, 'Tawa'), (11, 'Kadhai'), (11, 'Saucepan'),
(11, 'Knife'), (11, 'Kitchen Containers'), (11, 'Lunch Box'), (11, 'Water Bottle'), (11, 'Mixer Grinder'),
(11, 'Electric Kettle'), (11, 'Microwave'), (11, 'Air Fryer'), (11, 'Bedsheet'), (11, 'Blanket'), (11, 'Curtains'), (11, 'Wall Clock');

-- ==========================================
-- 3. PRODUCTS (Initial Flagship Sync)
-- ==========================================

INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, image2, image3, image4, rating, status) VALUES
-- Mobiles
(1, 1, 'Samsung Galaxy S24 Ultra', 'Samsung', 'AI Powered flagship smartphone with Titanium body', 129999, 10, 116999, 50, 'SKRB-MOB-013', '/images/products/s24.jpg', '/images/products/s24_2.jpg', '/images/products/s24_3.jpg', '/images/products/s24_4.jpg', 4.9, 'ACTIVE'),
(1, 2, 'Xiaomi Pad 6', 'Xiaomi', 'High performance tablet for work and play', 26999, 15, 22949, 30, 'SKRB-MOB-014', '/images/products/mi-pad.jpg', 4.5, 'ACTIVE'),
(1, 14, 'Belkin BoostCharge Pro Wireless', 'Belkin', '15W Fast Wireless charging stand for iPhone & Android', 4500, 20, 3600, 40, 'SKRB-MOB-015', '/images/products/wireless-charger.jpg', 4.6, 'ACTIVE'),

-- Computers
(2, 22, 'Samsung 990 Pro 2TB SSD', 'Samsung', 'Ultra-fast NVMe Gen4 internal solid state drive', 18500, 12, 16280, 25, 'SKRB-CMP-012', '/images/products/990-pro.jpg', 4.9, 'ACTIVE'),
(2, 15, 'HP LaserJet Pro MFP', 'HP', 'Professional laser printer with scanner and copier', 22499, 10, 20249, 15, 'SKRB-CMP-013', '/images/products/hp-printer.jpg', 4.4, 'ACTIVE'),
(2, 21, 'TP-Link 7-Port USB Hub', 'TP-Link', 'High speed data transfer hub with individual switches', 1299, 25, 974, 100, 'SKRB-CMP-014', '/images/products/usb-hub.jpg', 4.3, 'ACTIVE'),

-- Electronics
(3, 31, 'Sony HT-S40R Home Theatre', 'Sony', 'Real 5.1 channel wireless rear speaker surround system', 24990, 18, 20491, 10, 'SKRB-ELE-008', '/images/products/sony-ht.jpg', 4.7, 'ACTIVE'),
(3, 33, 'Amazon Echo Dot 5th Gen', 'Amazon', 'Smart speaker with Alexa and deep bass', 4499, 30, 3149, 80, 'SKRB-ELE-009', '/images/products/echo-dot.jpg', 4.5, 'ACTIVE'),

-- Entertainment
(4, 38, 'Fire TV Stick 4K Max', 'Amazon', 'Streaming media player with Wi-Fi 6 support', 5999, 25, 4499, 150, 'SKRB-TV-003', '/images/products/fire-stick.jpg', 4.8, 'ACTIVE'),
(4, 43, 'Epson EB-E01 Projector', 'Epson', 'XGA High brightness business and home projector', 34500, 15, 29325, 12, 'SKRB-TV-004', '/images/products/epson.jpg', 4.4, 'ACTIVE'),

-- Fashion
(5, 52, 'Levis Solid Denim Jacket', 'Levis', 'Classic trucker fit original denim jacket for men', 4999, 50, 2499, 65, 'SKRB-MEN-008', '/images/products/denim-jacket.jpg', 4.6, 'ACTIVE'),
(6, 68, 'Titan Raga Women Gold Watch', 'Titan', 'Elegant designer jewelry edition watch for women', 8999, 10, 8099, 30, 'SKRB-WOM-007', '/images/products/titan-raga.jpg', 4.7, 'ACTIVE'),

-- Grocery
(8, 79, 'India Gate Unity Basmati Rice 10 KG', 'India Gate', 'Premium long grain rice for special occasions', 1150, 20, 920, 180, 'SKRB-GRO-010', '/images/products/rice-10kg.jpg', 4.6, 'ACTIVE'),
(8, 88, 'Amul Cow Ghee 5 Litre Jar', 'Amul', 'Pure dairy cow ghee family saver jumbo pack', 3450, 5, 3277, 60, 'SKRB-GRO-011', '/images/products/ghee-5l.jpg', 4.8, 'ACTIVE'),

-- Snacks
(9, 103, 'Red Bull Energy Drink 250ml Pack of 4', 'Red Bull', 'Vitalizes body and mind premium energy drink', 480, 5, 456, 120, 'SKRB-SNK-007', '/images/products/redbull.jpg', 4.5, 'ACTIVE'),

-- Household
(12, 129, 'Dyson V11 Cordless Vacuum Cleaner', 'Dyson', 'Intelligent powerful suction deep cleaning vacuum', 45900, 10, 41310, 8, 'SKRB-CLN-005', '/images/products/dyson.jpg', 4.9, 'ACTIVE'),

-- Gaming
(16, 175, 'PlayStation 5 Console (Disc Edition)', 'Sony', 'Experience lightning fast loading with high speed SSD', 54990, 5, 52240, 5, 'SKRB-GAM-004', '/images/products/ps5.jpg', 4.9, 'ACTIVE'),
(16, 177, 'Xbox Wireless Controller - Robot White', 'Microsoft', 'Modernized design with sculpted surfaces for comfort', 5399, 15, 4589, 45, 'SKRB-GAM-005', '/images/products/xbox-cont.jpg', 4.7, 'ACTIVE');

-- ==========================================
-- 4. MERCHANTS (Partnership Table)
-- ==========================================
CREATE TABLE IF NOT EXISTS merchants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    merchant_id VARCHAR(20) UNIQUE NOT NULL,
    business_name VARCHAR(255) NOT NULL,
    business_type VARCHAR(100),
    pan_number VARCHAR(20),
    gstin VARCHAR(20),
    business_address TEXT,
    terms_accepted BOOLEAN DEFAULT FALSE,
    verification_status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 5. PRODUCT IMAGE STATUS
CREATE TABLE IF NOT EXISTS product_image_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    status ENUM('PENDING', 'GENERATING', 'GENERATED', 'FAILED') DEFAULT 'PENDING',
    error_message TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
