package com.sk.rozaanabazaar.ui.product;

import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognizerIntent;
import android.view.KeyEvent;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.chip.Chip;
import com.google.android.material.chip.ChipGroup;
import com.sk.rozaanabazaar.R;
import java.util.ArrayList;
import java.util.Locale;

public class ProductSearchActivity extends AppCompatActivity {
    private static final int VOICE_SEARCH_CODE = 1001;
    private EditText etSearch;
    private ImageButton btnBack;
    private ImageView btnVoiceSearch;
    private ChipGroup cgSuggestions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_search);

        etSearch = findViewById(R.id.etSearch);
        btnBack = findViewById(R.id.btnBack);
        btnVoiceSearch = findViewById(R.id.btnVoiceSearch);
        cgSuggestions = findViewById(R.id.cgSuggestions);

        btnBack.setOnClickListener(v -> finish());

        btnVoiceSearch.setOnClickListener(v -> startVoiceSearch());

        etSearch.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH || 
                (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) {
                performSearch(etSearch.getText().toString().trim());
                return true;
            }
            return false;
        });

        setupSuggestions();
    }

    private void setupSuggestions() {
        String[] suggestions = {"Mobile", "Laptop", "Groceries", "Shoes", "T-Shirt", "Saree", "Atta"};
        for (String s : suggestions) {
            Chip chip = new Chip(this);
            chip.setText(s);
            chip.setClickable(true);
            chip.setOnClickListener(v -> {
                etSearch.setText(s);
                performSearch(s);
            });
            cgSuggestions.addView(chip);
        }
    }

    private void startVoiceSearch() {
        Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
        intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault());
        intent.putExtra(RecognizerIntent.EXTRA_PROMPT, "Speak to search");
        try {
            startActivityForResult(intent, VOICE_SEARCH_CODE);
        } catch (Exception e) {
            Toast.makeText(this, "Voice search not supported on this device", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == VOICE_SEARCH_CODE && resultCode == RESULT_OK && data != null) {
            ArrayList<String> result = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
            if (result != null && !result.isEmpty()) {
                etSearch.setText(result.get(0));
                performSearch(result.get(0));
            }
        }
    }

    private void performSearch(String query) {
        if (query.isEmpty()) return;
        
        Intent intent = new Intent(this, ProductListActivity.class);
        intent.putExtra("searchQuery", query);
        startActivity(intent);
    }
}