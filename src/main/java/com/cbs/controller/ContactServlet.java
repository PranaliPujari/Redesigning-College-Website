package com.cbs.controller;

import com.cbs.dao.ContactDAO;
import com.cbs.model.ContactQuery;
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
 * Servlet to handle Contact form submissions.
 * Receives JSON data via POST and stores it in the database using ContactDAO.
 * URL Pattern: /api/contact
 */
@WebServlet("/api/contact")
public class ContactServlet extends HttpServlet {

    private Gson gson = new Gson();
    private ContactDAO contactDAO = new ContactDAO();

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

            // Create ContactQuery model object
            ContactQuery contact = new ContactQuery();
            contact.setFullName(jsonObject.has("fullName") ? jsonObject.get("fullName").getAsString() : "");
            contact.setEmail(jsonObject.has("email") ? jsonObject.get("email").getAsString() : "");
            contact.setPhone(jsonObject.has("phone") ? jsonObject.get("phone").getAsString() : "");
            contact.setProgram(jsonObject.has("program") ? jsonObject.get("program").getAsString() : "");
            contact.setMessage(jsonObject.has("message") ? jsonObject.get("message").getAsString() : "");

            // Save using DAO layer
            boolean success = contactDAO.addContactQuery(contact);

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
}
