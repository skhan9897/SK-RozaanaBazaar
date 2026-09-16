package com.sk.rozaanabazaar.ui.product;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.ui.home.MainActivity;

public class OrderSuccessActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_success);

        String orderId = getIntent().getStringExtra("orderId");
        TextView tvOrderId = findViewById(R.id.tvOrderId);
        tvOrderId.setText("Order ID: #" + orderId);

        Button btnTrackOrder = findViewById(R.id.btnTrackOrder);
        Button btnContinue = findViewById(R.id.btnContinue);

        btnTrackOrder.setOnClickListener(v -> {
            Intent intent = new Intent(OrderSuccessActivity.this, OrderTrackingActivity.class);
            intent.putExtra("orderId", orderId);
            startActivity(intent);
        });

        btnContinue.setOnClickListener(v -> {
            Intent intent = new Intent(OrderSuccessActivity.this, MainActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            finish();
        });
    }
}
