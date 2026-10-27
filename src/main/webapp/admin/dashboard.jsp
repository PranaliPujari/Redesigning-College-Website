<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Chetan Business School</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f2fe 0%, #f0f8ff 50%, #ffffff 100%);
            color: #1e293b;
            min-height: 100vh;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(14, 165, 233, 0.15);
            box-shadow: 0 4px 20px rgba(14, 165, 233, 0.08);
        }
        .logo h2 {
            font-size: 1.5rem;
            background: linear-gradient(135deg, #0284c7, #0ea5e9, #38bdf8);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        .nav-links {
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }
        .user-greeting {
            color: #0284c7;
            font-weight: 600;
        }
        .logout-btn {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #dc2626;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            text-decoration: none;
            transition: 0.3s;
            font-weight: 600;
            font-size: 0.9rem;
        }
        .logout-btn:hover {
            background: #dc2626;
            color: white;
        }
        
        .dashboard-container {
            padding: 2rem 5%;
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        .stat-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid rgba(14, 165, 233, 0.15);
            display: flex;
            align-items: center;
            gap: 1.5rem;
            box-shadow: 0 4px 20px rgba(14, 165, 233, 0.06);
            transition: all 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(14, 165, 233, 0.12);
        }
        .stat-icon {
            font-size: 2.5rem;
            color: #0284c7;
        }
        .stat-info h3 {
            font-size: 2rem;
            color: #0f172a;
            margin-bottom: 0.2rem;
        }
        .stat-info p {
            color: #64748b;
            font-size: 0.9rem;
        }
        
        .alert {
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 20px;
            background: rgba(16, 185, 129, 0.1);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #059669;
        }
        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #dc2626;
        }

        .tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        .tab-btn {
            background: white;
            border: 1.5px solid rgba(14, 165, 233, 0.25);
            color: #334155;
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }
        .tab-btn.active, .tab-btn:hover {
            background: linear-gradient(135deg, #0284c7, #0ea5e9);
            border-color: transparent;
            color: white;
            box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);
        }

        .tab-content {
            display: none;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid rgba(14, 165, 233, 0.12);
            overflow-x: auto;
            box-shadow: 0 4px 20px rgba(14, 165, 233, 0.06);
        }
        .tab-content.active {
            display: block;
            animation: fadeIn 0.4s;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(14, 165, 233, 0.1);
        }
        th {
            color: #0284c7;
            font-weight: 600;
            font-size: 0.95rem;
        }
        td {
            color: #334155;
            font-size: 0.9rem;
        }
        .delete-btn {
            background: rgba(239, 68, 68, 0.08);
            color: #dc2626;
            border: 1px solid rgba(239, 68, 68, 0.3);
            padding: 5px 10px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }
        .delete-btn:hover {
            background: #dc2626;
            color: white;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    
    <nav class="navbar">
        <div class="logo">
            <img src="../images/cbs-logo.webp" alt="CBS Logo" style="height: 90px; margin-top: 5px;">
        </div>
        <div class="nav-links">
            <span class="user-greeting"><i class="fas fa-user-circle"></i> Welcome, ${sessionScope.fullName}</span>
            <a href="../logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
            <a href="../index.jsp" style="color:#0284c7; text-decoration:none; font-weight:500;"><i class="fas fa-external-link-alt"></i> View Site</a>
        </div>
    </nav>

    <div class="dashboard-container">
        
        <% if (session.getAttribute("message") != null) { %>
            <div class="alert"><%= session.getAttribute("message") %></div>
            <% session.removeAttribute("message"); %>
        <% } %>
        <% if (session.getAttribute("error") != null) { %>
            <div class="alert alert-error"><%= session.getAttribute("error") %></div>
            <% session.removeAttribute("error"); %>
        <% } %>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-user-graduate"></i></div>
                <div class="stat-info">
                    <h3>${enrollmentCount}</h3>
                    <p>Total Enrollments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-envelope-open-text"></i></div>
                <div class="stat-info">
                    <h3>${contactCount}</h3>
                    <p>Contact Queries</p>
                </div>
            </div>
        </div>

        <div class="tabs">
            <button class="tab-btn active" onclick="openTab('enrollments')"><i class="fas fa-user-graduate"></i> Enrollments</button>
            <button class="tab-btn" onclick="openTab('contacts')"><i class="fas fa-envelope"></i> Contact Queries</button>
        </div>

        <!-- Enrollments Tab -->
        <div id="enrollments" class="tab-content active">
            <h3 style="margin-bottom: 1rem; color: #0f172a;">Recent Enrollment Applications</h3>
            <c:if test="${empty enrollments}">
                <p style="color: #94a3b8; text-align: center; padding: 2rem;">No enrollment applications found.</p>
            </c:if>
            <c:if test="${not empty enrollments}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Student Name</th>
                            <th>Contact</th>
                            <th>Program</th>
                            <th>Qualification</th>
                            <th>Score</th>
                            <th>Message</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="enrollment" items="${enrollments}">
                            <tr>
                                <td>#${enrollment.id}</td>
                                <td>${enrollment.createdAt}</td>
                                <td><strong>${enrollment.studentName}</strong></td>
                                <td>${enrollment.phoneNumber}<br>${enrollment.emailAddress}</td>
                                <td><span style="background: rgba(14,165,233,0.12); padding: 3px 8px; border-radius: 12px; color: #0284c7; font-size: 0.8rem;">${enrollment.programChoice}</span></td>
                                <td>${enrollment.qualification}</td>
                                <td>${enrollment.percentage}</td>
                                <td><div style="max-width:200px; max-height: 60px; overflow-y:auto; font-size:0.8rem;">${enrollment.message}</div></td>
                                <td>
                                    <form action="dashboard" method="post" onsubmit="return confirm('Are you sure you want to delete this enrollment record?');">
                                        <input type="hidden" name="action" value="deleteEnrollment">
                                        <input type="hidden" name="id" value="${enrollment.id}">
                                        <button type="submit" class="delete-btn" title="Delete"><i class="fas fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>

        <!-- Contacts Tab -->
        <div id="contacts" class="tab-content">
            <h3 style="margin-bottom: 1rem; color: #0f172a;">Contact Form Queries</h3>
            <c:if test="${empty contactQueries}">
                <p style="color: #94a3b8; text-align: center; padding: 2rem;">No contact queries found.</p>
            </c:if>
            <c:if test="${not empty contactQueries}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Program</th>
                            <th>Message</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contact" items="${contactQueries}">
                            <tr>
                                <td>#${contact.id}</td>
                                <td>${contact.createdAt}</td>
                                <td><strong>${contact.fullName}</strong></td>
                                <td>${contact.email}</td>
                                <td>${contact.phone}</td>
                                <td>${contact.program}</td>
                                <td><div style="max-width:300px; max-height: 80px; overflow-y:auto; font-size:0.85rem; background: rgba(14,165,233,0.06); padding: 8px; border-radius: 8px;">${contact.message}</div></td>
                                <td>
                                    <form action="dashboard" method="post" onsubmit="return confirm('Are you sure you want to delete this query?');">
                                        <input type="hidden" name="action" value="deleteContact">
                                        <input type="hidden" name="id" value="${contact.id}">
                                        <button type="submit" class="delete-btn" title="Delete"><i class="fas fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>

    </div>

    <script>
        function openTab(tabName) {
            // Hide all tab content
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            // Remove active class from buttons
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            
            // Show the selected tab content and activate button
            document.getElementById(tabName).classList.add('active');
            event.currentTarget.classList.add('active');
        }
    </script>

    <link rel="stylesheet" href="../css/chatbot.css">
    <script src="../js/chatbot.js"></script>
</body>
</html>
