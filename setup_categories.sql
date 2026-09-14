-- Full SQL Script to populate all 22 categories and their subcategories for SKRozaanaBazaar

TRUNCATE TABLE categories;

-- 1. Mobiles & Tablets
INSERT INTO categories (category_name, parent_id, status) VALUES ('Mobiles & Tablets', 0, 'active');
SET @cat1 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Smartphones', @cat1, 'active'), ('Tablets', @cat1, 'active'), ('Mobile Covers', @cat1, 'active'),
('Screen Guards', @cat1, 'active'), ('Tempered Glass', @cat1, 'active'), ('Chargers', @cat1, 'active'),
('USB Cables', @cat1, 'active'), ('Lightning Cables', @cat1, 'active'), ('Power Banks', @cat1, 'active'),
('Mobile Stands', @cat1, 'active'), ('Car Mobile Holders', @cat1, 'active'), ('Selfie Sticks', @cat1, 'active'),
('OTG Adapters', @cat1, 'active'), ('Wireless Chargers', @cat1, 'active'), ('SIM Adapters', @cat1, 'active');

-- 2. Computers & Laptops
INSERT INTO categories (category_name, parent_id, status) VALUES ('Computers & Laptops', 0, 'active');
SET @cat2 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('HP Laptop', @cat2, 'active'), ('Dell Laptop', @cat2, 'active'), ('Lenovo Laptop', @cat2, 'active'),
('Asus Laptop', @cat2, 'active'), ('Acer Laptop', @cat2, 'active'), ('MSI Laptop', @cat2, 'active'),
('MacBook', @cat2, 'active'), ('Desktop', @cat2, 'active'), ('Monitor', @cat2, 'active'),
('Keyboard', @cat2, 'active'), ('Mouse', @cat2, 'active'), ('Webcam', @cat2, 'active'),
('Speakers', @cat2, 'active'), ('UPS', @cat2, 'active'), ('Printer', @cat2, 'active'),
('Scanner', @cat2, 'active'), ('Laptop Bag', @cat2, 'active'), ('Laptop Stand', @cat2, 'active'),
('Cooling Pad', @cat2, 'active'), ('HDMI Cable', @cat2, 'active'), ('USB Hub', @cat2, 'active'),
('SSD', @cat2, 'active'), ('HDD', @cat2, 'active'), ('RAM', @cat2, 'active'),
('Pen Drive', @cat2, 'active'), ('Memory Card', @cat2, 'active');

-- 3. Electronics
INSERT INTO categories (category_name, parent_id, status) VALUES ('Electronics', 0, 'active');
SET @cat3 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Bluetooth Earbuds', @cat3, 'active'), ('Bluetooth Headphones', @cat3, 'active'), ('Wired Earphones', @cat3, 'active'),
('Wireless Headphones', @cat3, 'active'), ('Bluetooth Speakers', @cat3, 'active'), ('Soundbar', @cat3, 'active'),
('Home Theatre', @cat3, 'active'), ('Microphone', @cat3, 'active'), ('Smart Speaker', @cat3, 'active'),
('Radio', @cat3, 'active'), ('MP3 Player', @cat3, 'active'), ('Gaming Headset', @cat3, 'active');

-- 4. TV & Entertainment
INSERT INTO categories (category_name, parent_id, status) VALUES ('TV & Entertainment', 0, 'active');
SET @cat4 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('LED TV', @cat4, 'active'), ('Smart TV', @cat4, 'active'), ('Android TV', @cat4, 'active'),
('QLED TV', @cat4, 'active'), ('OLED TV', @cat4, 'active'), ('TV Stick', @cat4, 'active'),
('Set Top Box', @cat4, 'active'), ('DTH Accessories', @cat4, 'active'), ('TV Wall Mount', @cat4, 'active'),
('HDMI Cable', @cat4, 'active'), ('Remote', @cat4, 'active'), ('Projector', @cat4, 'active'),
('Projector Screen', @cat4, 'active');

-- 5. Men's Fashion
INSERT INTO categories (category_name, parent_id, status) VALUES ("Men's Fashion", 0, 'active');
SET @cat5 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('T-Shirts', @cat5, 'active'), ('Shirts', @cat5, 'active'), ('Jeans', @cat5, 'active'),
('Trousers', @cat5, 'active'), ('Formal Pants', @cat5, 'active'), ('Track Pants', @cat5, 'active'),
('Shorts', @cat5, 'active'), ('Kurta', @cat5, 'active'), ('Sherwani', @cat5, 'active'),
('Blazer', @cat5, 'active'), ('Suit', @cat5, 'active'), ('Jacket', @cat5, 'active'),
('Sweatshirt', @cat5, 'active'), ('Hoodie', @cat5, 'active'), ('Innerwear', @cat5, 'active'),
('Night Suit', @cat5, 'active'), ('Belt', @cat5, 'active'), ('Wallet', @cat5, 'active'),
('Sunglasses', @cat5, 'active'), ('Cap', @cat5, 'active'), ('Tie', @cat5, 'active'),
('Watch', @cat5, 'active'), ('Backpack', @cat5, 'active');

-- 6. Women's Fashion
INSERT INTO categories (category_name, parent_id, status) VALUES ("Women's Fashion", 0, 'active');
SET @cat6 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Saree', @cat6, 'active'), ('Kurti', @cat6, 'active'), ('Salwar Suit', @cat6, 'active'),
('Lehenga', @cat6, 'active'), ('Dress', @cat6, 'active'), ('Top', @cat6, 'active'),
('Jeans', @cat6, 'active'), ('T-Shirt', @cat6, 'active'), ('Palazzo', @cat6, 'active'),
('Leggings', @cat6, 'active'), ('Skirt', @cat6, 'active'), ('Night Suit', @cat6, 'active'),
('Dupatta', @cat6, 'active'), ('Ethnic Wear', @cat6, 'active'), ('Western Wear', @cat6, 'active'),
('Innerwear', @cat6, 'active'), ('Handbag', @cat6, 'active'), ('Purse', @cat6, 'active'),
('Wallet', @cat6, 'active'), ('Sunglasses', @cat6, 'active'), ('Watch', @cat6, 'active'),
('Scarf', @cat6, 'active'), ('Hair Accessories', @cat6, 'active');

-- 7. Kids & Baby
INSERT INTO categories (category_name, parent_id, status) VALUES ('Kids & Baby', 0, 'active');
SET @cat7 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Baby Diapers', @cat7, 'active'), ('Baby Wipes', @cat7, 'active'), ('Baby Powder', @cat7, 'active'),
('Baby Shampoo', @cat7, 'active'), ('Baby Soap', @cat7, 'active'), ('Baby Lotion', @cat7, 'active'),
('Baby Oil', @cat7, 'active'), ('Feeding Bottle', @cat7, 'active'), ('Baby Food', @cat7, 'active'),
('Baby Clothes', @cat7, 'active'), ('Boys T-Shirt', @cat7, 'active'), ('Boys Shirt', @cat7, 'active'),
('Boys Jeans', @cat7, 'active'), ('Girls Dress', @cat7, 'active'), ('Girls Top', @cat7, 'active'),
('Girls Jeans', @cat7, 'active'), ('Kids Shoes', @cat7, 'active'), ('School Uniform', @cat7, 'active'),
('Remote Car', @cat7, 'active'), ('Doll', @cat7, 'active'), ('Teddy Bear', @cat7, 'active'),
('Building Blocks', @cat7, 'active'), ('Puzzle', @cat7, 'active'), ('Board Games', @cat7, 'active'),
('Educational Toys', @cat7, 'active'), ('Action Figures', @cat7, 'active'), ('Musical Toys', @cat7, 'active');

-- 8. Grocery & Food
INSERT INTO categories (category_name, parent_id, status) VALUES ('Grocery & Food', 0, 'active');
SET @cat8 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Wheat Atta', @cat8, 'active'), ('Multigrain Atta', @cat8, 'active'), ('Maida', @cat8, 'active'),
('Besan', @cat8, 'active'), ('Suji', @cat8, 'active'), ('Rice Flour', @cat8, 'active'),
('Corn Flour', @cat8, 'active'), ('Basmati Rice', @cat8, 'active'), ('Sona Masoori Rice', @cat8, 'active'),
('Brown Rice', @cat8, 'active'), ('Broken Rice', @cat8, 'active'), ('Toor Dal', @cat8, 'active'),
('Moong Dal', @cat8, 'active'), ('Masoor Dal', @cat8, 'active'), ('Chana Dal', @cat8, 'active'),
('Urad Dal', @cat8, 'active'), ('Rajma', @cat8, 'active'), ('Kabuli Chana', @cat8, 'active'),
('Black Chana', @cat8, 'active'), ('Mustard Oil', @cat8, 'active'), ('Sunflower Oil', @cat8, 'active'),
('Soybean Oil', @cat8, 'active'), ('Groundnut Oil', @cat8, 'active'), ('Coconut Oil', @cat8, 'active'),
('Olive Oil', @cat8, 'active'), ('Ghee', @cat8, 'active'), ('Butter', @cat8, 'active'),
('Turmeric', @cat8, 'active'), ('Red Chilli', @cat8, 'active'), ('Coriander Powder', @cat8, 'active'),
('Cumin', @cat8, 'active'), ('Garam Masala', @cat8, 'active'), ('Black Pepper', @cat8, 'active'),
('Cardamom', @cat8, 'active'), ('Cloves', @cat8, 'active'), ('Cinnamon', @cat8, 'active'),
('Hing', @cat8, 'active'), ('Sugar', @cat8, 'active'), ('Brown Sugar', @cat8, 'active'),
('Jaggery', @cat8, 'active'), ('Salt', @cat8, 'active'), ('Rock Salt', @cat8, 'active');

-- 9. Snacks & Beverages
INSERT INTO categories (category_name, parent_id, status) VALUES ('Snacks & Beverages', 0, 'active');
SET @cat9 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Parle-G', @cat9, 'active'), ('Good Day', @cat9, 'active'), ('Marie', @cat9, 'active'),
('Oreo', @cat9, 'active'), ('Bourbon', @cat9, 'active'), ('Hide & Seek', @cat9, 'active'),
('Cream Biscuits', @cat9, 'active'), ('Chips', @cat9, 'active'), ('Namkeen', @cat9, 'active'),
('Bhujia', @cat9, 'active'), ('Popcorn', @cat9, 'active'), ('Nachos', @cat9, 'active'),
('Mixture', @cat9, 'active'), ('Tea', @cat9, 'active'), ('Coffee', @cat9, 'active'),
('Green Tea', @cat9, 'active'), ('Soft Drinks', @cat9, 'active'), ('Juice', @cat9, 'active'),
('Energy Drinks', @cat9, 'active'), ('Health Drinks', @cat9, 'active'), ('Packaged Water', @cat9, 'active');

-- 10. Beauty & Personal Care
INSERT INTO categories (category_name, parent_id, status) VALUES ('Beauty & Personal Care', 0, 'active');
SET @cat10 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Face Wash', @cat10, 'active'), ('Face Cream', @cat10, 'active'), ('Moisturizer', @cat10, 'active'),
('Sunscreen', @cat10, 'active'), ('Face Serum', @cat10, 'active'), ('Face Mask', @cat10, 'active'),
('Toner', @cat10, 'active'), ('Lip Balm', @cat10, 'active'), ('Shampoo', @cat10, 'active'),
('Conditioner', @cat10, 'active'), ('Hair Oil', @cat10, 'active'), ('Hair Serum', @cat10, 'active'),
('Hair Gel', @cat10, 'active'), ('Hair Color', @cat10, 'active'), ('Hair Cream', @cat10, 'active'),
('Foundation', @cat10, 'active'), ('Compact', @cat10, 'active'), ('Lipstick', @cat10, 'active'),
('Lip Gloss', @cat10, 'active'), ('Kajal', @cat10, 'active'), ('Eyeliner', @cat10, 'active'),
('Mascara', @cat10, 'active'), ('Nail Polish', @cat10, 'active'), ('Makeup Kit', @cat10, 'active'),
('Soap', @cat10, 'active'), ('Body Wash', @cat10, 'active'), ('Body Lotion', @cat10, 'active'),
('Deodorant', @cat10, 'active'), ('Perfume', @cat10, 'active'), ('Shaving Cream', @cat10, 'active'),
('Razor', @cat10, 'active'), ('Toothpaste', @cat10, 'active'), ('Toothbrush', @cat10, 'active');

-- 11. Home & Kitchen
INSERT INTO categories (category_name, parent_id, status) VALUES ('Home & Kitchen', 0, 'active');
SET @cat11 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Pressure Cooker', @cat11, 'active'), ('Fry Pan', @cat11, 'active'), ('Tawa', @cat11, 'active'),
('Kadhai', @cat11, 'active'), ('Saucepan', @cat11, 'active'), ('Knife', @cat11, 'active'),
('Chopping Board', @cat11, 'active'), ('Kitchen Containers', @cat11, 'active'), ('Lunch Box', @cat11, 'active'),
('Water Bottle', @cat11, 'active'), ('Dinner Set', @cat11, 'active'), ('Glass Set', @cat11, 'active'),
('Cup & Mug', @cat11, 'active'), ('Mixer Grinder', @cat11, 'active'), ('Juicer', @cat11, 'active'),
('Electric Kettle', @cat11, 'active'), ('Induction', @cat11, 'active'), ('Microwave', @cat11, 'active'),
('Air Fryer', @cat11, 'active'), ('Toaster', @cat11, 'active'), ('Sandwich Maker', @cat11, 'active'),
('Rice Cooker', @cat11, 'active'), ('Hand Blender', @cat11, 'active'), ('Bedsheet', @cat11, 'active'),
('Blanket', @cat11, 'active'), ('Pillow', @cat11, 'active'), ('Curtains', @cat11, 'active'),
('Carpet', @cat11, 'active'), ('Floor Mat', @cat11, 'active'), ('Cushion', @cat11, 'active'),
('Wall Clock', @cat11, 'active'), ('Mirror', @cat11, 'active'), ('Table Lamp', @cat11, 'active');

-- 12. Cleaning & Household
INSERT INTO categories (category_name, parent_id, status) VALUES ('Cleaning & Household', 0, 'active');
SET @cat12 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Floor Cleaner', @cat12, 'active'), ('Toilet Cleaner', @cat12, 'active'), ('Dishwash Liquid', @cat12, 'active'),
('Dishwash Bar', @cat12, 'active'), ('Detergent Powder', @cat12, 'active'), ('Detergent Liquid', @cat12, 'active'),
('Fabric Conditioner', @cat12, 'active'), ('Glass Cleaner', @cat12, 'active'), ('Disinfectant', @cat12, 'active'),
('Hand Wash', @cat12, 'active'), ('Garbage Bags', @cat12, 'active'), ('Broom', @cat12, 'active'),
('Mop', @cat12, 'active'), ('Dustpan', @cat12, 'active'), ('Scrubbers', @cat12, 'active'),
('Cleaning Brush', @cat12, 'active'), ('Air Freshener', @cat12, 'active');

-- 13. Furniture
INSERT INTO categories (category_name, parent_id, status) VALUES ('Furniture', 0, 'active');
SET @cat13 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Sofa', @cat13, 'active'), ('Bed', @cat13, 'active'), ('Mattress', @cat13, 'active'),
('Wardrobe', @cat13, 'active'), ('Study Table', @cat13, 'active'), ('Office Table', @cat13, 'active'),
('Computer Table', @cat13, 'active'), ('Dining Table', @cat13, 'active'), ('Dining Chair', @cat13, 'active'),
('Office Chair', @cat13, 'active'), ('Bookshelf', @cat13, 'active'), ('Shoe Rack', @cat13, 'active'),
('TV Unit', @cat13, 'active'), ('Side Table', @cat13, 'active'), ('Coffee Table', @cat13, 'active');

-- 14. Electrical
INSERT INTO categories (category_name, parent_id, status) VALUES ('Electrical', 0, 'active');
SET @cat14 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('LED Bulb', @cat14, 'active'), ('Tube Light', @cat14, 'active'), ('Smart Bulb', @cat14, 'active'),
('Ceiling Light', @cat14, 'active'), ('Table Lamp', @cat14, 'active'), ('Emergency Light', @cat14, 'active'),
('Extension Board', @cat14, 'active'), ('Multi Plug', @cat14, 'active'), ('Switch', @cat14, 'active'),
('Socket', @cat14, 'active'), ('Fan', @cat14, 'active'), ('Ceiling Fan', @cat14, 'active'),
('Table Fan', @cat14, 'active'), ('Exhaust Fan', @cat14, 'active'), ('Voltage Stabilizer', @cat14, 'active'),
('Inverter', @cat14, 'active'), ('Battery', @cat14, 'active');

-- 15. Sports & Fitness
INSERT INTO categories (category_name, parent_id, status) VALUES ('Sports & Fitness', 0, 'active');
SET @cat15 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Cricket Bat', @cat15, 'active'), ('Cricket Ball', @cat15, 'active'), ('Cricket Gloves', @cat15, 'active'),
('Cricket Helmet', @cat15, 'active'), ('Football', @cat15, 'active'), ('Football Shoes', @cat15, 'active'),
('Basketball', @cat15, 'active'), ('Volleyball', @cat15, 'active'), ('Badminton Racket', @cat15, 'active'),
('Shuttlecock', @cat15, 'active'), ('Tennis Racket', @cat15, 'active'), ('Skipping Rope', @cat15, 'active'),
('Yoga Mat', @cat15, 'active'), ('Dumbbells', @cat15, 'active'), ('Resistance Band', @cat15, 'active'),
('Gym Gloves', @cat15, 'active'), ('Water Bottle', @cat15, 'active'), ('Treadmill', @cat15, 'active'),
('Exercise Bike', @cat15, 'active');

-- 16. Gaming
INSERT INTO categories (category_name, parent_id, status) VALUES ('Gaming', 0, 'active');
SET @cat16 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Gaming Console', @cat16, 'active'), ('PlayStation', @cat16, 'active'), ('Xbox', @cat16, 'active'),
('Gaming Controller', @cat16, 'active'), ('Gaming Mouse', @cat16, 'active'), ('Gaming Keyboard', @cat16, 'active'),
('Gaming Headset', @cat16, 'active'), ('Gaming Chair', @cat16, 'active'), ('Gaming Monitor', @cat16, 'active'),
('Gaming Mouse Pad', @cat16, 'active'), ('Game CDs', @cat16, 'active'), ('VR Headset', @cat16, 'active');

-- 17. Automotive
INSERT INTO categories (category_name, parent_id, status) VALUES ('Automotive', 0, 'active');
SET @cat17 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Car Perfume', @cat17, 'active'), ('Car Charger', @cat17, 'active'), ('Car Cover', @cat17, 'active'),
('Car Mobile Holder', @cat17, 'active'), ('Seat Cover', @cat17, 'active'), ('Steering Cover', @cat17, 'active'),
('Floor Mat', @cat17, 'active'), ('Car Vacuum Cleaner', @cat17, 'active'), ('Dashboard Accessories', @cat17, 'active'),
('Cleaning Kit', @cat17, 'active'), ('Helmet', @cat17, 'active'), ('Bike Cover', @cat17, 'active'),
('Riding Gloves', @cat17, 'active'), ('Bike Lock', @cat17, 'active'), ('Bike Mobile Holder', @cat17, 'active'),
('Riding Jacket', @cat17, 'active'), ('Knee Guard', @cat17, 'active'), ('Bike Cleaning Kit', @cat17, 'active');

-- 18. Footwear
INSERT INTO categories (category_name, parent_id, status) VALUES ('Footwear', 0, 'active');
SET @cat18 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Sports Shoes', @cat18, 'active'), ('Running Shoes', @cat18, 'active'), ('Formal Shoes', @cat18, 'active'),
('Casual Shoes', @cat18, 'active'), ('Loafers', @cat18, 'active'), ('Sandals', @cat18, 'active'),
('Slippers', @cat18, 'active'), ('Boots', @cat18, 'active'), ('Heels', @cat18, 'active'),
('Flats', @cat18, 'active'), ('Sneakers', @cat18, 'active'), ('Wedges', @cat18, 'active'),
('School Shoes', @cat18, 'active');

-- 19. Bags & Luggage
INSERT INTO categories (category_name, parent_id, status) VALUES ('Bags & Luggage', 0, 'active');
SET @cat19 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Backpack', @cat19, 'active'), ('Laptop Bag', @cat19, 'active'), ('School Bag', @cat19, 'active'),
('College Bag', @cat19, 'active'), ('Handbag', @cat19, 'active'), ('Sling Bag', @cat19, 'active'),
('Travel Bag', @cat19, 'active'), ('Trolley Bag', @cat19, 'active'), ('Suitcase', @cat19, 'active'),
('Duffel Bag', @cat19, 'active'), ('Gym Bag', @cat19, 'active'), ('Wallet', @cat19, 'active'),
('Passport Holder', @cat19, 'active');

-- 20. Books & Stationery
INSERT INTO categories (category_name, parent_id, status) VALUES ('Books & Stationery', 0, 'active');
SET @cat20 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('School Books', @cat20, 'active'), ('College Books', @cat20, 'active'), ('Competitive Exam Books', @cat20, 'active'),
('Novels', @cat20, 'active'), ('Story Books', @cat20, 'active'), ('Children\'s Books', @cat20, 'active'),
('Notebooks', @cat20, 'active'), ('Diary', @cat20, 'active'), ('Pen', @cat20, 'active'),
('Pencil', @cat20, 'active'), ('Marker', @cat20, 'active'), ('Highlighter', @cat20, 'active'),
('Eraser', @cat20, 'active'), ('Sharpener', @cat20, 'active'), ('Geometry Box', @cat20, 'active'),
('School Stationery', @cat20, 'active'), ('Office Stationery', @cat20, 'active');

-- 21. Pet Supplies
INSERT INTO categories (category_name, parent_id, status) VALUES ('Pet Supplies', 0, 'active');
SET @cat21 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Dog Food', @cat21, 'active'), ('Cat Food', @cat21, 'active'), ('Pet Treats', @cat21, 'active'),
('Pet Shampoo', @cat21, 'active'), ('Pet Soap', @cat21, 'active'), ('Pet Collar', @cat21, 'active'),
('Pet Leash', @cat21, 'active'), ('Pet Bed', @cat21, 'active'), ('Pet Bowl', @cat21, 'active'),
('Pet Toys', @cat21, 'active'), ('Pet Grooming Kit', @cat21, 'active'), ('Pet Cleaning Products', @cat21, 'active');

-- 22. Tools & Hardware
INSERT INTO categories (category_name, parent_id, status) VALUES ('Tools & Hardware', 0, 'active');
SET @cat22 = LAST_INSERT_ID();
INSERT INTO categories (category_name, parent_id, status) VALUES
('Screwdriver Set', @cat22, 'active'), ('Hammer', @cat22, 'active'), ('Pliers', @cat22, 'active'),
('Drill Machine', @cat22, 'active'), ('Measuring Tape', @cat22, 'active'), ('Wrench Set', @cat22, 'active'),
('Cutter', @cat22, 'active'), ('Tool Box', @cat22, 'active'), ('Nails', @cat22, 'active'),
('Screws', @cat22, 'active'), ('Wall Hooks', @cat22, 'active'), ('Adhesive', @cat22, 'active'),
('Electrical Tape', @cat22, 'active'), ('Safety Gloves', @cat22, 'active');
