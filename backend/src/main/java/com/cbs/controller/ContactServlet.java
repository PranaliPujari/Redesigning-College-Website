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

@WebServlet("/api/contact")
public class ContactServlet extends HttpServlet {

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

            String fullName = jsonObject.has("fullName") ? jsonObject.get("fullName").getAsString() : "";
            String email = jsonObject.has("email") ? jsonObject.get("email").getAsString() : "";
            String phone = jsonObject.has("phone") ? jsonObject.get("phone").getAsString() : "";
            String program = jsonObject.has("program") ? jsonObject.get("program").getAsString() : "";
            String message = jsonObject.has("message") ? jsonObject.get("message").getAsString() : "";

            boolean success = saveContactToDatabase(fullName, email, phone, program, message);

            JsonObject jsonResponse = new JsonObject();
            if (success) {
                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("message", "Contact query received successfully.");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Failed to save contact query.");
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

    private boolean saveContactToDatabase(String fullName, String email, String phone, String program, String message) {
        String query = "INSERT INTO contact_queries (full_name, email, phone, program, message) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, program);
            pstmt.setString(5, message);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
