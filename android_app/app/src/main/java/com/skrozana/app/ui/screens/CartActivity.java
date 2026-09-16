package com.skrozana.app.ui.screens;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.button.MaterialButton;
import com.skrozana.app.R;
import com.skrozana.app.data.remote.RetrofitClient;
import com.skrozana.app.data.model.CartItem;
import com.skrozana.app.ui.components.CartAdapter;
import com.skrozana.app.utils.SessionManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CartActivity extends AppCompatActivity {
    private RecyclerView rvCart;
    private TextView tvPriceItemsLabel, tvTotalPrice, tvTotalDiscount, tvFinalAmount, tvBottomPrice;
    private MaterialButton btnCheckout;
    private List<CartItem> cartItems = new ArrayList<>();
    private CartAdapter cartAdapter;
    private SessionManager sessionManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);

        sessionManager = new SessionManager(this);
        if (!sessionManager.isLoggedIn()) {
            Toast.makeText(this, "Please login to view cart", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        initViews();
        setupRecyclerView();

        loadCart();

        btnCheckout.setOnClickListener(v -> {
            if (cartItems.isEmpty()) {
                Toast.makeText(this, "Cart is empty", Toast.LENGTH_SHORT).show();
                return;
            }
            double finalAmount = 0;
            for (CartItem item : cartItems) {
                finalAmount += item.getProduct().getFinalPrice() * item.getQuantity();
            }
            Intent intent = new Intent(this, CheckoutActivity.class);
            intent.putExtra("total", finalAmount);
            startActivity(intent);
        });
    }

    private void initViews() {
        rvCart = findViewById(R.id.rvCart);
        tvPriceItemsLabel = findViewById(R.id.tvPriceItemsLabel);
        tvTotalPrice = findViewById(R.id.tvTotalPrice);
        tvTotalDiscount = findViewById(R.id.tvTotalDiscount);
        tvFinalAmount = findViewById(R.id.tvFinalAmount);
        tvBottomPrice = findViewById(R.id.tvBottomPrice);
        btnCheckout = findViewById(R.id.btnCheckout);

        findViewById(R.id.toolbarCart).setOnClickListener(v -> finish());
    }

    private void setupRecyclerView() {
        cartAdapter = new CartAdapter(cartItems, new CartAdapter.OnCartActionListener() {
            @Override
            public void onRemoveItem(CartItem item) {
                removeItem(item);
            }

            @Override
            public void onUpdateQuantity(CartItem item, int newQuantity) {
                updateQuantity(item, newQuantity);
            }
        });
        rvCart.setAdapter(cartAdapter);
    }

    private void loadCart() {
        RetrofitClient.getApiService().getCart(sessionManager.getUserId()).enqueue(new Callback<List<CartItem>>() {
            @Override
            public void onResponse(Call<List<CartItem>> call, Response<List<CartItem>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    cartItems.clear();
                    cartItems.addAll(response.body());
                    cartAdapter.notifyDataSetChanged();
                    updatePriceSummary();
                }
            }

            @Override
            public void onFailure(Call<List<CartItem>> call, Throwable t) {
                Toast.makeText(CartActivity.this, "Failed to load cart", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void removeItem(CartItem item) {
        RetrofitClient.getApiService().removeFromCart(sessionManager.getUserId(), item.getId()).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful()) {
                    loadCart();
                }
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                Toast.makeText(CartActivity.this, "Failed to remove item", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void updateQuantity(CartItem item, int newQuantity) {
        RetrofitClient.getApiService().updateCartQuantity(sessionManager.getUserId(), item.getId(), newQuantity).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful()) {
                    loadCart();
                }
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                Toast.makeText(CartActivity.this, "Failed to update quantity", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void updatePriceSummary() {
        double totalOriginalPrice = 0;
        double totalDiscount = 0;
        int itemCount = 0;

        for (CartItem item : cartItems) {
            totalOriginalPrice += item.getProduct().getPrice() * item.getQuantity();
            totalDiscount += (item.getProduct().getPrice() - item.getProduct().getFinalPrice()) * item.getQuantity();
            itemCount += item.getQuantity();
        }

        double finalAmount = totalOriginalPrice - totalDiscount;

        tvPriceItemsLabel.setText("Price (" + itemCount + " items)");
        tvTotalPrice.setText("₹" + (int) totalOriginalPrice);
        tvTotalDiscount.setText("- ₹" + (int) totalDiscount);
        tvFinalAmount.setText("₹" + (int) finalAmount);
        tvBottomPrice.setText("₹" + (int) finalAmount);
    }
}
