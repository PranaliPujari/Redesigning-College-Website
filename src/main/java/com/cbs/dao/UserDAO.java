package com.cbs.dao;

import com.cbs.model.User;
import com.cbs.util.DBConnection;

import java.sql.*;

/**
 * Data Access Object for User operations.
 * Handles CRUD operations for the 'users' table.
 */
public class UserDAO {

    /**
     * Register a new user in the database.
     * @param user User object with registration details
     * @return true if registration successful, false otherwise
     */
    public boolean registerUser(User user) {
        String query = "INSERT INTO users (username, password, full_name, email, role) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getFullName());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getRole() != null ? user.getRole() : "admin");

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error registering user: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Authenticate a user by username and password.
     * @param username the username
     * @param password the password
     * @return User object if credentials match, null otherwise
     */
    public User loginUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                return user;
            }

        } catch (SQLException e) {
            System.out.println("Error during login: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a user by their ID.
     * @param id the user ID
     * @return User object if found, null otherwise
     */
    public User getUserById(int id) {
        String query = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                return user;
            }

        } catch (SQLException e) {
            System.out.println("Error getting user: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Check if a username already exists.
     * @param username the username to check
     * @return true if username exists, false otherwise
     */
    public boolean isUsernameExists(String username) {
        String query = "SELECT COUNT(*) FROM users WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
