package com.cbs.controller;

import com.cbs.util.DBConnection;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/api/enroll")
public class EnrollServlet extends HttpServlet {

    private Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        try {
            JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);

            String studentName = jsonObject.has("studentName") ? jsonObject.get("studentName").getAsString() : "";
            String phoneNumber = jsonObject.has("phoneNumber") ? jsonObject.get("phoneNumber").getAsString() : "";
            String emailAddress = jsonObject.has("emailAddress") ? jsonObject.get("emailAddress").getAsString() : "";
            String programChoice = jsonObject.has("programChoice") ? jsonObject.get("programChoice").getAsString() : "";
            String qualification = jsonObject.has("qualification") ? jsonObject.get("qualification").getAsString() : "";
            String percentage = jsonObject.has("percentage") ? jsonObject.get("percentage").getAsString() : "";
            String message = jsonObject.has("message") ? jsonObject.get("message").getAsString() : "";

            boolean success = saveEnrollmentToDatabase(studentName, phoneNumber, emailAddress, programChoice, qualification, percentage, message);

            JsonObject jsonResponse = new JsonObject();
            if (success) {
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

    private boolean saveEnrollmentToDatabase(String studentName, String phoneNumber, String emailAddress, String programChoice, String qualification, String percentage, String message) {
        String query = "INSERT INTO enrollments (student_name, phone_number, email_address, program_choice, qualification, percentage, message) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, studentName);
            pstmt.setString(2, phoneNumber);
            pstmt.setString(3, emailAddress);
            pstmt.setString(4, programChoice);
            pstmt.setString(5, qualification);
            pstmt.setString(6, percentage);
            pstmt.setString(7, message);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
