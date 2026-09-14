-- SQL Script to bulk insert 50+ Premium Products across Subcategories for SKRozaanaBazaar

-- =====================================================
-- 1. MOBILES & TABLETS (Subcategories: 1=Smartphones, 2=Tablets, 3=Mobile Covers, 4=Chargers, 5=Power Banks)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(1, 1, 'Redmi Note 13 Pro 5G', 'Xiaomi', '200MP Camera smartphone with sleek body', 28999, 10, 26099, 45, 'SKRB-MOB-006', '/images/products/redmi-note-13.jpg', 4.4, 'ACTIVE'),
(1, 1, 'Realme GT 6T', 'Realme', 'Top tier gaming phone with Snapdragon 7+ Gen 3', 30999, 8, 28519, 35, 'SKRB-MOB-007', '/images/products/realme-gt.jpg', 4.5, 'ACTIVE'),
(1, 2, 'iPad Air M2', 'Apple', '11 inch Liquid Retina display tablet with M2 chip', 59900, 5, 56905, 15, 'SKRB-MOB-008', '/images/products/ipad-air.jpg', 4.8, 'ACTIVE'),
(1, 2, 'Galaxy Tab S9 FE', 'Samsung', 'Water and dust resistant premium Android tablet', 36999, 12, 32559, 20, 'SKRB-MOB-009', '/images/products/galaxy-tab.jpg', 4.3, 'ACTIVE'),
(1, 3, 'Spigen Magnetic Rugged Armor Case', 'Spigen', 'MagSafe compatible shock absorption protective cover', 1899, 15, 1614, 150, 'SKRB-MOB-010', '/images/products/spigen-case.jpg', 4.6, 'ACTIVE'),
(1, 4, 'Anker 65W GaN Fast Wall Charger', 'Anker', 'Ultra compact 3-port fast travel charger', 3999, 20, 3199, 60, 'SKRB-MOB-011', '/images/products/anker-charger.jpg', 4.7, 'ACTIVE'),
(1, 5, 'Ambrane 10000mAh Compact Power Bank', 'Ambrane', 'Pocket-sized fast charging power delivery powerbank', 1499, 30, 1049, 120, 'SKRB-MOB-012', '/images/products/ambrane-pb.jpg', 4.2, 'ACTIVE');

-- =====================================================
-- 2. COMPUTERS & LAPS (Subcategories: 6=Laptops, 7=Desktop Computers, 8=Monitors, 9=Keyboard & Mouse, 10=Computer Accessories)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(2, 6, 'MacBook Air M3', 'Apple', 'Supercharged thin laptop with 13.6-inch screen', 114900, 7, 106857, 12, 'SKRB-CMP-005', '/images/products/macbook-m3.jpg', 4.9, 'ACTIVE'),
(2, 6, 'Asus ROG Strix G16 Gaming Laptop', 'Asus', 'High performance core i7 gaming beast', 94999, 10, 85499, 10, 'SKRB-CMP-006', '/images/products/rog-laptop.jpg', 4.6, 'ACTIVE'),
(2, 6, 'Lenovo IdeaPad Slim 3', 'Lenovo', 'Core i3 lightweight laptop for students', 38999, 15, 33149, 25, 'SKRB-CMP-007', '/images/products/ideapad.jpg', 4.1, 'ACTIVE'),
(2, 8, 'BenQ 27 Inch 4K Designer Monitor', 'BenQ', 'Professional IPS monitor with HDR10 for editors', 28500, 10, 25650, 18, 'SKRB-CMP-008', '/images/products/benq-monitor.jpg', 4.5, 'ACTIVE'),
(2, 9, 'Logitech MX Master 3S Wireless Mouse', 'Logitech', 'Ergonomic precision scrolling performance mouse', 8995, 12, 7915, 40, 'SKRB-CMP-009', '/images/products/mx-master.jpg', 4.8, 'ACTIVE'),
(2, 10, 'Crucial X9 Pro 1TB Portable SSD', 'Crucial', 'High speed external solid state drive for backup', 9999, 25, 7499, 50, 'SKRB-CMP-010', '/images/products/crucial-ssd.jpg', 4.6, 'ACTIVE'),
(2, 10, 'SanDisk Ultra 64GB USB 3.0 Pen Drive', 'SanDisk', 'High speed flash drive for secure storage data transfer', 850, 30, 595, 300, 'SKRB-CMP-011', '/images/products/sandisk-pd.jpg', 4.4, 'ACTIVE');

-- =====================================================
-- 3. ELECTRONICS (Subcategories: 11=Earbuds, 12=Headphones, 13=Bluetooth Speakers, 14=Microphones)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(3, 11, 'Sony WF-1000XM5 ANC Earbuds', 'Sony', 'Industry leading noise canceling wireless premium earbuds', 24990, 15, 21241, 20, 'SKRB-ELE-004', '/images/products/sony-buds.jpg', 4.7, 'ACTIVE'),
(3, 11, 'OnePlus Buds 3', 'OnePlus', 'Dual dynamic drivers earbuds with sliding volume control', 5499, 10, 4949, 90, 'SKRB-ELE-005', '/images/products/op-buds.jpg', 4.4, 'ACTIVE'),
(3, 12, 'boAt Rockerz 450 Pro Headphones', 'boAt', 'On-ear wireless headphones with massive 70H playback time', 2999, 40, 1799, 110, 'SKRB-ELE-006', '/images/products/boat-450.jpg', 4.2, 'ACTIVE'),
(3, 13, 'JBL Flip 6 Waterproof Speaker', 'JBL', 'Powerful 2-way speaker system with outdoor deep bass booster', 11999, 17, 9959, 65, 'SKRB-ELE-007', '/images/products/jbl-flip6.jpg', 4.6, 'ACTIVE');

-- =====================================================
-- 5. MEN FASHION (Subcategories: 19=T-Shirts, 20=Shirts, 21=Jeans, 22=Shoes, 23=Watches)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(5, 19, 'Puma Men Slim Fit Polo T-Shirt', 'Puma', 'Classic sporty short sleeve premium polo shirt', 1999, 35, 1299, 85, 'SKRB-MEN-004', '/images/products/puma-polo.jpg', 4.3, 'ACTIVE'),
(5, 20, 'Dennis Lingo Men Slim Fit Cotton Shirt', 'Dennis Lingo', 'Premium solid casual shirt for everyday styling look', 1849, 60, 739, 120, 'SKRB-MEN-005', '/images/products/dl-shirt.jpg', 4.0, 'ACTIVE'),
(5, 22, 'Nike Air Max Men Running Shoes', 'Nike', 'Premium cushioned sports training running lifestyle shoes', 8295, 10, 7465, 30, 'SKRB-MEN-006', '/images/products/nike-air.jpg', 4.7, 'ACTIVE'),
(5, 23, 'Casio Vintage Digital Men Watch', 'Casio', 'Iconic steel band gold dial digital vintage edition watch', 5995, 5, 5695, 40, 'SKRB-MEN-007', '/images/products/casio-vintage.jpg', 4.6, 'ACTIVE');

-- =====================================================
-- 6. WOMEN FASHION (Subcategories: 24=Sarees, 25=Kurtis, 26=Dresses, 27=Handbags, 28=Women Footwear)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(6, 24, 'Kani Silk Banarasi Designer Saree', 'SK Silk', 'Traditional heavy woven zari border banquet festive wear saree', 4999, 40, 2999, 25, 'SKRB-WOM-004', '/images/products/banarasi.jpg', 4.5, 'ACTIVE'),
(6, 25, 'Biba Straight Cotton Women Kurti', 'Biba', 'Casual ethnic wear daily comfort standard brand floral print kurti', 2199, 30, 1539, 70, 'SKRB-WOM-005', '/images/products/biba-kurti.jpg', 4.2, 'ACTIVE'),
(6, 27, 'Lavie Women Faux Leather Handbag', 'Lavie', 'Elegant spacious top handle office shoulder tote handbag for ladies', 3499, 55, 1574, 95, 'SKRB-WOM-006', '/images/products/lavie-bag.jpg', 4.3, 'ACTIVE');

-- =====================================================
-- 7. KIDS & BABY (Subcategories: 29=Baby Care, 30=Kids Clothing, 31=Toys, 32=Kids Footwear)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(7, 29, 'Pampers All Round Protection Baby Diapers L-Size', 'Pampers', 'Anti rash ultra absorb 64 counts daily baby diapers pants package', 1199, 15, 1019, 140, 'SKRB-KID-003', '/images/products/pampers.jpg', 4.6, 'ACTIVE'),
(7, 29, 'Johnson\'s Baby Soft Wipes Multi Pack', 'Johnson\'s', 'Alcohol free skin safe pure water baby cleaning wet wipes pack of 3', 450, 10, 405, 200, 'SKRB-KID-004', '/images/products/wipes.jpg', 4.5, 'ACTIVE'),
(7, 31, 'LEGO Classic Creative Building Blocks Set', 'LEGO', 'Creative educational learning brick construction toy set for toddlers', 1999, 5, 1899, 45, 'SKRB-KID-005', '/images/products/lego.jpg', 4.8, 'ACTIVE');

-- =====================================================
-- 8. GROCERY & FOOD (Subcategories: 33=Atta & Flour, 34=Rice, 35=Dal & Pulses, 36=Oil & Ghee, 37=Spices)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(8, 33, 'Pillsbury Chakki Fresh Atta 10 KG', 'Pillsbury', '100 percent pure whole wheat soft rotis specialized wholewheat flour', 580, 8, 533, 100, 'SKRB-GRO-006', '/images/products/pillsbury.jpg', 4.4, 'ACTIVE'),
(8, 34, 'Daawat Rozana Super Basmati Rice 5 KG', 'Daawat', 'Perfectly aged long grain rich aroma everyday basmati rice pack', 475, 15, 403, 120, 'SKRB-GRO-007', '/images/products/daawat.jpg', 4.3, 'ACTIVE'),
(8, 35, 'Organic Moong Dal Mogar 1 KG', 'Tata Sampann', 'Unpolished protein rich healthy organic split yellow moong dal packet', 210, 12, 184, 150, 'SKRB-GRO-008', '/images/products/moong.jpg', 4.5, 'ACTIVE'),
(8, 36, 'Cow Pure Desi Ghee 1 Litre Tin', 'Amul', 'Traditional granular rich taste pure dairy cow ghee standard container', 720, 5, 684, 90, 'SKRB-GRO-009', '/images/products/amul-ghee.jpg', 4.7, 'ACTIVE');

-- =====================================================
-- 9. SNACKS & BEVERAGES (Subcategories: 38=Biscuits, 39=Chips & Snacks, 40=Tea & Coffee, 41=Cold Drinks)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(9, 38, 'Oreo Chocolate Cream Biscuits Combo Pack', 'Oreo', 'Rich smooth sandwich cream biscuits family treat crunchy pack of 4', 120, 10, 108, 250, 'SKRB-SNK-004', '/images/products/oreo.jpg', 4.4, 'ACTIVE'),
(9, 40, 'Nescafe Classic Instant Coffee Powder 100g', 'Nescafe', '100 percent pure robust rich aroma instant coffee premium glass jar', 360, 5, 342, 140, 'SKRB-SNK-005', '/images/products/nescafe.jpg', 4.6, 'ACTIVE'),
(9, 41, 'Coca Cola Soft Drink 2 Litre Bottle', 'Coca Cola', 'Refreshing carbonated zero fat cold soft drink family jumbo plastic bottle', 100, 15, 85, 200, 'SKRB-SNK-006', '/images/products/coke.jpg', 4.5, 'ACTIVE');

-- =====================================================
-- 10. BEAUTY & PERSONAL CARE (Subcategories: 42=Skin Care, 43=Hair Care, 44=Makeup, 45=Personal Care)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(10, 42, 'L\'Oreal Paris Glycolic Bright Serum', 'L\'Oreal', 'Skin brightening dark spots reduction clarifying face active serum', 799, 20, 639, 85, 'SKRB-BEA-004', '/images/products/loreal-serum.jpg', 4.3, 'ACTIVE'),
(10, 43, 'Biotique Walnut Bark Hair Volumizing Shampoo', 'Biotique', 'Natural fresh therapy herbal volumizing organic premium thinning shampoo', 299, 25, 224, 100, 'SKRB-BEA-005', '/images/products/biotique.jpg', 4.1, 'ACTIVE'),
(10, 44, 'Maybelline New York Colossal Kajal Waterproof', 'Maybelline', '24H long lasting intense black smudgeproof soothing eye liner stick', 399, 15, 339, 130, 'SKRB-BEA-006', '/images/products/kajal.jpg', 4.5, 'ACTIVE');

-- =====================================================
-- 11. HOME & KITCHEN (Subcategories: 46=Kitchen, 47=Kitchen Appliances, 48=Home Decor, 49=Home Furnishing)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(11, 47, 'Bajaj Majesty DX 7 Lightweight Dry Iron', 'Bajaj', '1000W non-stick coated golden soleplate automatic heavy heat safe iron', 1299, 30, 909, 50, 'SKRB-HOM-004', '/images/products/iron.jpg', 4.3, 'ACTIVE'),
(11, 49, 'Premium Cotton Double Bedsheet with 2 Pillow Covers', 'Bombay Dyeing', '100 percent pure combed fine luxury dynamic floral pattern bedsheet king size', 2499, 45, 1374, 60, 'SKRB-HOM-005', '/images/products/bedsheet.jpg', 4.4, 'ACTIVE');

-- =====================================================
-- 12. CLEANING & HOUSEHOLD (Subcategories: 50=Laundry, 51=Floor Cleaning, 52=Bathroom Cleaning, 53=Cleaning Tools)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(12, 50, 'Vanish All in One Fabric Stain Remover Liquid', 'Vanish', 'Whiter brightener safe regular laundry oxygen action power wash booster 1L', 349, 10, 314, 120, 'SKRB-CLN-003', '/images/products/vanish.jpg', 4.5, 'ACTIVE'),
(12, 52, 'Harpic Disinfectant Toilet Cleaner Liquid Combo Pack', 'Harpic', 'Kill 99.9 percent germs maximum scale yellow stain removal fresh liquid 1L+1L', 410, 15, 348, 160, 'SKRB-CLN-004', '/images/products/harpic.jpg', 4.6, 'ACTIVE');

-- =====================================================
-- 13. FURNITURE (Subcategories: 54=Sofa, 55=Beds, 56=Tables, 57=Chairs)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(13, 57, 'Green Soul Ergonomic Office Chair', 'Green Soul', 'High back breathable mesh dynamic lumbar support revolving computer chair', 14999, 40, 8999, 15, 'SKRB-FUR-003', '/images/products/office-chair.jpg', 4.6, 'ACTIVE');

-- =====================================================
-- 14. ELECTRICAL (Subcategories: 58=LED Bulbs, 59=Fans, 60=Switches & Sockets, 61=Inverters)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(14, 58, 'Syska 12W Smart Wi-Fi LED Bulb Compatible with Alexa', 'Syska', '16 million color shades multi dimming timer control automation smart bulb', 999, 50, 499, 80, 'SKRB-ELC-003', '/images/products/syska-bulb.jpg', 4.2, 'ACTIVE');

-- =====================================================
-- 15. SPORTS & FITNESS (Subcategories: 62=Cricket, 63=Football, 64=Badminton, 65=Fitness Equipment)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(15, 63, 'Nivia Storm Rubber Outer Football', 'Nivia', 'Official training standard 32 panels official match safe durable football size 5', 749, 20, 599, 90, 'SKRB-SPT-004', '/images/products/nivia-fb.jpg', 4.3, 'ACTIVE');

-- =====================================================
-- 19. BAGS & LUGGAGE (Subcategories: 78=Backpacks, 79=Laptop Bags, 80=Travel Bags, 81=Trolley Bags)
-- =====================================================
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES
(19, 78, 'Safari 35L Waterproof Travel Backpack', 'Safari', '3 spacious compartments durable quick access pocket daypack heavy mesh bag', 2399, 60, 959, 110, 'SKRB-BAG-003', '/images/products/safari-bag.jpg', 4.2, 'ACTIVE');
