package com.sk.rozaanabazaar.utils;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sk.rozaanabazaar.model.Product;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class WishlistManager {
    private static final String PREF_NAME = "WishlistPref";
    private static final String KEY_WISHLIST = "wishlistItems";
    private SharedPreferences pref;
    private Gson gson;

    public WishlistManager(Context context) {
        pref = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        gson = new Gson();
    }

    public void addToWishlist(Product product) {
        List<Product> wishlist = getWishlist();
        for (Product p : wishlist) {
            if (p.getId() == product.getId()) return;
        }
        wishlist.add(product);
        saveWishlist(wishlist);
    }

    public void removeFromWishlist(int productId) {
        List<Product> wishlist = getWishlist();
        for (int i = 0; i < wishlist.size(); i++) {
            if (wishlist.get(i).getId() == productId) {
                wishlist.remove(i);
                break;
            }
        }
        saveWishlist(wishlist);
    }

    public boolean isInWishlist(int productId) {
        List<Product> wishlist = getWishlist();
        for (Product p : wishlist) {
            if (p.getId() == productId) return true;
        }
        return false;
    }

    public List<Product> getWishlist() {
        String json = pref.getString(KEY_WISHLIST, null);
        if (json == null) return new ArrayList<>();
        Type type = new TypeToken<List<Product>>() {}.getType();
        return gson.fromJson(json, type);
    }

    private void saveWishlist(List<Product> wishlist) {
        String json = gson.toJson(wishlist);
        pref.edit().putString(KEY_WISHLIST, json).apply();
    }
}
