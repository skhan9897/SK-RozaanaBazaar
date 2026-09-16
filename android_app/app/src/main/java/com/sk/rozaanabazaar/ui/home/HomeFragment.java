package com.sk.rozaanabazaar.ui.home;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.ViewPager2;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.model.Category;
import com.sk.rozaanabazaar.model.Product;
import com.sk.rozaanabazaar.adapter.CategoryAdapter;
import com.sk.rozaanabazaar.adapter.ProductAdapter;
import com.sk.rozaanabazaar.adapter.SliderAdapter;
import java.util.ArrayList;
import java.util.List;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class HomeFragment extends Fragment {
    private RecyclerView rvCategories, rvProducts, rvDeals, rvBestSellers, rvRecentlyViewed;
    private ViewPager2 viewPagerSlider;
    private CategoryAdapter categoryAdapter;
    private ProductAdapter productAdapter, dealsAdapter, bestSellersAdapter, recentlyViewedAdapter;
    private List<Category> categories = new ArrayList<>();
    private List<Product> products = new ArrayList<>();
    private List<Product> deals = new ArrayList<>();
    private List<Product> bestSellers = new ArrayList<>();
    private List<Product> recentlyViewed = new ArrayList<>();

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home, container, false);

        rvCategories = view.findViewById(R.id.rvCategories);
        rvProducts = view.findViewById(R.id.rvProducts);
        rvDeals = view.findViewById(R.id.rvDeals);
        rvBestSellers = view.findViewById(R.id.rvBestSellers);
        rvRecentlyViewed = view.findViewById(R.id.rvRecentlyViewed);
        viewPagerSlider = view.findViewById(R.id.viewPagerSlider);

        view.findViewById(R.id.ivNotification).setOnClickListener(v -> Toast.makeText(getContext(), "Notifications", Toast.LENGTH_SHORT).show());
        view.findViewById(R.id.ivCart).setOnClickListener(v -> {
            startActivity(new Intent(getContext(), com.sk.rozaanabazaar.ui.product.CartActivity.class));
        });

        view.findViewById(R.id.searchBarTrigger).setOnClickListener(v -> {
            startActivity(new Intent(getContext(), com.sk.rozaanabazaar.ui.product.ProductSearchActivity.class));
        });

        setupSlider();

        categoryAdapter = new CategoryAdapter(categories, category -> loadProducts(category.getId()));
        rvCategories.setAdapter(categoryAdapter);

        productAdapter = new ProductAdapter(products);
        rvProducts.setAdapter(productAdapter);

        dealsAdapter = new ProductAdapter(deals);
        rvDeals.setAdapter(dealsAdapter);

        bestSellersAdapter = new ProductAdapter(bestSellers);
        rvBestSellers.setAdapter(bestSellersAdapter);

        recentlyViewedAdapter = new ProductAdapter(recentlyViewed);
        rvRecentlyViewed.setAdapter(recentlyViewedAdapter);

        loadCategories();
        loadProducts(null);

        return view;
    }

    private void setupSlider() {
        List<String> images = new ArrayList<>();
        images.add("https://img.freepik.com/free-vector/grocery-store-sale-banner-template_23-2150098555.jpg");
        images.add("https://img.freepik.com/free-vector/flat-supermarket-social-media-promo-template_23-2149363384.jpg");
        viewPagerSlider.setAdapter(new SliderAdapter(images));
    }

    private void loadCategories() {
        RetrofitClient.getApiService().getCategories().enqueue(new Callback<List<Category>>() {
            @Override
            public void onResponse(Call<List<Category>> call, Response<List<Category>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    List<Category> all = response.body();
                    categories.clear();
                    
                    // Blueprint categories to prioritize
                    String[] blueprint = {"Grocery", "Mobiles", "Electronics", "Fashion", "Beauty", "Home & Kitchen", "Appliances", "Shoes", "Books", "Toys", "Sports"};
                    
                    for (String name : blueprint) {
                        for (Category c : all) {
                            if (c.getName().toLowerCase().contains(name.toLowerCase())) {
                                categories.add(c);
                                break;
                            }
                        }
                    }
                    
                    // Add remaining if less than expected
                    if (categories.size() < 5) {
                        categories.addAll(all);
                    }
                    
                    categoryAdapter.notifyDataSetChanged();
                }
            }

            @Override
            public void onFailure(Call<List<Category>> call, Throwable t) {
                if (getContext() != null)
                    Toast.makeText(getContext(), "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void loadProducts(Integer categoryId) {
        RetrofitClient.getApiService().getProducts(categoryId).enqueue(new Callback<List<Product>>() {
            @Override
            public void onResponse(Call<List<Product>> call, Response<List<Product>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    List<Product> all = response.body();
                    
                    // Separate into Deals and Recommended
                    deals.clear();
                    products.clear();
                    
                    if (all.size() > 4) {
                        deals.addAll(all.subList(0, 4));
                        bestSellers.addAll(all.subList(0, Math.min(all.size(), 8))); // Best sellers also from top
                        products.addAll(all.subList(4, all.size()));
                    } else {
                        products.addAll(all);
                    }
                    
                    dealsAdapter.notifyDataSetChanged();
                    bestSellersAdapter.notifyDataSetChanged();
                    productAdapter.notifyDataSetChanged();
                }
            }

            @Override
            public void onFailure(Call<List<Product>> call, Throwable t) {
                if (getContext() != null)
                    Toast.makeText(getContext(), "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }
}
