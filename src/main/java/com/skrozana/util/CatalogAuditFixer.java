package com.skrozana.util;

import com.skrozana.dao.CategoryDAO;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Category;
import com.skrozana.model.Product;
import java.util.List;
import java.util.Map;

/**
 * Utility to fix product-image mapping across the entire database.
 * Ensures each product has 4 professional images uniquely mapped to its ID.
 */
public class CatalogAuditFixer {

    public static void main(String[] args) {
        fixAllProductMappings();
    }

    public static void fixAllProductMappings() {
        System.out.println("Starting Catalog Audit and Mapping Fix...");
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        
        List<Product> products = productDAO.getAllProducts(0, 1000);
        int fixedCount = 0;

        for (Product product : products) {
            try {
                Category category = categoryDAO.getCategoryById(product.getCategoryId());
                String catName = (category != null) ? category.getName() : "general";
                
                System.out.println("Processing Product #" + product.getId() + ": " + product.getProductName());
                
                // We always generate/refresh paths to ensure consistency with the new naming convention
                // product-{id}-{slot}.jpg
                Map<String, String> paths = ImageGenerationService.generateAndSaveImages(product, catName);
                
                if (!paths.isEmpty()) {
                    product.setImage(paths.get("image"));
                    product.setImage2(paths.get("image2"));
                    product.setImage3(paths.get("image3"));
                    product.setImage4(paths.get("image4"));
                    
                    productDAO.updateProduct(product);
                    fixedCount++;
                }
            } catch (Exception e) {
                System.err.println("Failed to fix mapping for product " + product.getId() + ": " + e.getMessage());
            }
        }
        
        System.out.println("Audit Complete. Fixed Mappings for " + fixedCount + " products.");
    }
}
