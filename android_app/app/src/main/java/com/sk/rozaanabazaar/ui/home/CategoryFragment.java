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
import androidx.recyclerview.widget.RecyclerView;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.model.Category;
import com.sk.rozaanabazaar.adapter.CategoryAdapter;
import com.sk.rozaanabazaar.adapter.MainCategoryAdapter;
import com.sk.rozaanabazaar.ui.product.ProductListActivity;
import java.util.ArrayList;
import java.util.List;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CategoryFragment extends Fragment {
    private RecyclerView rvMainCategories, rvSubCategories;
    private CategoryAdapter subAdapter;
    private MainCategoryAdapter mainAdapter;
    private TextView tvCategoryTitle;
    private List<Category> categoryList = new ArrayList<>();

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_category, container, false);

        rvMainCategories = view.findViewById(R.id.rvMainCategories);
        rvSubCategories = view.findViewById(R.id.rvSubCategories);
        tvCategoryTitle = view.findViewById(R.id.tvCategoryTitle);

        mainAdapter = new MainCategoryAdapter(categoryList, (category, position) -> {
            tvCategoryTitle.setText(category.getName());
            // In a real app, you'd load sub-categories here.
            // For now, we just refresh the right side with the same list as a placeholder.
            subAdapter.notifyDataSetChanged();
        });
        rvMainCategories.setAdapter(mainAdapter);

        subAdapter = new CategoryAdapter(categoryList, category -> {
            Intent intent = new Intent(getContext(), ProductListActivity.class);
            intent.putExtra("categoryId", category.getId());
            intent.putExtra("categoryName", category.getName());
            startActivity(intent);
        });
        rvSubCategories.setAdapter(subAdapter);

        loadCategories();

        return view;
    }

    private void loadCategories() {
        RetrofitClient.getApiService().getCategories().enqueue(new Callback<List<Category>>() {
            @Override
            public void onResponse(Call<List<Category>> call, Response<List<Category>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    categoryList.clear();
                    categoryList.addAll(response.body());
                    mainAdapter.notifyDataSetChanged();
                    subAdapter.notifyDataSetChanged();
                    if (!categoryList.isEmpty()) {
                        tvCategoryTitle.setText(categoryList.get(0).getName());
                    }
                }
            }

            @Override
            public void onFailure(Call<List<Category>> call, Throwable t) {
                if (getContext() != null)
                    Toast.makeText(getContext(), "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }
}
