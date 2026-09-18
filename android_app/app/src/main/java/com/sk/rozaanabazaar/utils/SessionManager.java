package com.sk.rozaanabazaar.utils;

import android.content.Context;
import android.content.SharedPreferences;

public class SessionManager {
    private static final String PREF_NAME = "UserSession";
    private static final String KEY_USER_ID = "userId";
    private static final String KEY_USER_NAME = "userName";
    private static final String KEY_USER_TOKEN = "userToken";
    private static final String KEY_IS_LOGGED_IN = "isLoggedIn";

    private SharedPreferences pref;
    private SharedPreferences.Editor editor;
    private Context context;

    public SessionManager(Context context) {
        this.context = context;
        pref = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        editor = pref.edit();
    }

    private static final String KEY_PERSISTENT_TOKEN = "persistentToken";

    public void createLoginSession(int userId, String userName, String persistentToken) {
        editor.putInt(KEY_USER_ID, userId);
        editor.putString(KEY_USER_NAME, userName);
        editor.putString(KEY_PERSISTENT_TOKEN, persistentToken);
        editor.putBoolean(KEY_IS_LOGGED_IN, true);
        editor.apply();
    }

    public String getPersistentToken() {
        return pref.getString(KEY_PERSISTENT_TOKEN, null);
    }

    public void updatePersistentToken(String newToken) {
        editor.putString(KEY_PERSISTENT_TOKEN, newToken);
        editor.apply();
    }

    public void logout() {
        editor.clear();
        editor.apply();
    }
}
