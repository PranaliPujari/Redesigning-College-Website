<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | Placements - Career Success Stories</title>
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

            /* STATS BANNER */
            .stats-banner {
                padding: 0 5% 3rem;
                max-width: 1200px;
                margin: 0 auto;
            }

            .stats-row {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 1.5rem;
            }

            .stat-item {
                background: white;
                border-radius: 20px;
                padding: 2rem;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.05);
                transition: all 0.3s ease;
            }

            .stat-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 35px rgba(14, 165, 233, 0.1);
            }

            .stat-item .number {
                font-size: 2.5rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .stat-item p {
                color: #64748b;
                font-size: 0.9rem;
                margin-top: 0.3rem;
                font-weight: 500;
            }

            /* TOP RECRUITERS */
            .recruiters-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .recruiters-section h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .recruiters-section>p {
                text-align: center;
                color: #64748b;
                margin-bottom: 3rem;
            }

            .recruiters-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                gap: 1.5rem;
            }

            .recruiter-card {
                background: white;
                border-radius: 16px;
                padding: 1.5rem;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 15px rgba(14, 165, 233, 0.04);
                transition: all 0.3s ease;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 120px;
            }

            .recruiter-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 30px rgba(14, 165, 233, 0.1);
                border-color: rgba(14, 165, 233, 0.25);
            }

            .recruiter-card i {
                font-size: 2rem;
                color: #0284c7;
                margin-bottom: 0.8rem;
            }

            .recruiter-card h4 {
                color: #0f172a;
                font-size: 0.95rem;
            }

            .recruiter-card p {
                color: #64748b;
                font-size: 0.8rem;
            }

            /* PLACEMENT PROCESS */
            .process-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .process-section h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .process-section>p {
                text-align: center;
                color: #64748b;
                margin-bottom: 3rem;
            }

            .process-timeline {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .process-step {
                background: white;
                border-radius: 20px;
                padding: 2rem;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.05);
                transition: all 0.3s ease;
                position: relative;
            }

            .process-step:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 35px rgba(14, 165, 233, 0.1);
            }

            .step-number {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                font-weight: 800;
                font-size: 1.2rem;
                margin-bottom: 1rem;
            }

            .process-step h4 {
                color: #0f172a;
                margin-bottom: 0.5rem;
                font-size: 1.05rem;
            }

            .process-step p {
                color: #64748b;
                font-size: 0.9rem;
                line-height: 1.6;
            }

            /* SUCCESS STORIES */
            .stories-section {
                padding: 2rem 5% 4rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .stories-section h2 {
                text-align: center;
                font-size: 2rem;
                color: #0f172a;
                margin-bottom: 0.5rem;
            }

            .stories-section>p {
                text-align: center;
                color: #64748b;
                margin-bottom: 3rem;
            }

            .stories-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
                gap: 2rem;
            }

            .story-card {
                background: white;
                border-radius: 20px;
                padding: 2rem;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.05);
                transition: all 0.3s ease;
            }

            .story-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 35px rgba(14, 165, 233, 0.1);
            }

            .story-header {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 1rem;
            }

            .story-avatar {
                width: 55px;
                height: 55px;
                border-radius: 50%;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: 700;
                font-size: 1.2rem;
                flex-shrink: 0;
            }

            .story-info h4 {
                color: #0f172a;
                font-size: 1rem;
            }

            .story-info .role {
                color: #0284c7;
                font-size: 0.85rem;
                font-weight: 600;
            }

            .story-info .batch {
                color: #94a3b8;
                font-size: 0.8rem;
            }

            .story-card .quote {
                color: #475569;
                font-size: 0.9rem;
                line-height: 1.7;
                font-style: italic;
            }

            .story-card .quote::before {
                content: '\201C';
                font-size: 2rem;
                color: #0ea5e9;
                line-height: 0;
                vertical-align: -0.4em;
                margin-right: 4px;
            }

            /* CTA SECTION */
            .cta-section {
                padding: 3rem 5%;
                max-width: 1200px;
                margin: 0 auto;
            }

            .cta-box {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                border-radius: 24px;
                padding: 3rem;
                text-align: center;
                color: white;
            }

            .cta-box h2 {
                font-size: 1.8rem;
                margin-bottom: 0.5rem;
            }

            .cta-box p {
                font-size: 1rem;
                opacity: 0.9;
                margin-bottom: 1.5rem;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            .cta-box a {
                display: inline-block;
                padding: 0.8rem 2rem;
                background: white;
                color: #0284c7;
                border-radius: 50px;
                text-decoration: none;
                font-weight: 700;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .cta-box a:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
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
                .stats-row {
                    grid-template-columns: 1fr 1fr;
                }

                .stories-grid {
                    grid-template-columns: 1fr;
                }

                .process-timeline {
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
                    <li><a href="programs.jsp">Programs</a></li>
                    <li><a href="activities.jsp">Activities</a></li>
                    <li><a href="placement.jsp" class="active">Placements</a></li>
                    <li><a href="blog.jsp">Blogs</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="#" class="enroll-btn">ENROLL NOW <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

            <!-- Hero -->
            <div class="page-hero" data-aos="fade-up">
                <h1>Placements & Career</h1>
                <p>Launching successful careers through dedicated training, industry connections, and 100% placement
                    support</p>
            </div>

            <!-- Stats Banner -->
            <div class="stats-banner" data-aos="fade-up">
                <div class="stats-row">
                    <div class="stat-item">
                        <div class="number">95%</div>
                        <p>Placement Rate</p>
                    </div>
                    <div class="stat-item">
                        <div class="number">50+</div>
                        <p>Recruiting Companies</p>
                    </div>
                    <div class="stat-item">
                        <div class="number">6 LPA</div>
                        <p>Highest Package</p>
                    </div>
                    <div class="stat-item">
                        <div class="number">3.5 LPA</div>
                        <p>Average Package</p>
                    </div>
                </div>
            </div>

            <!-- Placement Process -->
            <div class="process-section">
                <h2 data-aos="fade-up">Our Placement Process</h2>
                <p data-aos="fade-up">A structured approach to ensure every student is career-ready</p>
                <div class="process-timeline">
                    <div class="process-step" data-aos="fade-up" data-aos-delay="100">
                        <div class="step-number">1</div>
                        <h4>Aptitude Training</h4>
                        <p>Intensive quantitative, logical reasoning, and verbal ability sessions from semester 1.</p>
                    </div>
                    <div class="process-step" data-aos="fade-up" data-aos-delay="200">
                        <div class="step-number">2</div>
                        <h4>Technical Skills</h4>
                        <p>Hands-on coding practice, data structures, algorithms, and technology-specific workshops.</p>
                    </div>
                    <div class="process-step" data-aos="fade-up" data-aos-delay="300">
                        <div class="step-number">3</div>
                        <h4>Mock Interviews</h4>
                        <p>Regular mock interviews with industry professionals and detailed feedback sessions.</p>
                    </div>
                    <div class="process-step" data-aos="fade-up" data-aos-delay="400">
                        <div class="step-number">4</div>
                        <h4>Resume & Profile</h4>
                        <p>Professional resume building, LinkedIn optimization, and portfolio development.</p>
                    </div>
                    <div class="process-step" data-aos="fade-up" data-aos-delay="500">
                        <div class="step-number">5</div>
                        <h4>Campus Drives</h4>
                        <p>Organized on-campus recruitment drives with top IT and management companies.</p>
                    </div>
                    <div class="process-step" data-aos="fade-up" data-aos-delay="600">
                        <div class="step-number">6</div>
                        <h4>Offer & Onboarding</h4>
                        <p>Post-placement support including offer negotiation guidance and onboarding assistance.</p>
                    </div>
                </div>
            </div>

            <!-- Top Recruiters -->
            <div class="recruiters-section">
                <h2 data-aos="fade-up">Our Top Recruiters</h2>
                <p data-aos="fade-up">Leading companies that trust CBS talent</p>
                <div class="recruiters-grid">
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="100">
                        <i class="fas fa-building"></i>
                        <h4>Infosys</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="150">
                        <i class="fas fa-building"></i>
                        <h4>Wipro</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="200">
                        <i class="fas fa-building"></i>
                        <h4>TCS</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="250">
                        <i class="fas fa-building"></i>
                        <h4>Accenture</h4>
                        <p>Consulting & IT</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="300">
                        <i class="fas fa-building"></i>
                        <h4>Cognizant</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="350">
                        <i class="fas fa-building"></i>
                        <h4>Tech Mahindra</h4>
                        <p>IT Solutions</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="400">
                        <i class="fas fa-building"></i>
                        <h4>HCL Technologies</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="450">
                        <i class="fas fa-building"></i>
                        <h4>Capgemini</h4>
                        <p>Consulting & IT</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="500">
                        <i class="fas fa-building"></i>
                        <h4>Mphasis</h4>
                        <p>IT Services</p>
                    </div>
                    <div class="recruiter-card" data-aos="fade-up" data-aos-delay="550">
                        <i class="fas fa-building"></i>
                        <h4>Hexaware</h4>
                        <p>IT Services</p>
                    </div>
                </div>
            </div>

            <!-- Success Stories -->
            <div class="stories-section">
                <h2 data-aos="fade-up">Student Success Stories</h2>
                <p data-aos="fade-up">Hear from our alumni who are now thriving in their careers</p>
                <div class="stories-grid">
                    <div class="story-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="story-header">
                            <div class="story-avatar">PS</div>
                            <div class="story-info">
                                <h4>Priya Sharma</h4>
                                <div class="role">Software Engineer @ Google</div>
                                <div class="batch">MCA Batch 2022</div>
                            </div>
                        </div>
                        <p class="quote">CBS gave me the perfect foundation. The coding club, mentorship, and placement
                            training helped me crack Google. The faculty truly care about each student's success.</p>
                    </div>
                    <div class="story-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="story-header">
                            <div class="story-avatar">RK</div>
                            <div class="story-info">
                                <h4>Rahul Kumar</h4>
                                <div class="role">Data Analyst @ Infosys</div>
                                <div class="batch">MCA Batch 2023</div>
                            </div>
                        </div>
                        <p class="quote">The data science modules and hands-on projects at CBS prepared me for
                            real-world challenges. I got placed in Infosys right from the campus drive.</p>
                    </div>
                    <div class="story-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="story-header">
                            <div class="story-avatar">AJ</div>
                            <div class="story-info">
                                <h4>Anita Joshi</h4>
                                <div class="role">Full Stack Developer @ Wipro</div>
                                <div class="batch">MCA Batch 2023</div>
                            </div>
                        </div>
                        <p class="quote">From learning Java basics to building full-stack applications, CBS transformed
                            my career. The mock interviews were incredibly helpful during placements.</p>
                    </div>
                </div>
            </div>

            <!-- CTA -->
            <div class="cta-section" data-aos="fade-up">
                <div class="cta-box">
                    <h2>Ready to Launch Your Career?</h2>
                    <p>Join CBS and be part of our placement success story. Enroll today and take the first step towards
                        your dream career.</p>
                    <a href="#" class="enroll-btn"
                        style="background: white !important; color: #0284c7 !important;">Apply Now <i
                            class="fas fa-arrow-right"></i></a>
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