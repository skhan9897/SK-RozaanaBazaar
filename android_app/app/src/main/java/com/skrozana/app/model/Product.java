package com.skrozana.app.model;

public class Product {
    private int id;
    private int categoryId;
    private String productName;
    private String brand;
    private String description;
    private double price;
    private double discount;
    private double finalPrice;
    private int stock;
    private String image;
    private double rating;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public double getFinalPrice() { return finalPrice; }
    public void setFinalPrice(double finalPrice) { this.finalPrice = finalPrice; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
