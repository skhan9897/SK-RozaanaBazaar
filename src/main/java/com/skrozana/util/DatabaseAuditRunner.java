package com.skrozana.util;

import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class DatabaseAuditRunner {

    public static void main(String[] args) {
        System.out.println("==================================================");
        System.out.println("STARTING COMPLETE PRODUCT DATABASE AUDIT");
        System.out.println("==================================================");

        ProductDAO productDAO = new ProductDAO();
        List<Product> allProducts = new ArrayList<>();
        Map<Integer, String> categoryMap = new HashMap<>();

        // 1. Fetch categories for name mapping
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT id, name FROM categories");
            while (rs.next()) {
                categoryMap.put(rs.getInt("id"), rs.getString("name"));
            }
        } catch (Exception e) {
            System.err.println("Error fetching categories: " + e.getMessage());
        }

        // 2. Fetch all products
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setSubcategoryId((Integer) rs.getObject("subcategory_id"));
                p.setProductName(rs.getString("product_name"));
                p.setBrand(rs.getString("brand"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setDiscount(rs.getDouble("discount"));
                p.setFinalPrice(rs.getDouble("final_price"));
                p.setStock(rs.getInt("stock"));
                p.setSku(rs.getString("sku"));
                p.setImage(rs.getString("image"));
                p.setImage2(rs.getString("image2"));
                p.setImage3(rs.getString("image3"));
                p.setImage4(rs.getString("image4"));
                p.setRating(rs.getDouble("rating"));
                p.setStatus(rs.getString("status"));
                allProducts.add(p);
            }
        } catch (Exception e) {
            System.err.println("Error fetching products: " + e.getMessage());
            e.printStackTrace();
            return;
        }

        int totalProducts = allProducts.size();
        int withImage1 = 0, withImage2 = 0, withImage3 = 0, withImage4 = 0;
        int missingAnyImage = 0;

        List<String> missingSlotsReport = new ArrayList<>();
        Map<String, List<Integer>> imageUrlMap = new HashMap<>();
        List<String> missingDetailsReport = new ArrayList<>();
        List<String> skRozanaBrandingReport = new ArrayList<>();
        List<Product> productsToProcess = new ArrayList<>();

        for (Product p : allProducts) {
            boolean hasImg1 = p.getImage() != null && !p.getImage().trim().isEmpty();
            boolean hasImg2 = p.getImage2() != null && !p.getImage2().trim().isEmpty();
            boolean hasImg3 = p.getImage3() != null && !p.getImage3().trim().isEmpty();
            boolean hasImg4 = p.getImage4() != null && !p.getImage4().trim().isEmpty();

            if (hasImg1) withImage1++;
            if (hasImg2) withImage2++;
            if (hasImg3) withImage3++;
            if (hasImg4) withImage4++;

            // Track duplicate URLs
            if (hasImg1) imageUrlMap.computeIfAbsent(p.getImage(), k -> new ArrayList<>()).add(p.getId());
            if (hasImg2) imageUrlMap.computeIfAbsent(p.getImage2(), k -> new ArrayList<>()).add(p.getId());
            if (hasImg3) imageUrlMap.computeIfAbsent(p.getImage3(), k -> new ArrayList<>()).add(p.getId());
            if (hasImg4) imageUrlMap.computeIfAbsent(p.getImage4(), k -> new ArrayList<>()).add(p.getId());

            // Identify missing slots or non-normalised paths
            List<String> emptySlots = new ArrayList<>();
            if (!hasImg1) emptySlots.add("image1");
            if (!hasImg2) emptySlots.add("image2");
            if (!hasImg3) emptySlots.add("image3");
            if (!hasImg4) emptySlots.add("image4");

            boolean needsNormalization = false;
            if (hasImg1 && !p.getImage().startsWith("/images/products/")) needsNormalization = true;
            if (hasImg2 && !p.getImage2().startsWith("/images/products/")) needsNormalization = true;
            if (hasImg3 && !p.getImage3().startsWith("/images/products/")) needsNormalization = true;
            if (hasImg4 && !p.getImage4().startsWith("/images/products/")) needsNormalization = true;

            if (!emptySlots.isEmpty() || needsNormalization) {
                missingAnyImage++;
                String reason = !emptySlots.isEmpty() ? "Missing slots: " + emptySlots : "Needs path normalization";
                missingSlotsReport.add("Product ID " + p.getId() + " (" + p.getProductName() + ") - " + reason);
                productsToProcess.add(p);
            }

            // Missing details check
            List<String> missingFields = new ArrayList<>();
            if (p.getPrice() <= 0) missingFields.add("Price");
            if (p.getCategoryId() <= 0) missingFields.add("Category ID");
            if (p.getSku() == null || p.getSku().trim().isEmpty()) missingFields.add("SKU");
            if (p.getBrand() == null || p.getBrand().trim().isEmpty()) missingFields.add("Brand");
            if (p.getProductName() == null || p.getProductName().trim().isEmpty()) missingFields.add("Product Name");
            
            if (!missingFields.isEmpty()) {
                missingDetailsReport.add("Product ID " + p.getId() + " (" + p.getProductName() + ") is missing fields: " + missingFields);
            }

            // Branding report
            boolean hasLegacyBranding = false;
            if (p.getBrand() != null && p.getBrand().toLowerCase().contains("flipkart")) hasLegacyBranding = true;
            if (p.getDescription() != null && p.getDescription().toLowerCase().contains("flipkart")) hasLegacyBranding = true;
            if (p.getProductName() != null && p.getProductName().toLowerCase().contains("flipkart")) hasLegacyBranding = true;

            if (hasLegacyBranding) {
                skRozanaBrandingReport.add("Product ID " + p.getId() + " (" + p.getProductName() + ") has legacy branding in fields.");
            }
        }

        // Print Audit Summary
        System.out.println("\n*** AUDIT REPORT SUMMARY ***");
        System.out.println("1. Total Products in Database: " + totalProducts);
        System.out.println("2. Products with Image Slots Filled:");
        System.out.println("   - Image 1: " + withImage1 + " / " + totalProducts);
        System.out.println("   - Image 2: " + withImage2 + " / " + totalProducts);
        System.out.println("   - Image 3: " + withImage3 + " / " + totalProducts);
        System.out.println("   - Image 4: " + withImage4 + " / " + totalProducts);

        System.out.println("\n3. Products with Missing Images or Non-Normalised Paths: " + missingAnyImage);
        for (String slotMsg : missingSlotsReport) {
            System.out.println("   " + slotMsg);
        }

        System.out.println("\n4. Duplicate Image URLs:");
        int duplicateCount = 0;
        for (Map.Entry<String, List<Integer>> entry : imageUrlMap.entrySet()) {
            if (entry.getValue().size() > 1) {
                duplicateCount++;
                System.out.println("   URL [" + entry.getKey() + "] shared by Product IDs: " + entry.getValue());
            }
        }
        if (duplicateCount == 0) {
            System.out.println("   No duplicate image URLs found.");
        }

        System.out.println("\n5. Missing Product Details:");
        if (missingDetailsReport.isEmpty()) {
            System.out.println("   All products have complete pricing, category, and SKU details.");
        } else {
            for (String detailMsg : missingDetailsReport) {
                System.out.println("   " + detailMsg);
            }
        }

        System.out.println("\n6. Branding Report:");
        if (skRozanaBrandingReport.isEmpty()) {
            System.out.println("   No 'Flipkart' branding detected in product descriptions, brands, or names.");
        } else {
            for (String brandMsg : skRozanaBrandingReport) {
                System.out.println("   " + brandMsg);
            }
        }

        // AUTOMATIC PROCESSING
        System.out.println("\n==================================================");
        System.out.println("AUTOMATICALLY PROCESSING PRODUCTS WITH MISSING/NON-NORMALISED IMAGES");
        System.out.println("==================================================");

        if (productsToProcess.isEmpty()) {
            System.out.println("All products already have 4 professional images and correct normalised mapping.");
        } else {
            System.out.println("Found " + productsToProcess.size() + " products requiring image generation/normalization.");
            int successCount = 0;
            for (Product p : productsToProcess) {
                String catName = categoryMap.getOrDefault(p.getCategoryId(), "General");
                System.out.println("Generating 4 professional images for Product ID " + p.getId() + " (" + p.getProductName() + ") under Category: " + catName + "...");
                
                try {
                    Map<String, String> generatedPaths = ImageGenerationService.generateAndSaveImages(p, catName);
                    if (!generatedPaths.isEmpty()) {
                        p.setImage(generatedPaths.get("image"));
                        p.setImage2(generatedPaths.get("image2"));
                        p.setImage3(generatedPaths.get("image3"));
                        p.setImage4(generatedPaths.get("image4"));
                        
                        boolean updated = productDAO.updateProduct(p);
                        if (updated) {
                            System.out.println("   Successfully updated database mapping for Product ID " + p.getId());
                            successCount++;
                        } else {
                            System.err.println("   Failed to update database for Product ID " + p.getId());
                        }
                    } else {
                        System.err.println("   ImageGenerationService returned no paths for Product ID " + p.getId());
                    }
                } catch (Exception e) {
                    System.err.println("   Error processing Product ID " + p.getId() + ": " + e.getMessage());
                }
            }
            System.out.println("\nProcessing completed. Successfully updated " + successCount + " products.");
        }
        System.out.println("==================================================");
        System.out.println("PRODUCT AUDIT & AUTO-PROCESSING COMPLETE");
        System.out.println("==================================================");
    }
}
