<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Chetan Business School</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f2fe 0%, #f0f8ff 50%, #ffffff 100%);
            color: #1e293b;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }
        body::before {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(14, 165, 233, 0.15), transparent 70%);
            top: -50px;
            right: -50px;
            border-radius: 50%;
            animation: pulse 8s ease-in-out infinite;
        }
        body::after {
            content: '';
            position: absolute;
            width: 250px;
            height: 250px;
            background: radial-gradient(circle, rgba(2, 132, 199, 0.12), transparent 70%);
            bottom: -40px;
            left: -40px;
            border-radius: 50%;
            animation: pulse 10s ease-in-out infinite reverse;
        }
        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.6; }
            50% { transform: scale(1.2); opacity: 1; }
        }
        .auth-card {
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(14, 165, 233, 0.2);
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(14, 165, 233, 0.1), 0 8px 30px rgba(0,0,0,0.05);
            padding: 2.5rem;
            width: 100%;
            max-width: 450px;
            position: relative;
            z-index: 1;
        }
        .auth-card h2 {
            color: #0284c7;
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            text-align: center;
        }
        .auth-card p {
            color: #64748b;
            font-size: 0.9rem;
            margin-bottom: 2rem;
            text-align: center;
        }
        .form-group {
            margin-bottom: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 0.4rem;
        }
        label {
            color: #334155;
            font-size: 0.84rem;
            font-weight: 600;
        }
        input {
            width: 100%;
            border: 1.5px solid rgba(14, 165, 233, 0.25);
            border-radius: 14px;
            background: rgba(240, 248, 255, 0.6);
            color: #1e293b;
            font-family: inherit;
            font-size: 0.95rem;
            padding: 0.8rem 0.95rem;
            outline: none;
            transition: all 0.3s ease;
        }
        input:focus {
            border-color: #0284c7;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.15);
            background: white;
        }
        .submit-btn {
            width: 100%;
            border: none;
            border-radius: 50px;
            padding: 0.9rem;
            background: linear-gradient(135deg, #0284c7, #0ea5e9);
            color: white;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 8px 24px rgba(14, 165, 233, 0.25);
            margin-top: 1rem;
            transition: all 0.3s ease;
            font-size: 1rem;
        }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(14, 165, 233, 0.35);
            background: linear-gradient(135deg, #0369a1, #0284c7);
        }
        .alert {
            padding: 10px;
            border-radius: 12px;
            margin-bottom: 15px;
            font-size: 0.9rem;
            text-align: center;
        }
        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #dc2626;
        }
        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #059669;
        }
        .links {
            margin-top: 1.5rem;
            text-align: center;
            font-size: 0.85rem;
        }
        .links a {
            color: #0284c7;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .links a:hover {
            color: #0369a1;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="auth-card">
        <h2><i class="fas fa-lock"></i> Admin Login</h2>
        <p>Sign in to access the CBS Dashboard</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("success") %></div>
        <% } %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" value="${username}" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="submit-btn">Login <i class="fas fa-sign-in-alt"></i></button>
        </form>
        
        <div class="links">
            <a href="index.jsp"><i class="fas fa-arrow-left"></i> Back to Home</a>
        </div>
    </div>

    <link rel="stylesheet" href="css/chatbot.css">
    <script src="js/chatbot.js"></script>
</body>
</html>
