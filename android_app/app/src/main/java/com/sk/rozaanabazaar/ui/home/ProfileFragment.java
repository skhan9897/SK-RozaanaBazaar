package com.sk.rozaanabazaar.ui.home;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.utils.SessionManager;
import com.sk.rozaanabazaar.ui.auth.LoginActivity;
import com.sk.rozaanabazaar.ui.product.CartActivity;
import com.sk.rozaanabazaar.ui.product.AddProductActivity;

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
            TextView tvUserEmail = view.findViewById(R.id.tvUserEmail);
            if (tvUserEmail != null) tvUserEmail.setText("Customer ID: #" + sessionManager.getUserId());
        }

        view.findViewById(R.id.itemOrders).setOnClickListener(v -> {
            Toast.makeText(getContext(), "My Orders", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemWishlist).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Wishlist", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemCart).setOnClickListener(v -> {
            startActivity(new Intent(getContext(), CartActivity.class));
        });

        view.findViewById(R.id.itemAddresses).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Saved Addresses", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemPayments).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Payments", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemCoupons).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Coupons", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemNotifications).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Notifications", Toast.LENGTH_SHORT).show();
        });

        view.findViewById(R.id.itemHelp).setOnClickListener(v -> {
            Toast.makeText(getContext(), "Help & Support", Toast.LENGTH_SHORT).show();
        });

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
