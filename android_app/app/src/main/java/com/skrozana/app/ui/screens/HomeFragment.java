package com.skrozana.app.ui.screens;

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
import com.skrozana.app.R;
import com.skrozana.app.data.remote.RetrofitClient;
import com.skrozana.app.data.model.Category;
import com.skrozana.app.data.model.Product;
import com.skrozana.app.ui.components.CategoryAdapter;
import com.skrozana.app.ui.components.ProductAdapter;
import com.skrozana.app.ui.components.SliderAdapter;
import java.util.ArrayList;
import java.util.List;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class HomeFragment extends Fragment {
    private RecyclerView rvCategories, rvProducts;
    private ViewPager2 viewPagerSlider;
    private CategoryAdapter categoryAdapter;
    private ProductAdapter productAdapter;
    private List<Category> categories = new ArrayList<>();
    private List<Product> products = new ArrayList<>();

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home, container, false);

        rvCategories = view.findViewById(R.id.rvCategories);
        rvProducts = view.findViewById(R.id.rvProducts);
        viewPagerSlider = view.findViewById(R.id.viewPagerSlider);

        setupSlider();

        categoryAdapter = new CategoryAdapter(categories, category -> loadProducts(category.getId()));
        rvCategories.setAdapter(categoryAdapter);

        productAdapter = new ProductAdapter(products);
        rvProducts.setAdapter(productAdapter);

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
                    categories.clear();
                    categories.addAll(response.body());
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
                    products.clear();
                    products.addAll(response.body());
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
