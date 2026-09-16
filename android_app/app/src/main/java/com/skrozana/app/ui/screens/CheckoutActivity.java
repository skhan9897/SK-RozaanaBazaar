package com.skrozana.app.ui.screens;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import com.skrozana.app.R;
import com.skrozana.app.data.remote.RetrofitClient;
import com.skrozana.app.utils.SessionManager;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CheckoutActivity extends AppCompatActivity {
    private EditText etAddress;
    private RadioGroup rgPayment;
    private TextView tvSubtotal, tvTotal;
    private Button btnPlaceOrder;
    private SessionManager sessionManager;
    private double totalAmount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_checkout);

        sessionManager = new SessionManager(this);
        totalAmount = getIntent().getDoubleExtra("total", 0.0);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }

        etAddress = findViewById(R.id.etAddress);
        rgPayment = findViewById(R.id.rgPayment);
        tvSubtotal = findViewById(R.id.tvSubtotal);
        tvTotal = findViewById(R.id.tvTotal);
        btnPlaceOrder = findViewById(R.id.btnPlaceOrder);

        tvSubtotal.setText("₹" + (int) totalAmount);
        tvTotal.setText("₹" + (int) totalAmount);

        btnPlaceOrder.setOnClickListener(v -> placeOrder());
    }

    private void placeOrder() {
        String address = etAddress.getText().toString().trim();
        if (address.isEmpty()) {
            Toast.makeText(this, "Please enter delivery address", Toast.LENGTH_SHORT).show();
            return;
        }

        int selectedId = rgPayment.getCheckedRadioButtonId();
        RadioButton rb = findViewById(selectedId);
        String paymentMethod = rb.getText().toString();

        RetrofitClient.getApiService().placeOrder(sessionManager.getUserId(), address, paymentMethod)
                .enqueue(new Callback<Map<String, Object>>() {
                    @Override
                    public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                        if (response.isSuccessful() && response.body() != null) {
                            Map<String, Object> body = response.body();
                            if ("success".equals(body.get("status"))) {
                                Intent intent = new Intent(CheckoutActivity.this, OrderSuccessActivity.class);
                                intent.putExtra("orderId", body.get("orderId").toString());
                                startActivity(intent);
                                finish();
                            } else {
                                Toast.makeText(CheckoutActivity.this, "Order failed", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }

                    @Override
                    public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                        Toast.makeText(CheckoutActivity.this, "Network Error", Toast.LENGTH_SHORT).show();
                    }
                });
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
}
