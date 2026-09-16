package com.skrozana.app.ui.screens;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.skrozana.app.R;
import com.skrozana.app.utils.SessionManager;

public class ProfileFragment extends Fragment {
    private SessionManager sessionManager;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_profile, container, false);

        sessionManager = new SessionManager(getContext());
        TextView tvUserName = view.findViewById(R.id.tvUserName);
        View btnLogout = view.findViewById(R.id.btnLogout);

        if (sessionManager.isLoggedIn()) {
            tvUserName.setText(sessionManager.getUserName());
        }

        view.findViewById(R.id.cardOrders).setOnClickListener(v -> {
            Toast.makeText(getContext(), "My Orders coming soon!", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.cardCart).setOnClickListener(v -> {
            startActivity(new Intent(getContext(), CartActivity.class));
        });

        View cardBecomeSeller = view.findViewById(R.id.cardBecomeSeller);
        if (cardBecomeSeller != null) {
            cardBecomeSeller.setOnClickListener(v -> {
                startActivity(new Intent(getContext(), AddProductActivity.class));
            });
        }

        btnLogout.setOnClickListener(v -> {
            sessionManager.logout();
            Intent intent = new Intent(getContext(), LoginActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
            if (getActivity() != null) getActivity().finish();
        });

        return view;
    }
}
