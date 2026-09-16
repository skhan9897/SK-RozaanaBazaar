package com.sk.rozaanabazaar.ui.home;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        // 2.5 Seconds delay for faster startup
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                android.content.SharedPreferences prefs = getSharedPreferences("SKBazaarPrefs", android.content.Context.MODE_PRIVATE);
                boolean isFirstTime = prefs.getBoolean("isFirstTime", true);

                if (isFirstTime) {
                    startActivity(new Intent(SplashActivity.this, OnboardingActivity.class));
                } else {
                    startActivity(new Intent(SplashActivity.this, MainActivity.class));
                }
                finish();
            }
        }, 2500);
    }
}
