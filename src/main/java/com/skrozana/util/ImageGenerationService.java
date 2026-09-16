package com.skrozana.util;

import com.skrozana.model.Product;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class ImageGenerationService {

    private static final String BASE_URL = "https://source.unsplash.com/800x800/?";
    private static final String[] PREMIUM_KEYWORDS = {"studio-lighting", "e-commerce", "product-photography", "clean-background"};

    public static Map<String, String> generateProductImages(Product product) {
        Map<String, String> images = new HashMap<>();
        
        String brand = product.getBrand() != null ? product.getBrand() : "";
        String name = product.getProductName() != null ? product.getProductName() : "product";
        String query = sanitize(brand + " " + name);
        
        for (int i = 1; i <= 4; i++) {
            String keyword = PREMIUM_KEYWORDS[i - 1];
            // Using a unique signature to get different images for the same query
            String imageUrl = BASE_URL + query + "," + keyword + "&sig=" + (Math.abs(product.getProductName().hashCode()) + i);
            images.put("image" + (i == 1 ? "" : i), imageUrl);
        }
        
        return images;
    }

    private static String sanitize(String input) {
        try {
            return URLEncoder.encode(input.trim(), StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException e) {
            return "product";
        }
    }
    
    public static void autoAssignImages(Product product) {
        if (product.getImage() == null || product.getImage().isEmpty()) {
            Map<String, String> images = generateProductImages(product);
            product.setImage(images.get("image"));
            product.setImage2(images.get("image2"));
            product.setImage3(images.get("image3"));
            product.setImage4(images.get("image4"));
        }
    }
}
