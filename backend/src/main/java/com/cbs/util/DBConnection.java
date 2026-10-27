package com.cbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Aiven Cloud MySQL Configuration
    // Uses environment variables if set, otherwise falls back to Aiven cloud defaults
    private static final String URL = System.getenv().getOrDefault("DB_URL",
        "jdbc:mysql://165.22.161.226:16530/cbs_clg_db?useSSL=true&requireSSL=true&serverTimezone=UTC&allowPublicKeyRetrieval=true");
    private static final String USER = System.getenv().getOrDefault("DB_USER", "avnadmin");
    private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "");

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection successful!");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
        }
        return connection;
    }
}
