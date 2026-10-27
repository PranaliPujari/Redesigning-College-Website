package com.cbs.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Authentication Filter.
 * Protects all /admin/* URLs - redirects to login page if no valid session exists.
 */
@WebFilter("/admin/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Check for valid session
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            // No valid session - redirect to login
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Valid session - continue with the request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
