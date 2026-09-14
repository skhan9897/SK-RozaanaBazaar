package com.skrozana.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/skrozana_db";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = "password";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Read from environment variables, fallback to defaults
            String url = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : DEFAULT_URL;
            String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : DEFAULT_USER;
            String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : DEFAULT_PASSWORD;

            Class.forName(DRIVER);
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
