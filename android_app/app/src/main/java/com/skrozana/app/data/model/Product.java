package com.skrozana.app.data.model;

import com.google.gson.annotations.SerializedName;

public class Product {
    @SerializedName("product_id")
    private int id;
    @SerializedName("category_id")
    private int categoryId;
    @SerializedName("product_name")
    private String productName;
    private String brand;
    private String description;
    private double price;
    private double discount;
    private int stock;
    @SerializedName("image1")
    private String image;
    @SerializedName("image2")
    private String image2;
    @SerializedName("image3")
    private String image3;
    private String status;
    private double rating;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public double getDiscount() { return discount; }
    public void setDiscount(double discount) { this.discount = discount; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
    public String getImage2() { return image2; }
    public void setImage2(String image2) { this.image2 = image2; }
    public String getImage3() { return image3; }
    public void setImage3(String image3) { this.image3 = image3; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getFinalPrice() {
        if (discount > 0) {
            return price - (price * discount / 100);
        }
        return price;
    }
}
