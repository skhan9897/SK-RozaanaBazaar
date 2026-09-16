package com.sk.rozaanabazaar.adapter;

import android.content.Intent;
import android.graphics.Paint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.model.Product;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.ui.product.ProductDetailsActivity;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;
import android.util.Log;
import java.util.List;

public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ViewHolder> {
    private List<Product> products;

    public ProductAdapter(List<Product> products) {
        this.products = products;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_product, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Product product = products.get(position);
        holder.tvProductName.setText(product.getProductName());
        holder.tvPrice.setText("₹" + (int) product.getFinalPrice());

        if (product.getDiscount() > 0) {
            holder.tvOriginalPrice.setText("₹" + (int) product.getPrice());
            holder.tvOriginalPrice.setPaintFlags(holder.tvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
            holder.tvOriginalPrice.setVisibility(View.VISIBLE);

            holder.tvDiscountOffer.setText((int) product.getDiscount() + "% off");
            holder.tvDiscountOffer.setVisibility(View.VISIBLE);
        } else {
            holder.tvOriginalPrice.setVisibility(View.GONE);
            holder.tvDiscountOffer.setVisibility(View.GONE);
        }

        if (product.getRating() > 0) {
            if (holder.tvRating != null) holder.tvRating.setText(String.valueOf(product.getRating()));
            holder.llRating.setVisibility(View.VISIBLE);
        } else {
            holder.llRating.setVisibility(View.GONE);
        }

        String imageUrl = product.getImage();
        if (imageUrl == null || imageUrl.trim().isEmpty() || imageUrl.contains("placeholder") || imageUrl.contains("via.placeholder")) {
            String name = product.getProductName();
            if (name != null) {
                String lowerName = name.toLowerCase();
                if (lowerName.contains("galaxy")) imageUrl = "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500&auto=format&fit=crop";
                else if (lowerName.contains("iphone")) imageUrl = "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=500&auto=format&fit=crop";
                else if (lowerName.contains("oneplus") || lowerName.contains("nord")) imageUrl = "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop";
                else if (lowerName.contains("laptop")) imageUrl = "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop";
                else if (lowerName.contains("monitor")) imageUrl = "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500&auto=format&fit=crop";
                else if (lowerName.contains("earbuds")) imageUrl = "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&auto=format&fit=crop";
                else if (lowerName.contains("headphones")) imageUrl = "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop";
                else if (lowerName.contains("t-shirt")) imageUrl = "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500&auto=format&fit=crop";
                else if (lowerName.contains("shirt")) imageUrl = "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500&auto=format&fit=crop";
                else if (lowerName.contains("saree")) imageUrl = "https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500&auto=format&fit=crop";
                else if (lowerName.contains("kurti")) imageUrl = "https://images.unsplash.com/photo-1608963503737-f98de08a6b7f?w=500&auto=format&fit=crop";
                else if (lowerName.contains("atta")) imageUrl = "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop";
                else if (lowerName.contains("rice")) imageUrl = "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500&auto=format&fit=crop";
                else if (lowerName.contains("oil")) imageUrl = "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500&auto=format&fit=crop";
                else imageUrl = "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60";
            } else {
                imageUrl = "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60";
            }
        } else {
            imageUrl = imageUrl.trim();
            if (imageUrl.startsWith("/")) {
                imageUrl = imageUrl.substring(1);
            }
            if (!imageUrl.startsWith("http")) {
                if (!imageUrl.startsWith("images/") && !imageUrl.startsWith("uploads/")) {
                    imageUrl = "images/" + imageUrl;
                }
                imageUrl = RetrofitClient.BASE_URL + imageUrl;
            }
        }

        Log.d("ProductAdapter", "Loading Image for " + product.getProductName() + ": " + imageUrl);

        Picasso.get()
                .load(imageUrl)
                .fit()
                .centerInside()
                .placeholder(R.drawable.ic_launcher_background)
                .error(R.drawable.ic_launcher_background)
                .into(holder.ivProduct);

        View.OnClickListener clickListener = v -> {
            Intent intent = new Intent(v.getContext(), ProductDetailsActivity.class);
            intent.putExtra("product", new Gson().toJson(product));
            v.getContext().startActivity(intent);
        };

        holder.itemView.setOnClickListener(clickListener);

        ImageView ivWishlist = holder.itemView.findViewById(R.id.ivWishlist);
        if (ivWishlist != null) {
            ivWishlist.setOnClickListener(v -> {
                Toast.makeText(v.getContext(), "Added to wishlist", Toast.LENGTH_SHORT).show();
                ivWishlist.setColorFilter(android.graphics.Color.RED);
            });
        }

        if (holder.btnAddToCart != null) {
            holder.btnAddToCart.setOnClickListener(v -> {
                Toast.makeText(v.getContext(), "Added to cart", Toast.LENGTH_SHORT).show();
            });
        }

        holder.btnBuyNow.setOnClickListener(v -> {
            Intent intent = new Intent(v.getContext(), ProductDetailsActivity.class);
            intent.putExtra("product", new Gson().toJson(product));
            v.getContext().startActivity(intent);
        });
    }

    @Override
    public int getItemCount() {
        return products.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        ImageView ivProduct;
        TextView tvProductName, tvPrice, tvOriginalPrice, tvDiscountOffer, tvRating;
        View llRating;
        Button btnAddToCart, btnBuyNow;
        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            ivProduct = itemView.findViewById(R.id.ivProduct);
            tvProductName = itemView.findViewById(R.id.tvProductName);
            tvPrice = itemView.findViewById(R.id.tvPrice);
            tvOriginalPrice = itemView.findViewById(R.id.tvOriginalPrice);
            tvDiscountOffer = itemView.findViewById(R.id.tvDiscountOffer);
            int tvRatingId = itemView.getContext().getResources().getIdentifier("tvRating", "id", itemView.getContext().getPackageName());
            if (tvRatingId != 0) {
                tvRating = itemView.findViewById(tvRatingId);
            } else {
                tvRating = null;
            }
            llRating = itemView.findViewById(R.id.llRating);
            btnAddToCart = itemView.findViewById(R.id.btnAddToCart);
            btnBuyNow = itemView.findViewById(R.id.btnBuyNow);
        }
    }
}
