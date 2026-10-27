package com.cbs.model;

import java.sql.Timestamp;

/**
 * ContactQuery model class (JavaBean) for contact form submissions.
 * Maps to the 'contact_queries' table in cbs_db database.
 */
public class ContactQuery implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String program;
    private String message;
    private Timestamp createdAt;

    // Default constructor
    public ContactQuery() {}

    // Parameterized constructor
    public ContactQuery(String fullName, String email, String phone, String program, String message) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.program = program;
        this.message = message;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
