package com.skrozana.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
    private static final String DEFAULT_URL = "jdbc:mysql://bamupc1fh4jwu1sxij7n-mysql.services.clever-cloud.com:3306/bamupc1fh4jwu1sxij7n";
    private static final String DEFAULT_USER = "uw1i0y5e163vztxv";
    private static final String DEFAULT_PASSWORD = "VQzfMMHPpqHquYUleFyx";
    
    private static HikariDataSource dataSource;

    static {
        System.out.println("Initializing DBConnection static block...");
        try {
            System.out.println("Loading MySQL Driver: com.mysql.cj.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            HikariConfig config = new HikariConfig();
            String url = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : DEFAULT_URL;
            String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : DEFAULT_USER;
            String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : DEFAULT_PASSWORD;

            System.out.println("Connecting to database URL: " + (url != null ? url.split("\\?")[0] : "null"));
            
            config.setJdbcUrl(url);
            config.setUsername(user);
            config.setPassword(password);
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");
            
            // Performance Tuning
            config.setMaximumPoolSize(10);
            config.setMinimumIdle(5);
            config.setIdleTimeout(300000);
            config.setConnectionTimeout(20000);
            config.addDataSourceProperty("cachePrepStmts", "true");
            config.addDataSourceProperty("prepStmtCacheSize", "250");
            config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

            dataSource = new HikariDataSource(config);
            System.out.println("HikariCP Data Source initialized successfully.");
        } catch (Exception e) {
            System.err.println("CRITICAL: Failed to initialize HikariCP Data Source!");
            System.err.println("Error details: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            System.err.println("DBConnection.getConnection() called but dataSource is NULL!");
            throw new SQLException("Data Source is not initialized. Check server logs for startup errors.");
        }
        
        try {
            Connection conn = dataSource.getConnection();
            if (conn == null) {
                throw new SQLException("HikariDataSource.getConnection() returned null.");
            }
            return conn;
        } catch (SQLException e) {
            System.err.println("Error getting connection from data source: " + e.getMessage());
            throw e;
        }
    }
}
