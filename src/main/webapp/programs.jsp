<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | Programs - MCA & MBA Excellence</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,600;14..32,700;14..32,800&family=Poppins:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

            .floating-shapes div {
                position: absolute;
                border-radius: 50%;
                background: rgba(14, 165, 233, 0.08);
                animation: floatShape 18s infinite ease-in-out;
            }

            .shape1 {
                width: 350px;
                height: 350px;
                top: -100px;
                left: -100px;
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
                animation-duration: 14s;
            }

            .shape5 {
                width: 280px;
                height: 280px;
                top: 65%;
                left: 35%;
                animation-delay: -10s;
                animation-duration: 20s;
            }

            @keyframes floatShape {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                    opacity: 0.5;
                }

                50% {
                    transform: translate(40px, -30px) scale(1.1);
                    opacity: 0.8;
                }
            }

            .main-content {
                position: relative;
                z-index: 1;
            }

            /* NAVBAR */
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1rem 5%;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(20px);
                border-bottom: 1px solid rgba(14, 165, 233, 0.15);
                box-shadow: 0 2px 20px rgba(14, 165, 233, 0.08);
            }

            .navbar.scrolled {
                background: rgba(255, 255, 255, 0.95);
                box-shadow: 0 4px 30px rgba(14, 165, 233, 0.12);
            }

            .logo h2 {
                font-size: 1.5rem;
                background: linear-gradient(135deg, #0284c7, #0ea5e9, #38bdf8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .logo p {
                font-size: 0.7rem;
                color: #64748b;
                letter-spacing: 1px;
            }

            .nav-links {
                display: flex;
                list-style: none;
                gap: 0.5rem;
                align-items: center;
            }

            .nav-links li a {
                text-decoration: none;
                color: #334155;
                font-weight: 500;
                padding: 0.5rem 1rem;
                border-radius: 50px;
                transition: all 0.3s ease;
                font-size: 0.9rem;
            }

            .nav-links li a:hover,
            .nav-links li a.active {
                color: #0284c7;
                background: rgba(14, 165, 233, 0.1);
            }

            .enroll-btn {
                background: linear-gradient(135deg, #0284c7, #0ea5e9) !important;
                color: white !important;
                padding: 0.6rem 1.5rem !important;
                border-radius: 50px !important;
                font-weight: 600 !important;
                box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);
                transition: all 0.3s ease !important;
            }

            .enroll-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 25px rgba(14, 165, 233, 0.4) !important;
                background: linear-gradient(135deg, #0369a1, #0284c7) !important;
            }

            /* HERO */
            .page-hero {
                padding: 10rem 5% 4rem;
                text-align: center;
            }

            .page-hero h1 {
                font-size: 3rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
            }

            .page-hero p {
                font-size: 1.1rem;
                color: #64748b;
                max-width: 700px;
                margin: 0 auto;
            }

            /* PROGRAM CARDS */
            .programs-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .programs-section>h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .programs-section>p {
                text-align: center;
                color: #64748b;
                margin-bottom: 3rem;
                font-size: 1rem;
            }

            .program-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
                gap: 2.5rem;
            }

            .program-card {
                background: white;
                border-radius: 24px;
                overflow: hidden;
                border: 1px solid rgba(14, 165, 233, 0.12);
                box-shadow: 0 8px 40px rgba(14, 165, 233, 0.06);
                transition: all 0.4s ease;
            }

            .program-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 20px 60px rgba(14, 165, 233, 0.12);
            }

            .program-header {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                padding: 2rem;
                position: relative;
                overflow: hidden;
            }

            .program-header::after {
                content: '';
                position: absolute;
                top: -50%;
                right: -20%;
                width: 200px;
                height: 200px;
                background: rgba(255, 255, 255, 0.08);
                border-radius: 50%;
            }

            .program-header i {
                font-size: 2.5rem;
                margin-bottom: 1rem;
                display: block;
            }

            .program-header h3 {
                font-size: 1.4rem;
                margin-bottom: 0.3rem;
            }

            .program-header .duration {
                font-size: 0.85rem;
                opacity: 0.9;
                background: rgba(255, 255, 255, 0.2);
                display: inline-block;
                padding: 0.2rem 0.8rem;
                border-radius: 50px;
                margin-top: 0.5rem;
            }

            .program-body {
                padding: 2rem;
            }

            .program-body p {
                color: #64748b;
                line-height: 1.8;
                margin-bottom: 1.5rem;
                font-size: 0.95rem;
            }

            .program-body h4 {
                color: #0f172a;
                font-size: 1rem;
                margin-bottom: 1rem;
            }

            .highlights-list {
                list-style: none;
                margin-bottom: 1.5rem;
            }

            .highlights-list li {
                padding: 0.5rem 0;
                color: #475569;
                font-size: 0.9rem;
                display: flex;
                align-items: flex-start;
                gap: 0.8rem;
                border-bottom: 1px solid rgba(14, 165, 233, 0.06);
            }

            .highlights-list li:last-child {
                border-bottom: none;
            }

            .highlights-list li i {
                color: #0ea5e9;
                margin-top: 3px;
                flex-shrink: 0;
            }

            .program-cta {
                display: inline-block;
                padding: 0.7rem 1.8rem;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                border-radius: 50px;
                text-decoration: none;
                font-weight: 600;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(14, 165, 233, 0.25);
            }

            .program-cta:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(14, 165, 233, 0.35);
            }

            /* SEMESTER STRUCTURE */
            .semester-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .semester-section h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .semester-section>p {
                text-align: center;
                color: #64748b;
                margin-bottom: 3rem;
            }

            .semester-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 1.5rem;
            }

            .semester-card {
                background: white;
                border-radius: 20px;
                padding: 1.5rem;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.05);
                transition: all 0.3s ease;
            }

            .semester-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 35px rgba(14, 165, 233, 0.1);
            }

            .semester-card .sem-number {
                display: inline-block;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                padding: 0.3rem 1rem;
                border-radius: 50px;
                font-weight: 700;
                font-size: 0.85rem;
                margin-bottom: 1rem;
            }

            .semester-card h4 {
                color: #0f172a;
                margin-bottom: 0.8rem;
                font-size: 1rem;
            }

            .semester-card ul {
                list-style: none;
                padding: 0;
            }

            .semester-card ul li {
                padding: 0.35rem 0;
                color: #64748b;
                font-size: 0.85rem;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .semester-card ul li i {
                color: #0ea5e9;
                font-size: 0.7rem;
            }

            /* WHY CHOOSE */
            .why-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .why-section h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 3rem;
            }

            .why-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .why-card {
                background: white;
                border-radius: 20px;
                padding: 2rem;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.05);
                transition: all 0.3s ease;
            }

            .why-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 35px rgba(14, 165, 233, 0.1);
            }

            .why-card i {
                font-size: 2.5rem;
                color: #0284c7;
                margin-bottom: 1rem;
            }

            .why-card h4 {
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .why-card p {
                color: #64748b;
                font-size: 0.9rem;
                line-height: 1.6;
            }

            /* FOOTER */
            .premium-footer {
                background: linear-gradient(135deg, #0c4a6e 0%, #075985 50%, #0369a1 100%);
                color: #e0f2fe;
                position: relative;
                overflow: hidden;
            }

            .footer-waves svg {
                display: block;
                width: 100%;
                height: 80px;
            }

            .footer-container {
                display: grid;
                grid-template-columns: 2fr 1fr 1fr 2fr;
                gap: 2rem;
                padding: 2rem 5% 1.5rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .footer-brand h3 {
                font-size: 1.3rem;
                color: white;
                margin-bottom: 0.8rem;
            }

            .footer-brand p {
                font-size: 0.8rem;
                color: #bae6fd;
                line-height: 1.6;
            }

            .social-icons {
                display: flex;
                gap: 0.8rem;
                margin-top: 1rem;
            }

            .social-icons a {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.1);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #bae6fd;
                text-decoration: none;
                transition: all 0.3s ease;
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .social-icons a:hover {
                background: #0ea5e9;
                color: white;
                transform: translateY(-3px);
            }

            .footer-links h4 {
                font-size: 1rem;
                color: white;
                margin-bottom: 1rem;
            }

            .footer-links ul {
                list-style: none;
            }

            .footer-links ul li {
                margin-bottom: 0.5rem;
            }

            .footer-links ul li a {
                color: #bae6fd;
                text-decoration: none;
                font-size: 0.85rem;
                transition: all 0.3s ease;
            }

            .footer-links ul li a:hover {
                color: white;
                padding-left: 5px;
            }

            .footer-newsletter h4 {
                font-size: 1rem;
                color: white;
                margin-bottom: 1rem;
            }

            .footer-bottom {
                text-align: center;
                padding: 1rem 5%;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                font-size: 0.8rem;
                color: #7dd3fc;
            }

            .newsletter-form {
                display: flex;
                max-width: 300px;
                gap: 0.5rem;
            }

            .newsletter-form input {
                flex: 1;
                padding: 0.6rem 1rem;
                border: none;
                border-radius: 50px;
                font-size: 0.85rem;
                outline: none;
            }

            .newsletter-form button {
                padding: 0.6rem 1rem;
                border: none;
                border-radius: 50px;
                background: white;
                color: #0284c7;
                font-weight: 700;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .newsletter-form button:hover {
                transform: scale(1.05);
            }

            /* RESPONSIVE */
            @media (max-width: 768px) {
                .program-grid {
                    grid-template-columns: 1fr;
                }

                .semester-grid {
                    grid-template-columns: 1fr 1fr;
                }

                .why-grid {
                    grid-template-columns: 1fr;
                }

                .footer-container {
                    grid-template-columns: 1fr;
                }

                .page-hero h1 {
                    font-size: 2rem;
                }

                .nav-links {
                    display: none;
                }
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
                    <li><a href="programs.jsp" class="active">Programs</a></li>
                    <li><a href="activities.jsp">Activities</a></li>
                    <li><a href="placement.jsp">Placements</a></li>
                    <li><a href="blog.jsp">Blogs</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="#" class="enroll-btn">ENROLL NOW <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

            <!-- Hero -->
            <div class="page-hero" data-aos="fade-up">
                <h1>Our Programs</h1>
                <p>Industry-aligned postgraduate programs designed to build tomorrow's tech leaders and business
                    innovators</p>
            </div>

            <!-- Program Cards -->
            <div class="programs-section">
                <div class="program-grid">
                    <!-- MCA -->
                    <div class="program-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="program-header">
                            <i class="fas fa-laptop-code"></i>
                            <h3>Master of Computer Applications (MCA)</h3>
                            <span class="duration"><i class="far fa-clock"></i> 2 Years | 4 Semesters</span>
                        </div>
                        <div class="program-body">
                            <p>A comprehensive program that equips students with advanced computing skills, software
                                development expertise, and industry-ready knowledge to excel in the global IT landscape.
                            </p>
                            <h4><i class="fas fa-star" style="color:#0ea5e9;"></i> Program Highlights</h4>
                            <ul class="highlights-list">
                                <li><i class="fas fa-check-circle"></i> Advanced Java, Python, and Full-Stack Web
                                    Development</li>
                                <li><i class="fas fa-check-circle"></i> Data Science, Machine Learning & Artificial
                                    Intelligence</li>
                                <li><i class="fas fa-check-circle"></i> Cloud Computing with AWS, Azure & Google Cloud
                                </li>
                                <li><i class="fas fa-check-circle"></i> Database Management & Big Data Analytics</li>
                                <li><i class="fas fa-check-circle"></i> Mobile Application Development (Android & iOS)
                                </li>
                                <li><i class="fas fa-check-circle"></i> Cybersecurity & Ethical Hacking Fundamentals
                                </li>
                                <li><i class="fas fa-check-circle"></i> Industry Internships & Live Project Work</li>
                                <li><i class="fas fa-check-circle"></i> Placement Training & Soft Skills Development
                                </li>
                            </ul>
                            <a href="#" class="program-cta enroll-btn">Apply Now <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>

                    <!-- MBA -->
                    <div class="program-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="program-header" style="background: linear-gradient(135deg, #0369a1, #0284c7);">
                            <i class="fas fa-briefcase"></i>
                            <h3>Master of Business Administration (MBA)</h3>
                            <span class="duration"><i class="far fa-clock"></i> 2 Years | 4 Semesters</span>
                        </div>
                        <div class="program-body">
                            <p>A dynamic management program focused on developing strategic business leaders with
                                expertise in finance, marketing, operations, and entrepreneurship.</p>
                            <h4><i class="fas fa-star" style="color:#0ea5e9;"></i> Program Highlights</h4>
                            <ul class="highlights-list">
                                <li><i class="fas fa-check-circle"></i> Financial Management & Investment Analysis</li>
                                <li><i class="fas fa-check-circle"></i> Digital Marketing & Brand Management</li>
                                <li><i class="fas fa-check-circle"></i> Human Resource Management & Organizational
                                    Behavior</li>
                                <li><i class="fas fa-check-circle"></i> Operations & Supply Chain Management</li>
                                <li><i class="fas fa-check-circle"></i> Business Analytics & Data-Driven Decision Making
                                </li>
                                <li><i class="fas fa-check-circle"></i> Entrepreneurship & Startup Incubation</li>
                                <li><i class="fas fa-check-circle"></i> Industry Visits & Corporate Internships</li>
                                <li><i class="fas fa-check-circle"></i> Leadership Development & Communication Skills
                                </li>
                            </ul>
                            <a href="#" class="program-cta enroll-btn">Apply Now <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- MCA Semester Structure -->
            <div class="semester-section">
                <h2 data-aos="fade-up">MCA Semester Structure</h2>
                <p data-aos="fade-up">Curriculum designed as per latest AICTE & university guidelines</p>
                <div class="semester-grid">
                    <div class="semester-card" data-aos="fade-up" data-aos-delay="100">
                        <span class="sem-number">Semester I</span>
                        <h4>Foundation</h4>
                        <ul>
                            <li><i class="fas fa-circle"></i> Python</li>
                            <li><i class="fas fa-circle"></i> Digital Logics & Computer Design</li>
                            <li><i class="fas fa-circle"></i> Operating System</li>
                            <li><i class="fas fa-circle"></i> Theory Of Computation</li>
                            <li><i class="fas fa-circle"></i> Advance- Database Management System</li>
                            <li><i class="fas fa-circle"></i> Advance- Database Management System- Lab</li>
                            <li><i class="fas fa-circle"></i> Python-Lab</li>

                        </ul>
                    </div>
                    <div class="semester-card" data-aos="fade-up" data-aos-delay="200">
                        <span class="sem-number">Semester II</span>
                        <h4>Core Development</h4>
                        <ul>
                            <li><i class="fas fa-circle"></i> Linear Algebra</li>
                            <li><i class="fas fa-circle"></i> Data Mining</li>
                            <li><i class="fas fa-circle"></i> Computer Networks</li>
                            <li><i class="fas fa-circle"></i> Design and anlysis of Algorithm </li>
                            <li><i class="fas fa-circle"></i> Web Technologies</li>
                            <li><i class="fas fa-circle"></i> Data Mining-Lab</li>
                            <li><i class="fas fa-circle"></i> Web Technologies-Lab</li>
                        </ul>
                    </div>
                    <div class="semester-card" data-aos="fade-up" data-aos-delay="300">
                        <span class="sem-number">Semester III</span>
                        <h4>Advanced Topics</h4>
                        <ul>
                            <li><i class="fas fa-circle"></i> Machine Learning </li>
                            <li><i class="fas fa-circle"></i> Software Engineering</li>
                            <li><i class="fas fa-circle"></i> Computer Graphics</li>
                            <li><i class="fas fa-circle"></i> Elective - I</li>
                            <li><i class="fas fa-circle"></i> Digital Image Processing</li>
                            <li><i class="fas fa-circle"></i> Machine Learning -Lab</li>
                            <li><i class="fas fa-circle"></i> Computer Graphics-Lab</li>
                        </ul>
                    </div>
                    <div class="semester-card" data-aos="fade-up" data-aos-delay="400">
                        <span class="sem-number">Semester IV</span>
                        <h4>Industry Ready</h4>
                        <ul>
                            <li><i class="fas fa-circle"></i> Elective - II</li>
                            <li><i class="fas fa-circle"></i> Operation Research</li>
                            <li><i class="fas fa-circle"></i> Network Security</li>
                            <li><i class="fas fa-circle"></i> Artificial Intelligence</li>
                            <li><i class="fas fa-circle"></i> Artificial Intelligence-Lab</li>
                            <li><i class="fas fa-circle"></i> Major Project </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Why Choose CBS -->
            <div class="why-section">
                <h2 data-aos="fade-up">Why Choose CBS?</h2>
                <div class="why-grid">
                    <div class="why-card" data-aos="fade-up" data-aos-delay="100">
                        <i class="fas fa-chalkboard-teacher"></i>
                        <h4>Expert Faculty</h4>
                        <p>Learn from industry professionals and experienced academicians with deep domain expertise.
                        </p>
                    </div>
                    <div class="why-card" data-aos="fade-up" data-aos-delay="200">
                        <i class="fas fa-building"></i>
                        <h4>Modern Infrastructure</h4>
                        <p>State-of-the-art labs, smart classrooms, high-speed internet, and a well-stocked library.</p>
                    </div>
                    <div class="why-card" data-aos="fade-up" data-aos-delay="300">
                        <i class="fas fa-handshake"></i>
                        <h4>Industry Partnerships</h4>
                        <p>Collaborations with top IT companies for guest lectures, workshops, and internship
                            opportunities.</p>
                    </div>
                    <div class="why-card" data-aos="fade-up" data-aos-delay="400">
                        <i class="fas fa-trophy"></i>
                        <h4>100% Placement Support</h4>
                        <p>Dedicated placement cell with training programs, mock interviews, and direct campus
                            recruitment.</p>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="premium-footer">
                <div class="footer-waves">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
                        <path fill="#0ea5e9" fill-opacity="0.25"
                            d="M0,192L48,197.3C96,203,192,213,288,208C384,203,480,181,576,176C672,171,768,181,864,197.3C960,213,1056,235,1152,224C1248,213,1344,171,1392,149.3L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
                        </path>
                        <path fill="#0284c7" fill-opacity="0.15"
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
                            <li><a href="about.jsp"><i class="fas fa-chevron-right"></i> About CBS</a></li>
                            <li><a href="programs.jsp"><i class="fas fa-chevron-right"></i> Programs</a></li>
                            <li><a href="placement.jsp"><i class="fas fa-chevron-right"></i> Placements</a></li>
                            <li><a href="contact.jsp"><i class="fas fa-chevron-right"></i> Contact</a></li>
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
                        <!-- <p style="font-size:0.8rem; margin-bottom:1rem; color:#cffafe;">Subscribe for latest updates & events</p>
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
                    <p>&copy; 2025 Chetan Business School - All Rights Reserved. | Designed with <i class="fas fa-heart"
                            style="color:#38bdf8;"></i> for future innovators</p>
                </div>
            </footer>
        </div>

        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init({ duration: 800, once: true, offset: 100 });
            window.addEventListener('scroll', function () {
                const navbar = document.getElementById('navbar');
                if (window.scrollY > 50) { navbar.classList.add('scrolled'); }
                else { navbar.classList.remove('scrolled'); }
            });
        </script>
        <script src="js/enroll-modal.js"></script>

        <link rel="stylesheet" href="css/chatbot.css">
        <script src="js/chatbot.js"></script>
    </body>

    </html>