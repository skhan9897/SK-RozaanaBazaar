package com.skrozana.app.ui.screens;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import com.skrozana.app.R;
import com.skrozana.app.utils.SessionManager;

public class ProfileActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        SessionManager sessionManager = new SessionManager(this);
        TextView tvUserName = findViewById(R.id.tvUserName);
        Button btnLogout = findViewById(R.id.btnLogout);

        tvUserName.setText(sessionManager.getUserName());

        findViewById(R.id.cardOrders).setOnClickListener(v -> {
            Toast.makeText(this, "My Orders coming soon!", Toast.LENGTH_SHORT).show();
        });

        findViewById(R.id.cardCart).setOnClickListener(v -> {
            startActivity(new Intent(ProfileActivity.this, CartActivity.class));
        });

        findViewById(R.id.cardBecomeSeller).setOnClickListener(v -> {
            Toast.makeText(this, "Become Seller feature coming soon!", Toast.LENGTH_SHORT).show();
        });

        btnLogout.setOnClickListener(v -> {
            sessionManager.logout();
            Intent intent = new Intent(ProfileActivity.this, LoginActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
            finish();
        });
    }
}
