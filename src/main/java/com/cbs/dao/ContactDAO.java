package com.cbs.dao;

import com.cbs.model.ContactQuery;
import com.cbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for ContactQuery operations.
 * Handles CRUD operations for the 'contact_queries' table.
 */
public class ContactDAO {

    /**
     * Add a new contact query to the database.
     * @param contact ContactQuery object with form data
     * @return true if insertion successful, false otherwise
     */
    public boolean addContactQuery(ContactQuery contact) {
        String sql = "INSERT INTO contact_queries (full_name, email, phone, program, message) VALUES (?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getPhone());
            ps.setString(4, contact.getProgram());
            ps.setString(5, contact.getMessage());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get all contact queries from the database.
     * @return List of all ContactQuery objects, ordered by most recent first
     */
    public List<ContactQuery> getAllContactQueries() {
        List<ContactQuery> list = new ArrayList<>();
        String sql = "SELECT * FROM contact_queries ORDER BY id DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                ContactQuery cq = new ContactQuery();
                cq.setId(rs.getInt("id"));
                cq.setFullName(rs.getString("full_name"));
                cq.setEmail(rs.getString("email"));
                cq.setPhone(rs.getString("phone"));
                cq.setProgram(rs.getString("program"));
                cq.setMessage(rs.getString("message"));
                cq.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(cq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Delete a contact query by ID.
     * @param id the contact query ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteContactQuery(int id) {
        String sql = "DELETE FROM contact_queries WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get total count of contact queries.
     * @return number of contact query records
     */
    public int getContactQueryCount() {
        String sql = "SELECT COUNT(*) FROM contact_queries";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}

