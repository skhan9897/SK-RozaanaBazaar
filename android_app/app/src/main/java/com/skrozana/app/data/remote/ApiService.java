package com.skrozana.app.data.remote;

import com.skrozana.app.data.model.Category;
import com.skrozana.app.data.model.Product;
import com.skrozana.app.data.model.CartItem;
import com.skrozana.app.data.model.User;
import java.util.List;
import java.util.Map;

import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FieldMap;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface ApiService {

    @GET("api/categories")
    Call<List<Category>> getCategories();

    @GET("api/products")
    Call<List<Product>> getProducts(@Query("categoryId") Integer categoryId);

    @GET("api/products/search")
    Call<List<Product>> searchProducts(@Query("q") String query);

    @FormUrlEncoded
    @POST("api/user")
    Call<Map<String, Object>> loginOrRegister(@FieldMap Map<String, String> fields);

    @FormUrlEncoded
    @POST("api/user")
    Call<Map<String, Object>> sendOtp(@Field("action") String action, @Field("phone") String phone);

    @FormUrlEncoded
    @POST("api/user")
    Call<Map<String, Object>> verifyOtp(@Field("action") String action, @Field("phone") String phone, @Field("otp") String otp);

    @FormUrlEncoded
    @POST("api/cart/add")
    Call<Map<String, Object>> addToCart(@Field("userId") int userId, @Field("productId") int productId, @Field("quantity") int quantity);

    @GET("api/cart")
    Call<List<CartItem>> getCart(@Query("userId") int userId);

    @FormUrlEncoded
    @POST("api/cart/remove")
    Call<Map<String, Object>> removeFromCart(@Field("userId") int userId, @Field("cartId") int cartId);

    @FormUrlEncoded
    @POST("api/cart/update")
    Call<Map<String, Object>> updateCartQuantity(@Field("userId") int userId, @Field("cartId") int cartId, @Field("quantity") int quantity);

    @FormUrlEncoded
    @POST("api/orders/place")
    Call<Map<String, Object>> placeOrder(@Field("userId") int userId, @Field("address") String address, @Field("paymentMethod") String paymentMethod);

    @Multipart
    @POST("api/products/add")
    Call<Map<String, Object>> addProduct(
            @Part("userId") RequestBody userId,
            @Part("name") RequestBody name,
            @Part("price") RequestBody price,
            @Part("description") RequestBody description,
            @Part("categoryId") RequestBody categoryId,
            @Part List<MultipartBody.Part> images
    );
}
