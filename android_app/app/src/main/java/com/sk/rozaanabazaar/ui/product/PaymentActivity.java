package com.sk.rozaanabazaar.ui.product;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;

public class PaymentActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);

        findViewById(R.id.toolbarPayment).setOnClickListener(v -> finish());

        double total = getIntent().getDoubleExtra("total", 0);
        TextView tvTotal = findViewById(R.id.tvTotalAmount);
        tvTotal.setText("₹" + (int) total);

        Button btnPay = findViewById(R.id.btnPayNow);
        btnPay.setOnClickListener(v -> {
            Intent intent = new Intent(this, OrderSuccessActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
        });
    }
}