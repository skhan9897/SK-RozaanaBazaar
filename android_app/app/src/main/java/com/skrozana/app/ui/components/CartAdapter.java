package com.skrozana.app.ui.components;

import android.graphics.Paint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.skrozana.app.R;
import com.skrozana.app.data.remote.RetrofitClient;
import com.skrozana.app.data.model.CartItem;
import com.skrozana.app.data.model.Product;
import com.squareup.picasso.Picasso;
import java.util.List;

public class CartAdapter extends RecyclerView.Adapter<CartAdapter.ViewHolder> {
    private List<CartItem> cartItems;
    private OnCartActionListener actionListener;

    public interface OnCartActionListener {
        void onRemoveItem(CartItem item);
        void onUpdateQuantity(CartItem item, int newQuantity);
    }

    public CartAdapter(List<CartItem> cartItems, OnCartActionListener actionListener) {
        this.cartItems = cartItems;
        this.actionListener = actionListener;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_cart, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        CartItem item = cartItems.get(position);
        Product product = item.getProduct();

        holder.tvName.setText(product.getProductName());
        holder.tvBrand.setText(product.getBrand());
        holder.tvPrice.setText("₹" + (int) product.getFinalPrice());

        if (product.getDiscount() > 0) {
            holder.tvOriginalPrice.setText("₹" + (int) product.getPrice());
            holder.tvOriginalPrice.setPaintFlags(holder.tvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
            holder.tvOriginalPrice.setVisibility(View.VISIBLE);
            holder.tvDiscount.setText((int) product.getDiscount() + "% off");
            holder.tvDiscount.setVisibility(View.VISIBLE);
        } else {
            holder.tvOriginalPrice.setVisibility(View.GONE);
            holder.tvDiscount.setVisibility(View.GONE);
        }

        holder.tvQty.setText(String.valueOf(item.getQuantity()));

        String imageUrl = product.getImage();
        if (imageUrl != null && !imageUrl.startsWith("http")) {
            imageUrl = RetrofitClient.BASE_URL + imageUrl;
        }

        Picasso.get()
                .load(imageUrl)
                .placeholder(R.drawable.ic_launcher_background)
                .into(holder.ivProduct);

        holder.tvRemove.setOnClickListener(v -> actionListener.onRemoveItem(item));

        holder.ivPlus.setOnClickListener(v -> {
            actionListener.onUpdateQuantity(item, item.getQuantity() + 1);
        });

        holder.ivMinus.setOnClickListener(v -> {
            if (item.getQuantity() > 1) {
                actionListener.onUpdateQuantity(item, item.getQuantity() - 1);
            }
        });
    }

    @Override
    public int getItemCount() {
        return cartItems.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        ImageView ivProduct, ivMinus, ivPlus;
        TextView tvName, tvBrand, tvPrice, tvOriginalPrice, tvDiscount, tvQty, tvRemove;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            ivProduct = itemView.findViewById(R.id.ivProduct);
            ivMinus = itemView.findViewById(R.id.ivMinus);
            ivPlus = itemView.findViewById(R.id.ivPlus);
            tvName = itemView.findViewById(R.id.tvName);
            tvBrand = itemView.findViewById(R.id.tvBrand);
            tvPrice = itemView.findViewById(R.id.tvPrice);
            tvOriginalPrice = itemView.findViewById(R.id.tvOriginalPrice);
            tvDiscount = itemView.findViewById(R.id.tvDiscount);
            tvQty = itemView.findViewById(R.id.tvQty);
            tvRemove = itemView.findViewById(R.id.tvRemove);
        }
    }
}
