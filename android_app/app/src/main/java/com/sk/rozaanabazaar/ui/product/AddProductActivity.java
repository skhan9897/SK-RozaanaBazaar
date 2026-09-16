package com.sk.rozaanabazaar.ui.product;

import android.net.Uri;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import com.sk.rozaanabazaar.R;
import com.sk.rozaanabazaar.network.RetrofitClient;
import com.sk.rozaanabazaar.adapter.SelectedImageAdapter;
import com.sk.rozaanabazaar.utils.SessionManager;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AddProductActivity extends AppCompatActivity {
    private EditText etName, etPrice, etDescription, etCategoryId;
    private RecyclerView rvSelectedImages;
    private Button btnAddImages, btnSubmit;
    private List<Uri> selectedImageUris = new ArrayList<>();
    private SelectedImageAdapter adapter;
    private SessionManager sessionManager;

    private final ActivityResultLauncher<String> selectImagesLauncher =
            registerForActivityResult(new ActivityResultContracts.GetMultipleContents(), uris -> {
                if (uris != null && !uris.isEmpty()) {
                    selectedImageUris.addAll(uris);
                    adapter.notifyDataSetChanged();
                }
            });

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_product);

        sessionManager = new SessionManager(this);
        etName = findViewById(R.id.etProductName);
        etPrice = findViewById(R.id.etProductPrice);
        etDescription = findViewById(R.id.etProductDescription);
        etCategoryId = findViewById(R.id.etCategoryId);
        rvSelectedImages = findViewById(R.id.rvSelectedImages);
        btnAddImages = findViewById(R.id.btnAddImages);
        btnSubmit = findViewById(R.id.btnSubmitProduct);

        adapter = new SelectedImageAdapter(selectedImageUris);
        rvSelectedImages.setAdapter(adapter);

        btnAddImages.setOnClickListener(v -> selectImagesLauncher.launch("image/*"));
        btnSubmit.setOnClickListener(v -> uploadProduct());
    }

    private void uploadProduct() {
        String name = etName.getText().toString().trim();
        String price = etPrice.getText().toString().trim();
        String description = etDescription.getText().toString().trim();
        String categoryId = etCategoryId.getText().toString().trim();

        if (name.isEmpty() || price.isEmpty() || categoryId.isEmpty() || selectedImageUris.isEmpty()) {
            Toast.makeText(this, "Please fill required fields and select images", Toast.LENGTH_SHORT).show();
            return;
        }

        RequestBody rbUserId = RequestBody.create(MediaType.parse("text/plain"), String.valueOf(sessionManager.getUserId()));
        RequestBody rbName = RequestBody.create(MediaType.parse("text/plain"), name);
        RequestBody rbPrice = RequestBody.create(MediaType.parse("text/plain"), price);
        RequestBody rbDesc = RequestBody.create(MediaType.parse("text/plain"), description);
        RequestBody rbCatId = RequestBody.create(MediaType.parse("text/plain"), categoryId);

        List<MultipartBody.Part> imageParts = new ArrayList<>();
        for (int i = 0; i < selectedImageUris.size(); i++) {
            File file = getFileFromUri(selectedImageUris.get(i), "prod_img_" + i);
            if (file != null) {
                RequestBody requestFile = RequestBody.create(MediaType.parse("image/*"), file);
                imageParts.add(MultipartBody.Part.createFormData("images[]", file.getName(), requestFile));
            }
        }

        btnSubmit.setEnabled(false);
        btnSubmit.setText("Uploading...");

        RetrofitClient.getApiService().addProduct(rbUserId, rbName, rbPrice, rbDesc, rbCatId, imageParts)
                .enqueue(new Callback<Map<String, Object>>() {
                    @Override
                    public void onResponse(Call<Map<String, Object>> call, Response<Map<String, Object>> response) {
                        btnSubmit.setEnabled(true);
                        btnSubmit.setText("Upload Product");
                        if (response.isSuccessful() && response.body() != null) {
                            if ("success".equals(response.body().get("status"))) {
                                Toast.makeText(AddProductActivity.this, "Product uploaded successfully!", Toast.LENGTH_LONG).show();
                                finish();
                            } else {
                                Toast.makeText(AddProductActivity.this, (String) response.body().get("message"), Toast.LENGTH_SHORT).show();
                            }
                        }
                    }

                    @Override
                    public void onFailure(Call<Map<String, Object>> call, Throwable t) {
                        btnSubmit.setEnabled(true);
                        btnSubmit.setText("Upload Product");
                        Toast.makeText(AddProductActivity.this, "Upload failed: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                });
    }

    private File getFileFromUri(Uri uri, String prefix) {
        try {
            InputStream inputStream = getContentResolver().openInputStream(uri);
            File file = new File(getCacheDir(), prefix + "_" + System.currentTimeMillis() + ".jpg");
            FileOutputStream outputStream = new FileOutputStream(file);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }
            outputStream.close();
            inputStream.close();
            return file;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}