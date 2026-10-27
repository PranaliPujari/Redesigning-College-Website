<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | Contact Us - Get in Touch</title>
        <!-- Google Fonts & Font Awesome -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,600;14..32,700;14..32,800&family=Poppins:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- AOS Animation Library -->
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link rel="stylesheet" href="css/enroll-modal.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', 'Inter', sans-serif;
                overflow-x: hidden;
                background: linear-gradient(135deg, #f0f8ff 0%, #ffffff 100%);
                color: #1e293b;
            }

            /* Animated Background */
            .animated-bg {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 0;
                overflow: hidden;
            }

            .animated-bg::before {
                content: '';
                position: absolute;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle at 20% 40%, rgba(14, 165, 233, 0.12) 0%, rgba(56, 189, 248, 0.05) 50%, transparent 80%);
                animation: bgMove 25s ease-in-out infinite;
            }

            @keyframes bgMove {

                0%,
                100% {
                    transform: translate(0, 0) rotate(0deg);
                }

                33% {
                    transform: translate(-5%, -5%) rotate(2deg);
                }

                66% {
                    transform: translate(5%, 3%) rotate(-1deg);
                }
            }

            .floating-shapes {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            .floating-shapes div {
                position: absolute;
                background: rgba(14, 165, 233, 0.08);
                border-radius: 50%;
                animation: floatShape 18s infinite ease-in-out;
            }

            .shape1 {
                width: 350px;
                height: 350px;
                top: -100px;
                left: -100px;
                animation-delay: 0s;
            }

            .shape2 {
                width: 450px;
                height: 450px;
                bottom: -150px;
                right: -100px;
                animation-delay: -4s;
                animation-duration: 22s;
            }

            .shape3 {
                width: 200px;
                height: 200px;
                top: 40%;
                left: 75%;
                animation-delay: -7s;
            }

            .shape4 {
                width: 150px;
                height: 150px;
                bottom: 15%;
                left: 5%;
                animation-delay: -2s;
            }

            .shape5 {
                width: 280px;
                height: 280px;
                top: 65%;
                left: 35%;
                animation-delay: -10s;
            }

            @keyframes floatShape {

                0%,
                100% {
                    transform: translateY(0) rotate(0deg) scale(1);
                }

                50% {
                    transform: translateY(-40px) rotate(10deg) scale(1.05);
                }
            }

            /* Navbar */
            .navbar {
                position: relative;
                z-index: 100;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1rem 5%;
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(20px);
                border-bottom: 1px solid rgba(14, 165, 233, 0.25);
                flex-wrap: wrap;
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.08);
                transition: all 0.3s ease;
            }

            .navbar.scrolled {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                padding: 0.7rem 5%;
            }

            .logo h2 {
                font-size: 1.8rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #0369a1, #1e40af);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .logo p {
                font-size: 0.7rem;
                letter-spacing: 1px;
                color: #475569;
                font-weight: 400;
            }

            .nav-links {
                display: flex;
                gap: 2rem;
                list-style: none;
            }

            .nav-links a {
                text-decoration: none;
                color: #334155;
                font-weight: 550;
                transition: 0.3s;
                font-size: 0.95rem;
                position: relative;
            }

            .nav-links a::after {
                content: '';
                position: absolute;
                bottom: -5px;
                left: 0;
                width: 0;
                height: 2px;
                background: linear-gradient(90deg, #0284c7, #38bdf8);
                transition: width 0.3s ease;
            }

            .nav-links a:hover::after,
            .nav-links a.active::after {
                width: 100%;
            }

            .nav-links a:hover,
            .nav-links a.active {
                color: #0284c7;
            }

            .enroll-btn {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                padding: 0.5rem 1.5rem;
                border-radius: 40px;
                font-weight: bold;
                color: white !important;
                box-shadow: 0 4px 15px rgba(2, 132, 199, 0.3);
                transition: all 0.3s ease;
            }

            .enroll-btn:hover {
                transform: translateY(-2px) scale(1.05);
                box-shadow: 0 8px 25px rgba(2, 132, 199, 0.45);
            }

            .enroll-btn::after {
                display: none;
            }

            /* Hero Section */
            .contact-hero {
                text-align: center;
                padding: 6rem 2rem 8rem;
                background: linear-gradient(135deg, rgba(224, 242, 254, 0.6) 0%, rgba(255, 255, 255, 0.3) 100%);
                border-bottom: 1px solid rgba(14, 165, 233, 0.2);
                position: relative;
                overflow: hidden;
            }

            .contact-hero h1 {
                font-size: 4rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0f172a, #0284c7, #0369a1);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
                animation: titleReveal 0.8s ease-out;
            }

            .contact-hero p {
                font-size: 1.3rem;
                max-width: 700px;
                margin: 0 auto;
                color: #334155;
                animation: fadeUp 0.8s ease-out 0.2s both;
            }

            @keyframes titleReveal {
                from {
                    opacity: 0;
                    transform: translateY(-50px) scale(0.9);
                }

                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Contact Section */
            .contact-section {
                padding: 4rem 5%;
                max-width: 1300px;
                margin: 0 auto;
            }

            .contact-wrapper {
                display: flex;
                flex-wrap: wrap;
                gap: 3rem;
            }

            /* Contact Info Cards */
            .contact-info-side {
                flex: 1;
                min-width: 280px;
            }

            .info-card {
                background: #ffffff;
                border-radius: 32px;
                padding: 2rem;
                margin-bottom: 2rem;
                border: 1px solid rgba(14, 165, 233, 0.2);
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .info-card:hover {
                transform: translateY(-5px);
                border-color: #0284c7;
                background: rgba(224, 242, 254, 0.35);
                box-shadow: 0 20px 35px rgba(14, 165, 233, 0.1);
            }

            .info-card i {
                font-size: 2.5rem;
                background: linear-gradient(135deg, #0284c7, #38bdf8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
            }

            .info-card h3 {
                font-size: 1.3rem;
                color: #0284c7;
                margin-bottom: 1rem;
            }

            .info-card p,
            .info-card a {
                color: #475569;
                line-height: 1.6;
                text-decoration: none;
                transition: 0.3s;
                display: block;
                margin-bottom: 0.3rem;
            }

            .info-card a:hover {
                color: #0284c7;
                transform: translateX(5px);
            }

            /* Contact Form */
            .contact-form-side {
                flex: 1.5;
                min-width: 320px;
                background: #ffffff;
                border-radius: 32px;
                padding: 2rem;
                border: 1px solid rgba(14, 165, 233, 0.2);
                transition: 0.3s;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .contact-form-side:hover {
                border-color: #0284c7;
                box-shadow: 0 20px 35px rgba(14, 165, 233, 0.1);
            }

            .contact-form-side h3 {
                font-size: 1.8rem;
                color: #0284c7;
                margin-bottom: 0.5rem;
            }

            .contact-form-side p {
                color: #475569;
                margin-bottom: 2rem;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 14px 18px;
                background: #ffffff;
                border: 1px solid rgba(14, 165, 233, 0.3);
                border-radius: 16px;
                color: #1e293b;
                font-size: 1rem;
                font-family: inherit;
                transition: 0.3s;
                outline: none;
            }

            .form-group input::placeholder,
            .form-group textarea::placeholder {
                color: #94a3b8;
            }

            .form-group input:focus,
            .form-group select:focus,
            .form-group textarea:focus {
                border-color: #0284c7;
                box-shadow: 0 0 10px rgba(2, 132, 199, 0.15);
            }

            .form-group textarea {
                resize: vertical;
                min-height: 120px;
            }

            .form-group select option {
                background: #ffffff;
                color: #1e293b;
            }

            .submit-btn {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                width: 100%;
                padding: 14px;
                border: none;
                border-radius: 50px;
                color: white;
                font-size: 1rem;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(2, 132, 199, 0.2);
            }

            .submit-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(2, 132, 199, 0.4);
            }

            /* Map Section */
            .map-section {
                padding: 2rem 5% 4rem;
                max-width: 1300px;
                margin: 0 auto;
            }

            .section-title {
                text-align: center;
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 2rem;
                background: linear-gradient(135deg, #0f172a, #0284c7);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                position: relative;
            }

            .section-title::after {
                content: '';
                position: absolute;
                bottom: -15px;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 3px;
                background: linear-gradient(90deg, #0284c7, #38bdf8);
                border-radius: 3px;
            }

            .map-container {
                background: #ffffff;
                border-radius: 32px;
                padding: 1rem;
                border: 1px solid rgba(14, 165, 233, 0.25);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .map-placeholder {
                background: linear-gradient(135deg, rgba(2, 132, 199, 0.1), rgba(56, 189, 248, 0.15));
                border-radius: 24px;
                height: 400px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
            }

            .map-placeholder i {
                font-size: 4rem;
                background: linear-gradient(135deg, #0284c7, #38bdf8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
            }

            .map-placeholder p {
                color: #475569;
                margin-bottom: 1rem;
            }

            .map-btn {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                padding: 0.6rem 1.5rem;
                border-radius: 30px;
                color: white;
                text-decoration: none;
                font-size: 0.9rem;
                transition: 0.3s;
                box-shadow: 0 4px 15px rgba(2, 132, 199, 0.2);
            }

            .map-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(2, 132, 199, 0.35);
            }

            /* FAQ Section */
            .faq-section {
                padding: 3rem 5% 5rem;
                max-width: 1000px;
                margin: 0 auto;
            }

            .faq-grid {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            .faq-item {
                background: #ffffff;
                border-radius: 20px;
                border: 1px solid rgba(14, 165, 233, 0.2);
                overflow: hidden;
                transition: 0.3s;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .faq-item:hover {
                border-color: #0284c7;
                box-shadow: 0 8px 20px rgba(14, 165, 233, 0.08);
            }

            .faq-question {
                padding: 1.2rem 1.5rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                cursor: pointer;
                font-weight: 600;
                color: #0284c7;
            }

            .faq-question i {
                transition: 0.3s;
            }

            .faq-answer {
                padding: 0 1.5rem 1.2rem;
                color: #475569;
                line-height: 1.6;
                display: none;
            }

            .faq-item.active .faq-answer {
                display: block;
            }

            .faq-item.active .faq-question i {
                transform: rotate(180deg);
            }

            /* Contact Strip */
            .contact-strip {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                background: #ffffff;
                padding: 1.2rem 5%;
                gap: 1.5rem;
                border-top: 1px solid rgba(14, 165, 233, 0.2);
                border-bottom: 1px solid rgba(14, 165, 233, 0.2);
                position: relative;
                z-index: 10;
            }

            .contact-info span,
            .contact-info a {
                color: #475569;
                margin-right: 1.5rem;
                font-size: 0.85rem;
                text-decoration: none;
                transition: 0.3s;
            }

            .contact-info span:hover,
            .contact-info a:hover {
                color: #0284c7;
            }

            .contact-info i {
                margin-right: 6px;
                color: #0284c7;
            }

            /* Footer */
            .premium-footer {
                background: #ffffff;
                border-top: 2px solid rgba(14, 165, 233, 0.3);
                position: relative;
                overflow: hidden;
            }

            .footer-waves {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                overflow: hidden;
                line-height: 0;
                transform: rotate(180deg);
                opacity: 0.15;
            }

            .footer-waves svg {
                position: relative;
                display: block;
                width: calc(100% + 1.3px);
                height: 60px;
            }

            .footer-container {
                max-width: 1300px;
                margin: 0 auto;
                padding: 3rem 5% 2rem;
                position: relative;
                z-index: 2;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                gap: 2.5rem;
            }

            .footer-brand {
                flex: 1.2;
                min-width: 220px;
            }

            .footer-brand h3 {
                font-size: 1.9rem;
                background: linear-gradient(135deg, #0f172a, #0284c7);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .social-icons {
                display: flex;
                gap: 1rem;
                margin-top: 1.5rem;
            }

            .social-icons a {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background: rgba(2, 132, 199, 0.08);
                border-radius: 50%;
                color: #0284c7;
                font-size: 1.2rem;
                transition: all 0.3s ease;
                border: 1px solid rgba(2, 132, 199, 0.2);
                text-decoration: none;
            }

            .social-icons a:hover {
                background: #0284c7;
                color: white;
                transform: translateY(-5px) rotate(360deg);
            }

            .footer-links {
                flex: 1;
                min-width: 150px;
            }

            .footer-links h4 {
                color: #0284c7;
                font-size: 1.2rem;
                margin-bottom: 1.2rem;
                position: relative;
            }

            .footer-links h4:after {
                content: '';
                position: absolute;
                bottom: -6px;
                left: 0;
                width: 40px;
                height: 2px;
                background: linear-gradient(90deg, #0284c7, transparent);
            }

            .footer-links ul {
                list-style: none;
            }

            .footer-links li {
                margin-bottom: 0.7rem;
            }

            .footer-links a {
                color: #475569;
                text-decoration: none;
                font-size: 0.9rem;
                transition: 0.3s;
                display: inline-flex;
                align-items: center;
                gap: 6px;
            }

            .footer-links a:hover {
                color: #0284c7;
                transform: translateX(8px);
            }

            .footer-newsletter {
                flex: 1.2;
                min-width: 240px;
            }

            .footer-newsletter h4 {
                color: #0284c7;
                font-size: 1.2rem;
                margin-bottom: 1rem;
            }

            .newsletter-form {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
            }

            .newsletter-form input {
                flex: 1;
                padding: 12px 15px;
                border-radius: 50px;
                background: #ffffff;
                color: #1e293b;
                font-size: 0.85rem;
                outline: none;
                border: 1px solid rgba(2, 132, 199, 0.25);
            }

            .newsletter-form button {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                border: none;
                padding: 0 1.5rem;
                border-radius: 50px;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s;
            }

            .footer-bottom {
                text-align: center;
                padding: 1.5rem;
                border-top: 1px solid rgba(2, 132, 199, 0.15);
                font-size: 0.8rem;
                background: rgba(224, 242, 254, 0.3);
                color: #475569;
            }

            @media (max-width: 900px) {
                .navbar {
                    flex-direction: column;
                    gap: 0.8rem;
                }

                .nav-links {
                    flex-wrap: wrap;
                    justify-content: center;
                    gap: 1rem;
                }

                .contact-hero h1 {
                    font-size: 2.2rem;
                }

                .contact-wrapper {
                    flex-direction: column;
                }

                .contact-strip {
                    flex-direction: column;
                    text-align: center;
                }

                .footer-container {
                    flex-direction: column;
                    gap: 2rem;
                }

                .map-placeholder {
                    height: 300px;
                }
            }

            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-track {
                background: #f0f8ff;
            }

            ::-webkit-scrollbar-thumb {
                background: #0284c7;
                border-radius: 10px;
            }

            .success-message {
                background: rgba(76, 175, 80, 0.2);
                border: 1px solid #4CAF50;
                padding: 1rem;
                border-radius: 12px;
                margin-top: 1rem;
                text-align: center;
                color: #4CAF50;
            }
        </style>
    </head>

    <body>

        <div class="animated-bg">
            <div class="floating-shapes">
                <div class="shape1"></div>
                <div class="shape2"></div>
                <div class="shape3"></div>
                <div class="shape4"></div>
                <div class="shape5"></div>
            </div>
        </div>

        <div class="main-content">
            <nav class="navbar" id="navbar">
                <div class="logo">
                    <img src="images/cbs-logo.webp" alt="CBS Logo" style="height: 90px; margin-top: 5px;">
                </div>
                <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="programs.jsp">Programs</a></li>
                    <li><a href="activities.jsp">Activities</a></li>
                    <li><a href="placement.jsp">Placements</a></li>
                    <li><a href="blog.jsp">Blogs</a></li>
                    <li><a href="contact.jsp" class="active">Contact Us</a></li>
                    <li><a href="#" class="enroll-btn">ENROLL NOW <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

            <div class="contact-hero">
                <h1>Get in Touch</h1>
                <p>Have questions? We're here to help. Reach out to us anytime</p>
            </div>

            <div class="contact-section" data-aos="fade-up">
                <div class="contact-wrapper">
                    <!-- Contact Information -->
                    <div class="contact-info-side">
                        <div class="info-card" data-aos="fade-right" data-aos-delay="100">
                            <i class="fas fa-map-marker-alt"></i>
                            <h3>Visit Us</h3>
                            <p>100ft Road, Tajanagar Srinagar</p>
                            <p>Near President Hotel</p>
                            <p>Hubballi, Karnataka - 580031</p>
                        </div>
                        <div class="info-card" data-aos="fade-right" data-aos-delay="200">
                            <i class="fas fa-phone-alt"></i>
                            <h3>Call Us</h3>
                            <a href="tel:+917337879532">+91 733-787-9532</a>
                            <a href="tel:+918366789012">+91 836-678-9012</a>
                        </div>
                        <div class="info-card" data-aos="fade-right" data-aos-delay="300">
                            <i class="fas fa-envelope"></i>
                            <h3>Email Us</h3>
                            <a href="mailto:info@chetanschool.org">info@chetanschool.org</a>
                            <a href="mailto:admissions@chetanschool.org">admissions@chetanschool.org</a>
                        </div>
                        <div class="info-card" data-aos="fade-right" data-aos-delay="400">
                            <i class="fas fa-clock"></i>
                            <h3>Office Hours</h3>
                            <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                            <p>Saturday: 10:00 AM - 2:00 PM</p>
                            <p>Sunday: Closed</p>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="contact-form-side" data-aos="fade-left" data-aos-delay="100">
                        <h3>Send us a Message</h3>
                        <p>We'll get back to you within 24 hours</p>
                        <form id="contactForm">
                            <div class="form-group">
                                <input type="text" id="fullName" placeholder="Your Full Name" required>
                            </div>
                            <div class="form-group">
                                <input type="email" id="email" placeholder="Email Address" required>
                            </div>
                            <div class="form-group">
                                <input type="tel" id="phone" placeholder="Phone Number">
                            </div>
                            <div class="form-group">
                                <select id="program">
                                    <option value="">Select Program</option>
                                    <option value="MCA">Master of Computer Applications (MCA)</option>
                                    <option value="MBA">Master of Business Administration (MBA)</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea id="message" placeholder="Your Message..."></textarea>
                            </div>
                            <button type="submit" class="submit-btn"><i class="fas fa-paper-plane"></i> Send
                                Message</button>
                            <div id="formStatus"></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Map Section -->
            <div class="map-section" data-aos="fade-up">
                <h2 class="section-title">Find Us Here</h2>
                <div class="map-container">
                    <div class="map-placeholder">
                        <i class="fas fa-map-marked-alt"></i>
                        <p><strong> CBS Campus, Hubballi</strong></p>
                        <p>100ft Road, Tajanagar Srinagar, Near President Hotel<br>Hubballi, Karnataka 580031</p>
                        <a href="https://maps.google.com/?q=Hubballi+Karnataka+India" target="_blank" class="map-btn"><i
                                class="fas fa-directions"></i> Get Directions</a>
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="faq-section" data-aos="fade-up">
                <h2 class="section-title">Frequently Asked Questions</h2>
                <div class="faq-grid">
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>What are the admission criteria for MCA program?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            Candidates must have a bachelor's degree with minimum 50% marks (45% for reserved
                            categories) from a recognized university. Mathematics at 10+2 or graduation level is
                            mandatory.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>Is the college AICTE approved?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            Yes, Chetan Business School is approved by AICTE and affiliated to Karnataka University,
                            Dharwad. All our programs are recognized by the Government of Karnataka.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>What is the placement record of CBS?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            We have a strong placement record with 100% placement assistance. Top recruiters include
                            Google, Microsoft, Amazon, Infosys, TCS, Deloitte, and Accenture. Highest package reached
                            12 LPA for MCA batch 2024.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>Does the college provide hostel facilities?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            Yes, we have separate hostel facilities for boys and girls with modern amenities, 24/7
                            security, and nutritious meals. Hostel accommodation is available on a first-come,
                            first-served basis.
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>How can I apply for admission?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            You can apply online through our website by clicking the "ENROLL NOW" button. You can also
                            visit the campus admission office or download the application form from our website.
                        </div>
                    </div>
                </div>
            </div>

            <footer class="premium-footer">
                <div class="footer-waves">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
                        <path fill="#6366f1" fill-opacity="0.25"
                            d="M0,192L48,197.3C96,203,192,213,288,208C384,203,480,181,576,176C672,171,768,181,864,197.3C960,213,1056,235,1152,224C1248,213,1344,171,1392,149.3L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
                        </path>
                        <path fill="#06b6d4" fill-opacity="0.15"
                            d="M0,256L48,240C96,224,192,192,288,186.7C384,181,480,203,576,224C672,245,768,267,864,256C960,245,1056,203,1152,192C1248,181,1344,203,1392,213.3L1440,224L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
                        </path>
                    </svg>
                </div>
                <div class="footer-container">
                    <div class="footer-brand">
                        <h3><i class="fas fa-graduation-cap"></i> Chetan Business School</h3>
                        <p>Institute of Management, IT & Research<br>Approved by AICTE | Affiliated to Karnataka
                            University, Dharwad</p>
                        <div class="social-icons">
                            <a href="https://www.facebook.com/ChetanMbaHubli/"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://x.com/chetanbschool"><i class="fab fa-twitter"></i></a>
                            <a href="https://www.instagram.com/chetanbschoolhubballi_/"><i
                                    class="fab fa-instagram"></i></a>
                            <a href="https://in.linkedin.com/in/chetan-b-school-hubballi-90763066?trk=public_post-text"><i
                                    class="fab fa-linkedin-in"></i></a>
                            <a href="https://www.youtube.com/channel/UCoFPO76-Rx3CymbkblJlGGQ/search"><i
                                    class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                    <div class="footer-links">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="index.jsp"><i class="fas fa-chevron-right"></i> Home</a></li>
                            <li><a href="about.jsp""><i class=" fas fa-chevron-right"></i> About CBS</a></li>
                            <li><a href="programs.jsp"><i class="fas fa-chevron-right"></i> MCA Program</a></li>
                            <li><a href="placement.jsp"><i class="fas fa-chevron-right"></i> Placements</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Photo Gallery</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h4>Programs</h4>
                        <ul>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Master of Computer Applications</a>
                            </li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Master of Business Administration</a>
                            </li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Research Programs</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Certifications</a></li>
                        </ul>
                    </div>
                    <div class="footer-newsletter">
                        <h4>Stay Updated</h4>
                        <!-- <p style="font-size:0.8rem; margin-bottom:1rem; color:#cffafe;">Subscribe for newsletter</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Your email address">
                            <button><i class="fas fa-paper-plane"></i> Subscribe</button>
                        </div> -->
                        <div style="margin-top: 1.5rem;">
                            <p style="font-size:0.8rem;"><i class="fas fa-map-marker-alt"></i> 100ft Road, Tajnagar,
                                Hubballi, Karnataka 580031</p>
                            <p style="font-size:0.8rem; margin-top:6px;"><i class="fas fa-envelope"></i>
                                info@chetanschool.org | <i class="fas fa-phone-alt"></i> +91 733-787-9532</p>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>Â© 2025 Chetan Business School - All Rights Reserved. | Designed with <i class="fas fa-heart"
                            style="color:#06b6d4;"></i> for future innovators</p>
                </div>
            </footer>
        </div>

        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init({
                duration: 800,
                once: true,
                offset: 100
            });

            // Navbar scroll effect
            window.addEventListener('scroll', function () {
                const navbar = document.getElementById('navbar');
                if (window.scrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
                }
            });

            // FAQ Accordion
            document.querySelectorAll('.faq-item').forEach(item => {
                const question = item.querySelector('.faq-question');
                question.addEventListener('click', () => {
                    item.classList.toggle('active');
                });
            });

            // Contact Form Submission
            document.getElementById('contactForm').addEventListener('submit', function (e) {
                e.preventDefault();

                const submitBtn = this.querySelector('.submit-btn');
                const originalText = submitBtn.innerHTML;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
                submitBtn.disabled = true;

                const formData = {
                    fullName: document.getElementById('fullName').value,
                    email: document.getElementById('email').value,
                    phone: document.getElementById('phone').value,
                    program: document.getElementById('program').value,
                    message: document.getElementById('message').value
                };

                // Using relative path
                let apiUrl = 'api/contact';
                if (window.location.pathname.includes('/admin/')) {
                    apiUrl = '../api/contact';
                }
                fetch(apiUrl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(formData)
                })
                    .then(response => response.json())
                    .then(data => {
                        const statusDiv = document.getElementById('formStatus');
                        if (data.status === 'success') {
                            statusDiv.innerHTML = `<div class="success-message">${data.message}</div>`;
                            this.reset();
                        } else {
                            statusDiv.innerHTML = `<div class="success-message" style="color: #ff6b6b; border-color: #ff6b6b; background: rgba(255,107,107,0.1);">${data.message}</div>`;
                        }
                    })
                    .catch(error => {
                        const statusDiv = document.getElementById('formStatus');
                        statusDiv.innerHTML = `<div class="success-message" style="color: #ff6b6b; border-color: #ff6b6b; background: rgba(255,107,107,0.1);">Error connecting to server. Please try again later.</div>`;
                        console.error('Error:', error);
                    })
                    .finally(() => {
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;
                    });
            });
        </script>
        <script src="js/enroll-modal.js"></script>

        <link rel="stylesheet" href="css/chatbot.css">
        <script src="js/chatbot.js"></script>
    </body>

    </html>