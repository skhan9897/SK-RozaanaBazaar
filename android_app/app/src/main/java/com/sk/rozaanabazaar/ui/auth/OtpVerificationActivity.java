package com.sk.rozaanabazaar.ui.auth;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.utils.SessionManager;
import com.sk.rozaanabazaar.ui.home.MainActivity;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class OtpVerificationActivity extends AppCompatActivity {
    private EditText etOtp;
    private Button btnVerify;
    private TextView tvResendOtp;
    private SessionManager sessionManager;
    private String phoneNumber;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_otp_verification);

        sessionManager = new SessionManager(this);
        phoneNumber = getIntent().getStringExtra("phone");

        etOtp = findViewById(R.id.etOtp);
        btnVerify = findViewById(R.id.btnVerify);
        tvResendOtp = findViewById(R.id.tvResendOtp);

        btnVerify.setOnClickListener(v -> {
            String otp = etOtp.getText().toString();
            if (otp.length() == 6) {
                verifyOtp(otp);
            } else {
                Toast.makeText(this, "Enter a valid 6-digit OTP", Toast.LENGTH_SHORT).show();
            }
        });

        tvResendOtp.setOnClickListener(v -> {
            resendOtp();
        });
    }

    private void verifyOtp(String otp) {
        RetrofitClient.getApiService().verifyOtp("verify_otp", phoneNumber, otp).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Map<String, Object> body = response.body();
                    if ("success".equals(body.get("status"))) {
                        double userId = (double) body.get("userId");
                        String name = (String) body.get("name");
                        String token = body.containsKey("token") ? (String) body.get("token") : "";
                        sessionManager.createLoginSession((int) userId, name, token);

                        startActivity(new Intent(OtpVerificationActivity.this, MainActivity.class));
                        finishAffinity();
                    } else {
                        Toast.makeText(OtpVerificationActivity.this, (String) body.get("message"), Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                Toast.makeText(OtpVerificationActivity.this, "Network Error", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void resendOtp() {
        RetrofitClient.getApiService().sendOtp("send_otp", phoneNumber).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Toast.makeText(OtpVerificationActivity.this, (String) response.body().get("message"), Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                Toast.makeText(OtpVerificationActivity.this, "Network Error", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
