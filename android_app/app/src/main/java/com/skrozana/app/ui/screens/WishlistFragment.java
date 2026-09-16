package com.skrozana.app.ui.screens;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;
import com.skrozana.app.R;
import com.skrozana.app.data.model.Product;
import com.skrozana.app.ui.components.ProductAdapter;
import com.skrozana.app.utils.WishlistManager;
import java.util.ArrayList;
import java.util.List;

public class WishlistFragment extends Fragment {
    private RecyclerView rvWishlist;
    private ProductAdapter adapter;
    private List<Product> wishlistItems = new ArrayList<>();
    private WishlistManager wishlistManager;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_wishlist, container, false);

        wishlistManager = new WishlistManager(getContext());
        rvWishlist = view.findViewById(R.id.rvWishlist);

        adapter = new ProductAdapter(wishlistItems);
        rvWishlist.setAdapter(adapter);

        loadWishlist();

        return view;
    }

    private void loadWishlist() {
        wishlistItems.clear();
        wishlistItems.addAll(wishlistManager.getWishlist());
        adapter.notifyDataSetChanged();
    }

    @Override
    public void onResume() {
        super.onResume();
        loadWishlist();
    }
}
