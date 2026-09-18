package com.skrozana.model;

public class ProductImage {
    private int id;
    private int productId;
    private String imageUrl;
    private String imageType; // NORMAL, 360
    private int imageOrder;
    private boolean isPrimary;

    public ProductImage() {}

    public ProductImage(int productId, String imageUrl, String imageType, int imageOrder, boolean isPrimary) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.imageType = imageType;
        this.imageOrder = imageOrder;
        this.isPrimary = isPrimary;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getImageType() { return imageType; }
    public void setImageType(String imageType) { this.imageType = imageType; }

    public int getImageOrder() { return imageOrder; }
    public void setImageOrder(int imageOrder) { this.imageOrder = imageOrder; }

    public boolean isPrimary() { return isPrimary; }
    public void setPrimary(boolean primary) { isPrimary = primary; }
}
