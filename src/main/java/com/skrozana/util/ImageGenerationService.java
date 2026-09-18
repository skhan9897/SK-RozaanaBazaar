package com.skrozana.util;

import com.skrozana.model.Product;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class ImageGenerationService {

    private static final String UNSPLASH_BASE = "https://source.unsplash.com/1024x1024/?";
    private static final String[] PREMIUM_KEYWORDS = {"studio-lighting", "e-commerce", "product-photography", "clean-background"};
    private static final String STORAGE_ROOT = "src/main/webapp/images/products/";

    public static Map<String, String> generateAndSaveImages(Product product, String categoryName) {
        Map<String, String> results = new HashMap<>();
        String brand = product.getBrand() != null ? product.getBrand() : "";
        String name = product.getProductName() != null ? product.getProductName() : "product";
        String baseQuery = (brand + " " + name).trim();
        
        String folderPath = categoryName.toLowerCase().replaceAll("[^a-z0-9]", "-");
        File dir = new File(STORAGE_ROOT + folderPath);
        if (!dir.exists()) dir.mkdirs();

        for (int i = 1; i <= 4; i++) {
            String keyword = PREMIUM_KEYWORDS[i - 1];
            String sourceUrl = "https://picsum.photos/1024/1024?random=" + (Math.abs(product.getProductName().hashCode()) + i + product.getId());
            String fileName = "product-" + product.getId() + "-" + i + ".jpg";
            String relativePath = "images/products/" + folderPath + "/" + fileName;
            
            try {
                if (downloadAndOptimize(sourceUrl, STORAGE_ROOT + folderPath + "/" + fileName)) {
                    results.put("image" + (i == 1 ? "" : i), "/" + relativePath);
                }
            } catch (Exception e) {
                System.err.println("Failed to generate image " + i + " for product " + product.getId() + ": " + e.getMessage());
            }
        }
        return results;
    }

    private static boolean downloadAndOptimize(String sourceUrl, String destinationPath) throws IOException {
        URL url = new URL(sourceUrl);
        BufferedImage image = ImageIO.read(url);
        if (image == null) return false;

        // Force 1:1 Aspect Ratio (Square Crop)
        int size = Math.min(image.getWidth(), image.getHeight());
        BufferedImage cropped = image.getSubimage(
                (image.getWidth() - size) / 2,
                (image.getHeight() - size) / 2,
                size, size
        );

        // Resize to 1024x1024 for high quality
        Image scaled = cropped.getScaledInstance(1024, 1024, Image.SCALE_SMOOTH);
        BufferedImage output = new BufferedImage(1024, 1024, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = output.createGraphics();
        g2d.drawImage(scaled, 0, 0, null);
        g2d.dispose();

        // Save as JPEG (Stable for Java 8)
        File outputFile = new File(destinationPath);
        return ImageIO.write(output, "jpg", outputFile);
    }

    private static String sanitize(String input) {
        try {
            return URLEncoder.encode(input, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException e) {
            return "product";
        }
    }
    
    public static void autoAssignImages(Product product) {
        // This is a placeholder for immediate assignment if needed.
        // For full automation, use ImageTaskWorker and product_image_status table.
        // To support existing servlets, we can queue the task here.
        String sql = "INSERT IGNORE INTO product_image_status (product_id, status) VALUES (?, 'PENDING')";
        try (java.sql.Connection conn = DBConnection.getConnection();
             java.sql.PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, product.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
