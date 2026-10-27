package com.cbs.util;

import com.cbs.model.Enrollment;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Utility class to handle email notifications.
 * Sends enrollment form details to the target administrator email.
 */
public class EmailUtility {

    // Configure your Gmail SMTP settings here
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    
    // IMPORTANT: Replace these with your email credentials (or use App Passwords)
    private static final String SENDER_EMAIL = "trustfunin@gmail.com"; 
    private static final String SENDER_PASSWORD = "your-app-password-here"; // Enter 16-character App Password here

    private static final String RECIPIENT_EMAIL = "trustfunin@gmail.com";

    /**
     * Sends the enrollment details asynchronously to the administrator.
     * @param enrollment the enrollment model object containing form details
     */
    public static void sendEnrollmentNotificationAsync(final Enrollment enrollment) {
        new Thread(() -> {
            try {
                sendEnrollmentNotification(enrollment);
            } catch (Exception e) {
                System.err.println("Failed to send enrollment notification email: " + e.getMessage());
                e.printStackTrace();
            }
        }).start();
    }

    /**
     * Synchronously sends the enrollment details email.
     * @param enrollment the enrollment model object containing form details
     * @throws MessagingException if email configuration or delivery fails
     */
    public static void sendEnrollmentNotification(Enrollment enrollment) throws MessagingException {
        // Check if sender credentials are set/changed from defaults
        if (SENDER_PASSWORD.equals("your-app-password-here")) {
            System.err.println("WARNING: Email notification not sent because SENDER_PASSWORD is not configured in EmailUtility.java.");
            return;
        }

        // Set up SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // Authenticate session
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        // Create MimeMessage
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(RECIPIENT_EMAIL));
        
        // Subject line
        String subject = "New Application / Enroll Now Submission: " + enrollment.getStudentName();
        message.setSubject(subject);

        // HTML Email content
        String emailBody = "<html><body>"
                + "<h2>New Enrollment Application Details</h2>"
                + "<table border='1' cellpadding='10' cellspacing='0' style='border-collapse: collapse; font-family: Arial, sans-serif;'>"
                + "  <tr style='background-color: #f2f2f2;'>"
                + "    <th>Field</th>"
                + "    <th>Submitted Detail</th>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Student Name</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getStudentName()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Phone Number</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getPhoneNumber()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Email Address</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getEmailAddress()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Program Choice</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getProgramChoice()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Highest Qualification</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getQualification()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Percentage / CGPA</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getPercentage()) + "</td>"
                + "  </tr>"
                + "  <tr>"
                + "    <td><strong>Message</strong></td>"
                + "    <td>" + escapeHtml(enrollment.getMessage()).replace("\n", "<br/>") + "</td>"
                + "  </tr>"
                + "</table>"
                + "<p style='color: #666; font-size: 12px; margin-top: 20px;'>This email was automatically generated by Chetan Business School Management System.</p>"
                + "</body></html>";

        message.setContent(emailBody, "text/html; charset=utf-8");

        // Send email
        Transport.send(message);
        System.out.println("Enrollment notification email successfully sent to " + RECIPIENT_EMAIL);
    }

    private static String escapeHtml(String input) {
        if (input == null) {
            return "";
        }
        return input.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
}
