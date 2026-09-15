package com.skrozana.app.api;

import com.skrozana.app.model.Category;
import com.skrozana.app.model.Product;
import com.skrozana.app.model.User;
import java.util.List;
import java.util.Map;
import retrofit2.Call;
import retrofit2.http.FieldMap;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;

public interface ApiService {

    @GET("api/categories")
    Call<List<Category>> getCategories();

    @GET("api/products")
    Call<List<Product>> getProducts(@Query("categoryId") Integer categoryId);

    @FormUrlEncoded
    @POST("api/user")
    Call<Map<String, Object>> loginOrRegister(@FieldMap Map<String, String> fields);
}
