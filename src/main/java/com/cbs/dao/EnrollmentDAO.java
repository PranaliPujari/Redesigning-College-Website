package com.cbs.dao;

import com.cbs.model.Enrollment;
import com.cbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for Enrollment operations.
 * Handles CRUD operations for the 'enrollments' table.
 */
public class EnrollmentDAO {

    /**
     * Add a new enrollment application to the database.
     * @param enrollment Enrollment object with form data
     * @return true if insertion successful, false otherwise
     */
    public boolean addEnrollment(Enrollment enrollment) {
        String sql = "INSERT INTO enrollments (student_name, phone_number, email_address, program_choice, qualification, percentage, message) VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, enrollment.getStudentName());
            ps.setString(2, enrollment.getPhoneNumber());
            ps.setString(3, enrollment.getEmailAddress());
            ps.setString(4, enrollment.getProgramChoice());
            ps.setString(5, enrollment.getQualification());
            ps.setString(6, enrollment.getPercentage());
            ps.setString(7, enrollment.getMessage());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get all enrollment applications from the database.
     * @return List of all Enrollment objects, ordered by most recent first
     */
    public List<Enrollment> getAllEnrollments() {
        List<Enrollment> list = new ArrayList<>();
        String sql = "SELECT * FROM enrollments ORDER BY id DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setId(rs.getInt("id"));
                e.setStudentName(rs.getString("student_name"));
                e.setPhoneNumber(rs.getString("phone_number"));
                e.setEmailAddress(rs.getString("email_address"));
                e.setProgramChoice(rs.getString("program_choice"));
                e.setQualification(rs.getString("qualification"));
                e.setPercentage(rs.getString("percentage"));
                e.setMessage(rs.getString("message"));
                e.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Get a single enrollment by ID.
     * @param id the enrollment ID
     * @return Enrollment object if found, null otherwise
     */
    public Enrollment getEnrollmentById(int id) {
        String sql = "SELECT * FROM enrollments WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Enrollment e = new Enrollment();
                    e.setId(rs.getInt("id"));
                    e.setStudentName(rs.getString("student_name"));
                    e.setPhoneNumber(rs.getString("phone_number"));
                    e.setEmailAddress(rs.getString("email_address"));
                    e.setProgramChoice(rs.getString("program_choice"));
                    e.setQualification(rs.getString("qualification"));
                    e.setPercentage(rs.getString("percentage"));
                    e.setMessage(rs.getString("message"));
                    e.setCreatedAt(rs.getTimestamp("created_at"));
                    return e;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Delete an enrollment by ID.
     * @param id the enrollment ID to delete
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteEnrollment(int id) {
        String sql = "DELETE FROM enrollments WHERE id = ?";
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
     * Get total count of enrollments.
     * @return number of enrollment records
     */
    public int getEnrollmentCount() {
        String sql = "SELECT COUNT(*) FROM enrollments";
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
