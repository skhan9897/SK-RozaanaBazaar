package com.sk.rozaanabazaar.ui.product;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.model.Product;
import com.sk.rozaanabazaar.utils.SessionManager;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import com.google.gson.Gson;
import com.sk.rozaanabazaar.utils.WishlistManager;
import com.sk.rozaanabazaar.ui.auth.LoginActivity;
import com.squareup.picasso.Picasso;

import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayoutMediator;
import androidx.viewpager2.widget.ViewPager2;
import com.sk.rozaanabazaar.adapter.SliderAdapter;
import java.util.ArrayList;
import java.util.List;

public class ProductDetailsActivity extends AppCompatActivity {
    private ViewPager2 viewPagerProductImages;
    private TabLayout tabIndicator;
    private ImageButton btnWishlist;
    private TextView tvProductName, tvProductPrice, tvOriginalPrice, tvDiscountOffer, tvProductDescription, tvRating, tvRatingCount, tvStockStatus;
    private Button btnAddToCart, btnBuyNow;
    private RecyclerView rvSimilarProducts;
    private Product product;
    private SessionManager sessionManager;
    private WishlistManager wishlistManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_details);

        sessionManager = new SessionManager(this);
        wishlistManager = new WishlistManager(this);
        viewPagerProductImages = findViewById(R.id.viewPagerProductImages);
        tabIndicator = findViewById(R.id.tabIndicator);
        btnWishlist = findViewById(R.id.btnWishlist);
        tvProductName = findViewById(R.id.tvProductName);
        tvProductPrice = findViewById(R.id.tvProductPrice);
        tvOriginalPrice = findViewById(R.id.tvOriginalPrice);
        tvDiscountOffer = findViewById(R.id.tvDiscountOffer);
        tvProductDescription = findViewById(R.id.tvProductDescription);
        tvRating = findViewById(R.id.tvRating);
        tvRatingCount = findViewById(R.id.tvRatingCount);
        tvStockStatus = findViewById(R.id.tvStockStatus);
        rvSimilarProducts = findViewById(R.id.rvSimilarProducts);
        btnAddToCart = findViewById(R.id.btnAddToCart);
        btnBuyNow = findViewById(R.id.btnBuyNow);

        String productJson = getIntent().getStringExtra("product");
        if (productJson != null) {
            product = new Gson().fromJson(productJson, Product.class);
            if (product != null) {
                displayProduct();
                updateWishlistIcon();
                loadSimilarProducts();
            } else {
                Toast.makeText(this, "Product not found", Toast.LENGTH_SHORT).show();
                finish();
                return;
            }
        } else {
            Toast.makeText(this, "Invalid Product", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        btnAddToCart.setOnClickListener(v -> addToCart());
        btnBuyNow.setOnClickListener(v -> {
            if (!sessionManager.isLoggedIn()) {
                startActivity(new Intent(this, com.sk.rozaanabazaar.ui.auth.LoginActivity.class));
                return;
            }
            Toast.makeText(this, "Buy Now coming soon!", Toast.LENGTH_SHORT).show();
        });

        btnWishlist.setOnClickListener(v -> {
            if (product == null) return;
            if (wishlistManager.isInWishlist(product.getId())) {
                wishlistManager.removeFromWishlist(product.getId());
                Toast.makeText(this, "Removed from wishlist", Toast.LENGTH_SHORT).show();
            } else {
                wishlistManager.addToWishlist(product);
                Toast.makeText(this, "Added to wishlist", Toast.LENGTH_SHORT).show();
            }
            updateWishlistIcon();
        });
    }

    private void updateWishlistIcon() {
        if (wishlistManager.isInWishlist(product.getId())) {
            btnWishlist.setColorFilter(Color.RED);
        } else {
            btnWishlist.setColorFilter(Color.GRAY);
        }
    }

    private void displayProduct() {
        tvProductName.setText(product.getProductName());
        tvProductPrice.setText("₹" + (int) product.getFinalPrice());
        tvOriginalPrice.setText("₹" + (int) product.getPrice());
        tvOriginalPrice.setPaintFlags(tvOriginalPrice.getPaintFlags() | android.graphics.Paint.STRIKE_THRU_TEXT_FLAG);
        tvDiscountOffer.setText((int) product.getDiscount() + "% OFF");
        tvRating.setText(String.valueOf(product.getRating()));
        tvRatingCount.setText("(2,340 ratings and 450 reviews)"); // Placeholder

        if (product.getStock() > 0) {
            tvStockStatus.setText("In Stock");
            tvStockStatus.setTextColor(Color.parseColor("#388E3C"));
        } else {
            tvStockStatus.setText("Out of Stock");
            tvStockStatus.setTextColor(Color.RED);
            btnBuyNow.setEnabled(false);
            btnBuyNow.setAlpha(0.5f);
        }

        if (product.getDescription() != null && !product.getDescription().isEmpty()) {
            tvProductDescription.setText(product.getDescription());
        } else {
            tvProductDescription.setText("No description available for this product.");
        }

        List<String> images = new ArrayList<>();
        addImageToList(images, product.getImage());
        addImageToList(images, product.getImage2());
        addImageToList(images, product.getImage3());
        addImageToList(images, product.getImage4());

        if (images.isEmpty()) {
            images.add("https://via.placeholder.com/600?text=No+Image"); 
        }

        SliderAdapter adapter = new SliderAdapter(images);
        viewPagerProductImages.setAdapter(adapter);

        new TabLayoutMediator(tabIndicator, viewPagerProductImages, (tab, position) -> {}).attach();
    }

    private void loadSimilarProducts() {
        RetrofitClient.getApiService().getProducts(product.getCategoryId()).enqueue(new Callback<List<Product>>() {
            @Override
            public void onResponse(Call<List<Product>> call, Response<List<Product>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    List<Product> similar = response.body();
                    similar.removeIf(p -> p.getId() == product.getId());
                    if (similar.size() > 6) similar = similar.subList(0, 6);
                    rvSimilarProducts.setAdapter(new com.sk.rozaanabazaar.adapter.ProductAdapter(similar));
                }
            }
            @Override
            public void onFailure(Call<List<Product>> call, Throwable t) {}
        });
    }

    private void addImageToList(List<String> list, String imageUrl) {
        if (imageUrl != null && !imageUrl.trim().isEmpty()) {
            imageUrl = imageUrl.trim();
            if (imageUrl.startsWith("/")) {
                imageUrl = imageUrl.substring(1);
            }
            if (!imageUrl.startsWith("http")) {
                imageUrl = RetrofitClient.BASE_URL + imageUrl;
            }
            list.add(imageUrl);
        }
    }

    private void addToCart() {
        if (!sessionManager.isLoggedIn()) {
            Toast.makeText(this, "Please login first", Toast.LENGTH_SHORT).show();
            startActivity(new Intent(this, LoginActivity.class));
            return;
        }

        int userId = sessionManager.getUserId();
        int productId = product.getId();

        RetrofitClient.getApiService().addToCart(userId, productId, 1).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    if ("success".equals(response.body().get("status"))) {
                        Toast.makeText(ProductDetailsActivity.this, "Added to cart!", Toast.LENGTH_SHORT).show();
                    } else {
                        Toast.makeText(ProductDetailsActivity.this, (String) response.body().get("message"), Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                Toast.makeText(ProductDetailsActivity.this, "Error adding to cart", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
