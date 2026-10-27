package com.cbs.controller;

import com.cbs.dao.UserDAO;
import com.cbs.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet to handle Admin Login.
 * GET  /login → displays the login page (login.jsp)
 * POST /login → authenticates user and creates session
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // If already logged in, redirect to dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        // Forward to login.jsp
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate input
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Please enter both username and password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try {
            // Authenticate using DAO
            User user = userDAO.loginUser(username.trim(), password.trim());

            if (user != null) {
                // Create session and store user info
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("fullName", user.getFullName());
                session.setMaxInactiveInterval(30 * 60); // 30 minutes

                // Redirect to admin dashboard
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                // Authentication failed
                request.setAttribute("error", "Invalid username or password. Please try again.");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Database connection error. Please contact the administrator.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
