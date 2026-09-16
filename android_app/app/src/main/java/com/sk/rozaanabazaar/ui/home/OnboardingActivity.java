package com.sk.rozaanabazaar.ui.home;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import com.sk.rozaanabazaar.R;

public class OnboardingActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_onboarding);

        Button btnNext = findViewById(R.id.btnNext);
        TextView tvSkip = findViewById(R.id.tvSkip);
        TextView tvGetStarted = findViewById(R.id.tvGetStarted);

        View.OnClickListener launchMain = v -> {
            // Mark onboarding as completed
            SharedPreferences prefs = getSharedPreferences("SKBazaarPrefs", Context.MODE_PRIVATE);
            prefs.edit().putBoolean("isFirstTime", false).apply();

            startActivity(new Intent(OnboardingActivity.this, MainActivity.class));
            finish();
        };

        btnNext.setOnClickListener(launchMain);
        tvSkip.setOnClickListener(launchMain);
        tvGetStarted.setOnClickListener(launchMain);
    }
}