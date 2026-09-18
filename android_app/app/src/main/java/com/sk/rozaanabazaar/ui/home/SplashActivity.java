package com.sk.rozaanabazaar.ui.home;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;

import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.utils.SessionManager;
import java.util.Map;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                SessionManager sessionManager = new SessionManager(SplashActivity.this);
                if (sessionManager.isLoggedIn()) {
                    validatePersistentSession(sessionManager);
                } else {
                    android.content.SharedPreferences prefs = getSharedPreferences("SKBazaarPrefs", android.content.Context.MODE_PRIVATE);
                    if (prefs.getBoolean("isFirstTime", true)) {
                        startActivity(new Intent(SplashActivity.this, OnboardingActivity.class));
                    } else {
                        startActivity(new Intent(SplashActivity.this, MainActivity.class));
                    }
                    finish();
                }
            }
        }, 2000);
    }

    private void validatePersistentSession(SessionManager sessionManager) {
        String token = sessionManager.getPersistentToken();
        if (token == null) {
            startActivity(new Intent(this, MainActivity.class));
            finish();
            return;
        }

        RetrofitClient.getApiService().validateToken("validateToken", token).enqueue(new Callback<Map<String, Object>>() {
            @Override
            public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    Map<String, Object> body = response.body();
                    if ("success".equals(body.get("status"))) {
                        // Token Rotated
                        String newToken = (String) body.get("persistentToken");
                        sessionManager.updatePersistentToken(newToken);
                        startActivity(new Intent(SplashActivity.this, MainActivity.class));
                    } else {
                        sessionManager.logout();
                        startActivity(new Intent(SplashActivity.this, com.sk.rozaanabazaar.ui.auth.LoginActivity.class));
                    }
                } else {
                    // Network issue, continue with current session offline if possible
                    startActivity(new Intent(SplashActivity.this, MainActivity.class));
                }
                finish();
            }

            @Override
            public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                // Network failure, assume token is still valid for now
                startActivity(new Intent(SplashActivity.this, MainActivity.class));
                finish();
            }
        });
    }
}
