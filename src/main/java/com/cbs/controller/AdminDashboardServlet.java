package com.cbs.controller;

import com.cbs.dao.EnrollmentDAO;
import com.cbs.dao.ContactDAO;
import com.cbs.model.Enrollment;
import com.cbs.model.ContactQuery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet for Admin Dashboard.
 * GET  /admin/dashboard → displays all enrollments and contact queries
 * POST /admin/dashboard → handles delete operations
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private EnrollmentDAO enrollmentDAO = new EnrollmentDAO();
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Fetch all data for dashboard
            List<Enrollment> enrollments = enrollmentDAO.getAllEnrollments();
            List<ContactQuery> contactQueries = contactDAO.getAllContactQueries();
            int enrollmentCount = enrollmentDAO.getEnrollmentCount();
            int contactCount = contactDAO.getContactQueryCount();

            // Set attributes for JSP
            request.setAttribute("enrollments", enrollments);
            request.setAttribute("contactQueries", contactQueries);
            request.setAttribute("enrollmentCount", enrollmentCount);
            request.setAttribute("contactCount", contactCount);
        } catch (Exception e) {
            request.setAttribute("error", "Database connection failed: " + e.getMessage());
        }

        // Forward to dashboard JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if (action != null && idStr != null) {
            try {
                int id = Integer.parseInt(idStr);

                switch (action) {
                    case "deleteEnrollment":
                        enrollmentDAO.deleteEnrollment(id);
                        request.getSession().setAttribute("message", "Enrollment record deleted successfully.");
                        break;
                    case "deleteContact":
                        contactDAO.deleteContactQuery(id);
                        request.getSession().setAttribute("message", "Contact query deleted successfully.");
                        break;
                    default:
                        request.getSession().setAttribute("error", "Invalid action.");
                        break;
                }
            } catch (NumberFormatException e) {
                request.getSession().setAttribute("error", "Invalid ID format.");
            }
        }

        // Redirect back to dashboard (PRG pattern)
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
