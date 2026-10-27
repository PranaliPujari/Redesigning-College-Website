package com.cbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database configuration
    // Set DB_USER and DB_PASSWORD as environment variables (do NOT hardcode credentials)
    private static final String URL = System.getenv().getOrDefault("DB_URL", "jdbc:mysql://localhost:3306/cbs_clg_db?useSSL=false&serverTimezone=UTC");
    private static final String USER = System.getenv().getOrDefault("DB_USER", "root");
    private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "");
    

    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection successful!");
            return connection;
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
    }
}
