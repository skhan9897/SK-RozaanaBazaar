package com.skrozana.util;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Utility to generate rich e-commerce product data for SKRozaanaBazaar.
 */
public class ProductDataGenerator {

    private static final Random random = new Random();

    public static void main(String[] args) {
        String fileName = "rich_products_seed.sql";
        try (PrintWriter out = new PrintWriter(new FileWriter(fileName))) {
            out.println("-- Generated Rich Product Seed Data for SKRozaanaBazaar");
            out.println("SET FOREIGN_KEY_CHECKS = 0;");
            out.println("-- We don't truncate here to allow appending, but you can if needed.");
            out.println("SET FOREIGN_KEY_CHECKS = 1;");
            out.println();

            // Mobile & Tablets (Cat 1)
            generateProducts(out, 1, 1, "Smartphone", new String[]{"Apple", "Samsung", "Google", "OnePlus"}, 50000, 150000, "MOB");
            generateProducts(out, 1, 2, "Tablet", new String[]{"Apple iPad", "Samsung Galaxy Tab", "Lenovo Tab"}, 20000, 90000, "TAB");
            generateProducts(out, 1, 6, "Charger", new String[]{"Anker", "Belkin", "Samsung"}, 999, 4999, "CHG");

            // Computers & Laptops (Cat 2)
            generateProducts(out, 2, 16, "Laptop", new String[]{"Dell XPS", "HP Spectre", "MacBook Pro", "Lenovo ThinkPad"}, 60000, 250000, "LAP");
            generateProducts(out, 2, 26, "Keyboard", new String[]{"Logitech", "Razer", "Keychron"}, 1500, 12000, "KBD");

            // Electronics (Cat 3)
            generateProducts(out, 3, 42, "Wireless Headphones", new String[]{"Sony", "Bose", "Sennheiser"}, 5000, 35000, "AUD");
            generateProducts(out, 3, 49, "Smart Speaker", new String[]{"Amazon Echo", "Google Nest", "Apple HomePod"}, 3000, 25000, "IOT");

            // Fashion (Cat 5 & 6)
            generateProducts(out, 5, 72, "Premium Cotton Shirt", new String[]{"Ralph Lauren", "Tommy Hilfiger", "Lacoste"}, 2000, 8000, "MEN");
            generateProducts(out, 6, 95, "Designer Saree", new String[]{"Sabyasachi", "Manish Malhotra", "FabIndia"}, 5000, 50000, "WOM");

            // Grocery (Cat 8)
            generateProducts(out, 8, 116, "Organic Basmati Rice", new String[]{"India Gate", "Daawat", "Fortune"}, 500, 2000, "GRO");
            generateProducts(out, 8, 134, "Pure Cow Ghee", new String[]{"Amul", "Mother Dairy", "Aashirvaad"}, 400, 3500, "GHE");

            // Gaming (Cat 16)
            generateProducts(out, 16, 175, "Gaming Console", new String[]{"PlayStation 5", "Xbox Series X", "Nintendo Switch"}, 30000, 55000, "GAM");

            System.out.println("SQL script generated successfully: " + fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void generateProducts(PrintWriter out, int catId, int subCatId, String type, String[] brands, double minPrice, double maxPrice, String prefix) {
        String[] adjectives = {"Ultra", "Premium", "Elite", "Pro", "Classic", "Signature", "Advanced", "Luxury"};
        
        for (int i = 0; i < 5; i++) {
            String brand = brands[random.nextInt(brands.length)];
            String adj = adjectives[random.nextInt(adjectives.length)];
            String name = brand + " " + adj + " " + type + " " + (i + 1);
            double price = minPrice + (maxPrice - minPrice) * random.nextDouble();
            double discountPercent = 5 + random.nextInt(25);
            double discount = (price * discountPercent) / 100;
            double finalPrice = price - discount;
            int stock = 10 + random.nextInt(100);
            String sku = "SKRB-" + prefix + "-" + (1000 + random.nextInt(9000));
            String desc = "Experience the best of " + brand + " with this " + adj.toLowerCase() + " " + type.toLowerCase() + ". Features cutting-edge technology and premium build quality.";
            String image = "/images/products/" + prefix.toLowerCase() + "_" + (i + 1) + ".jpg";
            double rating = 4.0 + (1.0 * random.nextDouble());

            out.printf("INSERT INTO products (category_id, subcategory_id, product_name, brand, description, price, discount, final_price, stock, sku, image, rating, status) VALUES " +
                       "(%d, %d, '%s', '%s', '%s', %.2f, %.2f, %.2f, %d, '%s', '%s', %.1f, 'ACTIVE');%n",
                       catId, subCatId, name, brand, desc, price, discount, finalPrice, stock, sku, image, rating);
        }
    }
}
