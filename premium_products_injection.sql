-- =============================================================================
-- SKRozaanaBazaar - PREMIUM PRODUCT INJECTION UTILITY
-- Populates 500+ premium products for Home Page and Today's Deals.
-- Titles use keywords: Galaxy, iPhone, Laptop, Saree, Atta, Rice.
-- These keywords trigger high-quality fallback images in Web and Android.
-- =============================================================================

-- Ensure necessary subcategory IDs are fetched
SET @sub_smartphones = (SELECT id FROM subcategories WHERE subcategory_name = 'Smartphones' LIMIT 1);
SET @sub_laptop = (SELECT id FROM subcategories WHERE subcategory_name = 'MacBook' OR subcategory_name LIKE '%Laptop%' LIMIT 1);
SET @sub_saree = (SELECT id FROM subcategories WHERE subcategory_name = 'Saree' LIMIT 1);
SET @sub_atta = (SELECT id FROM subcategories WHERE subcategory_name = 'Wheat Atta' LIMIT 1);
SET @sub_rice = (SELECT id FROM subcategories WHERE subcategory_name = 'Basmati Rice' LIMIT 1);

-- Fallback to parent category defaults if subcategories not found
SET @cat_mob = (SELECT id FROM categories WHERE category_name = 'Mobiles & Tablets' LIMIT 1);
SET @cat_cmp = (SELECT id FROM categories WHERE category_name = 'Computers & Laptops' LIMIT 1);
SET @cat_wom = (SELECT id FROM categories WHERE category_name = 'Women Fashion' OR category_name = "Women's Fashion" LIMIT 1);
SET @cat_gro = (SELECT id FROM categories WHERE category_name = 'Grocery & Food' LIMIT 1);

-- 1. Galaxy Premium Smartphones (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_mob, @sub_smartphones,
    CONCAT('Samsung Galaxy S24 Ultra Titanium ', n),
    'Samsung', 'Premium flagship with AI-powered features and 200MP camera.',
    129999.00, 10000.00, 119999.00, 50, CONCAT('SKRB-GALAXY-', n), '/images/products/s24.jpg', 4.9, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- 2. iPhone Premium Flagships (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_mob, @sub_smartphones,
    CONCAT('Apple iPhone 15 Pro Max Deep Blue ', n),
    'Apple', 'The ultimate iPhone with Titanium design and A17 Pro chip.',
    159900.00, 5000.00, 154900.00, 40, CONCAT('SKRB-IPHONE-', n), '/images/products/iphone15.jpg', 4.8, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- 3. High-End Laptops (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_cmp, @sub_laptop,
    CONCAT('Premium MacBook Pro M3 Laptop ', n),
    'Apple', 'Next-gen performance with M3 Pro chip and Liquid Retina XDR display.',
    199900.00, 15000.00, 184900.00, 25, CONCAT('SKRB-LAPTOP-', n), '/images/products/macbook.jpg', 4.9, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- 4. Designer Sarees (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_wom, @sub_saree,
    CONCAT('Banarasi Silk Saree Premium ', n),
    'EthnicWear', 'Luxurious silk saree with intricate zari work.',
    15000.00, 3000.00, 12000.00, 100, CONCAT('SKRB-SAREE-', n), '/images/products/saree.jpg', 4.7, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- 5. Premium Atta (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_gro, @sub_atta,
    CONCAT('Premium Wheat Atta 10KG ', n),
    'Aashirvaad', 'Selected grains for the softest rotis.',
    600.00, 50.00, 550.00, 500, CONCAT('SKRB-ATTA-', n), '/images/products/atta.jpg', 4.6, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- 6. Premium Basmati Rice (90 units)
INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status)
SELECT
    @cat_gro, @sub_rice,
    CONCAT('Extra Long Basmati Rice 5KG ', n),
    'India Gate', 'Aged rice with aromatic long grains.',
    950.00, 100.00, 850.00, 300, CONCAT('SKRB-RICE-', n), '/images/products/rice.jpg', 4.7, 'ACTIVE'
FROM (
    WITH RECURSIVE seq AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM seq WHERE n < 90)
    SELECT n FROM seq
) AS numbers;

-- Total: 540 Premium Products Injected.
