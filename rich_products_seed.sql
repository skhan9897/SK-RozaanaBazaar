-- =============================================================================
-- SKRozaanaBazaar - PREMIUM PRODUCT SEED DATA
-- This script populates high-quality, realistic e-commerce products
-- =============================================================================

-- Note: Ensure categories and subcategories exist before running this.
-- Based on standard IDs from complete_database_sync.sql

-- 1. MOBILES & TABLETS
-- Smartphones (Subcat 1)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(1, 1, 'iPhone 15 Pro Max 256GB - Titanium Blue', 'Apple', 'The ultimate iPhone featuring a strong and light aerospace-grade titanium design. Powered by the A17 Pro chip for next-level gaming and performance.', 159900.00, 5.00, 151905.00, 25, 'SKRB-MOB-001', '/images/products/iphone15promax.jpg', 4.9, 'ACTIVE'),
(1, 1, 'Samsung Galaxy Z Fold5 - Phantom Black', 'Samsung', 'A massive 7.6-inch main screen for immersive gaming and cinematic viewing. The slimmest, lightest Fold yet with a massive battery.', 154999.00, 10.00, 139499.10, 15, 'SKRB-MOB-002', '/images/products/zfold5.jpg', 4.8, 'ACTIVE'),
(1, 1, 'Google Pixel 8 Pro - Obsidian', 'Google', 'The all-pro Google phone with the best Pixel Camera yet, and Google AI to help you do more, even faster.', 106999.00, 8.00, 98439.00, 30, 'SKRB-MOB-003', '/images/products/pixel8pro.jpg', 4.7, 'ACTIVE'),
(1, 1, 'OnePlus 12 5G - Silky Black', 'OnePlus', 'Smooth Beyond Belief. Powered by Snapdragon 8 Gen 3 with up to 16GB RAM and 4th Gen Hasselblad Camera for Mobile.', 64999.00, 5.00, 61749.00, 50, 'SKRB-MOB-004', '/images/products/oneplus12.jpg', 4.6, 'ACTIVE');

-- Tablets (Subcat 2)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(1, 2, 'iPad Pro 12.9-inch (M2 chip) - Silver', 'Apple', 'Brilliant 12.9-inch Liquid Retina XDR display with ProMotion, True Tone, and P3 wide color. M2 chip for incredible performance.', 119900.00, 5.00, 113905.00, 20, 'SKRB-TAB-001', '/images/products/ipadpro12.jpg', 4.9, 'ACTIVE'),
(1, 2, 'Samsung Galaxy Tab S9 Ultra - Graphite', 'Samsung', 'Our largest, most powerful Galaxy Tab S yet. IP68 water and dust resistance, S Pen included, and a massive 14.6" Dynamic AMOLED 2X screen.', 108999.00, 12.00, 95919.00, 15, 'SKRB-TAB-002', '/images/products/tabs9ultra.jpg', 4.8, 'ACTIVE');

-- 2. COMPUTERS & LAPTOPS
-- Laptops (Subcat 16 onwards)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(2, 22, 'MacBook Air M3 - Midnight', 'Apple', 'Strikingly thin and fast, so you can work, play, or create anything — anywhere. Built with the M3 chip for incredible performance and up to 18 hours of battery life.', 114900.00, 7.00, 106857.00, 40, 'SKRB-LAP-001', '/images/products/macbookm3.jpg', 4.9, 'ACTIVE'),
(2, 17, 'Dell XPS 13 Plus - Platinum', 'Dell', 'Our most powerful 13-inch laptop is twice as powerful as before in the same size. It features 13th Gen Intel Core processors and an innovative, modern design.', 169990.00, 15.00, 144491.50, 10, 'SKRB-LAP-002', '/images/products/xps13plus.jpg', 4.7, 'ACTIVE'),
(2, 19, 'ASUS ROG Zephyrus G14 - Eclipse Gray', 'ASUS', 'Powerful, portable, and versatile. The 2024 Zephyrus G14 features a Ryzen 9 processor and RTX 40-series graphics in a 1.5kg chassis.', 149990.00, 10.00, 134991.00, 12, 'SKRB-LAP-003', '/images/products/rog-g14.jpg', 4.8, 'ACTIVE');

-- 3. ELECTRONICS
-- Audio (Subcat 31-40)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(3, 31, 'Sony WH-1000XM5 Noise Cancelling Headphones', 'Sony', 'Industry-leading noise cancellation, exceptional sound quality, and crystal-clear hands-free calling. Up to 30-hour battery life.', 29990.00, 15.00, 25491.50, 60, 'SKRB-AUD-001', '/images/products/sony-xm5.jpg', 4.9, 'ACTIVE'),
(3, 31, 'Apple AirPods Pro (2nd Gen) with MagSafe Case', 'Apple', 'Active Noise Cancellation, Transparency mode, and Personalized Spatial Audio with dynamic head tracking for sound that places you all around.', 24900.00, 10.00, 22410.00, 100, 'SKRB-AUD-002', '/images/products/airpodspro2.jpg', 4.8, 'ACTIVE'),
(3, 35, 'Marshall Stanmore III Bluetooth Speaker', 'Marshall', 'A legendary speaker for any space. Stanmore III has a wider soundstage than its predecessor, delivering home-filling Marshall signature sound.', 41999.00, 20.00, 33599.20, 25, 'SKRB-AUD-003', '/images/products/marshall-stanmore.jpg', 4.7, 'ACTIVE');

-- 4. TV & ENTERTAINMENT
-- Smart TVs (Subcat 38+)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(4, 38, 'Sony BRAVIA XR A80L 65 inch OLED 4K TV', 'Sony', 'Immersive cinematic experience with pure blacks and vibrant colors. Powered by Cognitive Processor XR for sound and picture in perfect harmony.', 249900.00, 25.00, 187425.00, 8, 'SKRB-TV-001', '/images/products/sony-oled.jpg', 4.9, 'ACTIVE'),
(4, 38, 'Samsung 55-inch Neo QLED 4K Smart TV', 'Samsung', 'Quantum Matrix Technology for ultra-fine contrast and detail. Neural Quantum Processor 4K for AI-powered optimization.', 124990.00, 30.00, 87493.00, 15, 'SKRB-TV-002', '/images/products/samsung-qled.jpg', 4.7, 'ACTIVE');

-- 5. MEN FASHION
-- T-Shirts & Shirts (Subcat 51+)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(5, 51, 'Ralph Lauren Classic Fit Polo Shirt', 'Ralph Lauren', 'The definitive polo shirt since 1972. Crafted from highly breathable cotton mesh for a textured look and a soft feel.', 8999.00, 10.00, 8099.10, 150, 'SKRB-MEN-001', '/images/products/rl-polo.jpg', 4.8, 'ACTIVE'),
(5, 52, 'Tommy Hilfiger Slim Fit Oxford Shirt', 'Tommy Hilfiger', 'A timeless wardrobe essential. This slim fit shirt is made from pure organic cotton oxford with iconic flag embroidery.', 6499.00, 20.00, 5199.20, 120, 'SKRB-MEN-002', '/images/products/th-shirt.jpg', 4.6, 'ACTIVE'),
(5, 72, 'Titan Regalia Men Chronograph Watch', 'Titan', 'A sophisticated timepiece with a stainless steel strap and multifunction chronograph dial. Perfect for formal and casual occasions.', 12995.00, 15.00, 11045.75, 45, 'SKRB-MEN-003', '/images/products/titan-regalia.jpg', 4.7, 'ACTIVE');

-- 6. WOMEN FASHION
-- Ethnic & Western (Subcat 76+)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(6, 76, 'FabIndia Silk Blend Banarasi Saree', 'FabIndia', 'Exquisite hand-woven silk blend saree featuring traditional Banarasi motifs. Comes with an unstitched blouse piece.', 18990.00, 5.00, 18040.50, 20, 'SKRB-WOM-001', '/images/products/silk-saree.jpg', 4.9, 'ACTIVE'),
(6, 80, 'Zara Floral Print Midi Dress', 'Zara', 'V-neck midi dress with long sleeves and elastic cuffs. Featuring a vibrant floral print and a flared hem for a graceful look.', 4990.00, 10.00, 4491.00, 80, 'SKRB-WOM-002', '/images/products/zara-dress.jpg', 4.5, 'ACTIVE');

-- 8. GROCERY & FOOD
-- Rice & Dal (Subcat 116+)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(8, 116, 'India Gate Super Premium Basmati Rice - 5kg', 'India Gate', 'Exotic aroma and extra-long grains. Aged to perfection to give you the finest culinary experience for special occasions.', 950.00, 15.00, 807.50, 500, 'SKRB-GRO-001', '/images/products/ig-rice.jpg', 4.8, 'ACTIVE'),
(8, 134, 'Amul A2 Cow Ghee - 1 Litre Tin', 'Amul', 'Pure and traditional cow ghee made from A2 milk. Rich in aroma and grainy texture, perfect for enhancing the taste of your meals.', 750.00, 5.00, 712.50, 300, 'SKRB-GRO-002', '/images/products/amul-ghee.jpg', 4.9, 'ACTIVE'),
(8, 120, 'Organic Tattva Arhar Dal (Tur) - 1kg', 'Organic Tattva', '100% Organic, unpolished and chemical-free. Rich in protein and essential nutrients for a healthy diet.', 240.00, 10.00, 216.00, 400, 'SKRB-GRO-003', '/images/products/tur-dal.jpg', 4.7, 'ACTIVE');

-- 16. GAMING
-- Consoles & Peripherals (Subcat 175+)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(16, 175, 'PlayStation 5 Console (Slim disc edition)', 'Sony', 'Experience lightning-fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback and 3D Audio.', 54990.00, 5.00, 52240.50, 10, 'SKRB-GAM-001', '/images/products/ps5-slim.jpg', 4.9, 'ACTIVE'),
(16, 176, 'Nintendo Switch OLED Model - Neon Blue/Red', 'Nintendo', 'Featuring a vibrant 7-inch OLED screen, a wide adjustable stand, a dock with a wired LAN port, and 64GB of internal storage.', 32990.00, 12.00, 29031.20, 20, 'SKRB-GAM-002', '/images/products/switch-oled.jpg', 4.8, 'ACTIVE'),
(16, 179, 'Logitech G502 Lightspeed Wireless Gaming Mouse', 'Logitech', 'The ultimate wireless gaming mouse with HERO 25K sensor, lightspeed wireless connectivity, and 11 programmable buttons.', 12995.00, 25.00, 9746.25, 40, 'SKRB-GAM-003', '/images/products/g502.jpg', 4.7, 'ACTIVE');

-- =============================================================================
-- END OF SCRIPT
-- =============================================================================
