package com.skrozana.app.ui.screens;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.skrozana.app.R;
import com.skrozana.app.data.remote.RetrofitClient;
import com.skrozana.app.data.model.Product;
import com.skrozana.app.utils.SessionManager;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import com.google.gson.Gson;
import com.skrozana.app.utils.WishlistManager;
import com.squareup.picasso.Picasso;

import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayoutMediator;
import androidx.viewpager2.widget.ViewPager2;
import com.skrozana.app.ui.components.SliderAdapter;
import java.util.ArrayList;
import java.util.List;

public class ProductDetailsActivity extends AppCompatActivity {
    private ViewPager2 viewPagerProductImages;
    private TabLayout tabIndicator;
    private ImageButton btnWishlist;
    private TextView tvProductName, tvProductPrice, tvProductDescription;
    private Button btnAddToCart, btnBuyNow;
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
        tvProductDescription = findViewById(R.id.tvProductDescription);
        btnAddToCart = findViewById(R.id.btnAddToCart);
        btnBuyNow = findViewById(R.id.btnBuyNow);

        String productJson = getIntent().getStringExtra("product");
        if (productJson != null) {
            product = new Gson().fromJson(productJson, Product.class);
            displayProduct();
        }

        btnAddToCart.setOnClickListener(v -> addToCart());
        btnBuyNow.setOnClickListener(v -> {
            // Future implementation for direct buy
            Toast.makeText(this, "Buy Now coming soon!", Toast.LENGTH_SHORT).show();
        });

        updateWishlistIcon();
        btnWishlist.setOnClickListener(v -> {
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
        tvProductPrice.setText("₹" + product.getFinalPrice());

        if (product.getDescription() != null && !product.getDescription().isEmpty()) {
            tvProductDescription.setText(product.getDescription());
        } else {
            tvProductDescription.setText(product.getProductName());
        }

        List<String> images = new ArrayList<>();
        addImageToList(images, product.getImage());
        addImageToList(images, product.getImage2());
        addImageToList(images, product.getImage3());

        if (images.isEmpty()) {
            images.add(""); // Placeholder
        }

        SliderAdapter adapter = new SliderAdapter(images);
        viewPagerProductImages.setAdapter(adapter);

        new TabLayoutMediator(tabIndicator, viewPagerProductImages, (tab, position) -> {
            // No text needed for dots
        }).attach();
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
