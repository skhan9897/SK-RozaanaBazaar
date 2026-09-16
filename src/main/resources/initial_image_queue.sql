-- Queue all existing products for professional image generation
INSERT IGNORE INTO product_image_status (product_id, status)
SELECT id, 'PENDING' FROM products;