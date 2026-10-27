package com.cbs.model;

import java.sql.Timestamp;

/**
 * Enrollment model class (JavaBean) for student enrollment applications.
 * Maps to the 'enrollments' table in cbs_db database.
 */
public class Enrollment implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String studentName;
    private String phoneNumber;
    private String emailAddress;
    private String programChoice;
    private String qualification;
    private String percentage;
    private String message;
    private Timestamp createdAt;

    // Default constructor
    public Enrollment() {}

    // Parameterized constructor
    public Enrollment(String studentName, String phoneNumber, String emailAddress,
                      String programChoice, String qualification, String percentage, String message) {
        this.studentName = studentName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.programChoice = programChoice;
        this.qualification = qualification;
        this.percentage = percentage;
        this.message = message;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getEmailAddress() { return emailAddress; }
    public void setEmailAddress(String emailAddress) { this.emailAddress = emailAddress; }

    public String getProgramChoice() { return programChoice; }
    public void setProgramChoice(String programChoice) { this.programChoice = programChoice; }

    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }

    public String getPercentage() { return percentage; }
    public void setPercentage(String percentage) { this.percentage = percentage; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
