package com.skrozana.util;

import com.skrozana.dao.CategoryDAO;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Category;
import com.skrozana.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ImageTaskWorker {

    private static ImageTaskWorker instance;
    private final ExecutorService executor;
    private final ProductDAO productDAO;
    private final CategoryDAO categoryDAO;
    private boolean running = true;

    private ImageTaskWorker() {
        this.executor = Executors.newFixedThreadPool(2);
        this.productDAO = new ProductDAO();
        this.categoryDAO = new CategoryDAO();
        startPolling();
    }

    public static synchronized ImageTaskWorker getInstance() {
        if (instance == null) {
            instance = new ImageTaskWorker();
        }
        return instance;
    }

    private void startPolling() {
        new Thread(() -> {
            while (running) {
                try {
                    processPendingTasks();
                    Thread.sleep(10000); // Poll every 10 seconds
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    private void processPendingTasks() {
        String sql = "SELECT product_id FROM product_image_status WHERE status = 'PENDING' LIMIT 5";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                updateStatus(productId, "GENERATING", null);
                executor.submit(() -> performImageGeneration(productId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void performImageGeneration(int productId) {
        try {
            Product product = productDAO.getProductById(productId);
            if (product == null) {
                updateStatus(productId, "FAILED", "Product not found");
                return;
            }

            Category category = categoryDAO.getCategoryById(product.getCategoryId());
            String catName = (category != null) ? category.getName() : "General";

            Map<String, String> paths = ImageGenerationService.generateAndSaveImages(product, catName);
            
            if (!paths.isEmpty()) {
                product.setImage(paths.get("image"));
                product.setImage2(paths.get("image2"));
                product.setImage3(paths.get("image3"));
                product.setImage4(paths.get("image4"));
                productDAO.updateProduct(product);
                updateStatus(productId, "GENERATED", null);
            } else {
                updateStatus(productId, "FAILED", "No images generated");
            }
        } catch (Exception e) {
            updateStatus(productId, "FAILED", e.getMessage());
        }
    }

    private void updateStatus(int productId, String status, String error) {
        String sql = "UPDATE product_image_status SET status = ?, error_message = ? WHERE product_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, error);
            ps.setInt(3, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void shutdown() {
        running = false;
        executor.shutdown();
    }
}
