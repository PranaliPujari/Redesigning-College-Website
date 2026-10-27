package com.cbs.controller;

import com.cbs.dao.EnrollmentDAO;
import com.cbs.model.Enrollment;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

/**
 * Servlet to handle Enrollment form submissions.
 * Receives JSON data via POST and stores it in the database using EnrollmentDAO.
 * URL Pattern: /api/enroll
 */
@WebServlet("/api/enroll")
public class EnrollServlet extends HttpServlet {

    private Gson gson = new Gson();
    private EnrollmentDAO enrollmentDAO = new EnrollmentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Read JSON request body
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        try {
            JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);

            // Create Enrollment model object
            Enrollment enrollment = new Enrollment();
            enrollment.setStudentName(jsonObject.has("studentName") ? jsonObject.get("studentName").getAsString() : "");
            enrollment.setPhoneNumber(jsonObject.has("phoneNumber") ? jsonObject.get("phoneNumber").getAsString() : "");
            enrollment.setEmailAddress(jsonObject.has("emailAddress") ? jsonObject.get("emailAddress").getAsString() : "");
            enrollment.setProgramChoice(jsonObject.has("programChoice") ? jsonObject.get("programChoice").getAsString() : "");
            enrollment.setQualification(jsonObject.has("qualification") ? jsonObject.get("qualification").getAsString() : "");
            enrollment.setPercentage(jsonObject.has("percentage") ? jsonObject.get("percentage").getAsString() : "");
            enrollment.setMessage(jsonObject.has("message") ? jsonObject.get("message").getAsString() : "");

            // Save using DAO layer
            boolean success = enrollmentDAO.addEnrollment(enrollment);

            JsonObject jsonResponse = new JsonObject();
            if (success) {
                // Send email notification asynchronously
                com.cbs.util.EmailUtility.sendEnrollmentNotificationAsync(enrollment);

                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("message", "Enrollment application received successfully.");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Failed to save enrollment application.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
            response.getWriter().write(gson.toJson(jsonResponse));

        } catch (Exception e) {
            e.printStackTrace();
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Invalid request data.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(jsonResponse));
        }
    }
}
