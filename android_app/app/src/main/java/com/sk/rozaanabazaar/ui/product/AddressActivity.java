package com.sk.rozaanabazaar.ui.product;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;

public class AddressActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_address);

        findViewById(R.id.toolbarAddress).setOnClickListener(v -> finish());

        Button btnPayment = findViewById(R.id.btnContinueToPayment);
        btnPayment.setOnClickListener(v -> {
            Intent intent = new Intent(this, PaymentActivity.class);
            // Pass total amount from previous activity
            intent.putExtra("total", getIntent().getDoubleExtra("total", 0));
            startActivity(intent);
        });
    }
}