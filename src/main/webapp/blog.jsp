<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | Blogs - Insights & Stories</title>
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

            .floating-shapes .shape1,
            .floating-shapes .shape2,
            .floating-shapes .shape3,
            .floating-shapes .shape4,
            .floating-shapes .shape5 {
                position: absolute;
                border-radius: 50%;
                opacity: 0.08;
                animation: float 20s infinite ease-in-out;
            }

            .floating-shapes .shape1 {
                width: 250px;
                height: 250px;
                background: #38bdf8;
                top: 10%;
                left: -5%;
                animation-delay: 0s;
            }

            .floating-shapes .shape2 {
                width: 180px;
                height: 180px;
                background: #0ea5e9;
                top: 60%;
                right: -3%;
                animation-delay: 3s;
            }

            .floating-shapes .shape3 {
                width: 120px;
                height: 120px;
                background: #7dd3fc;
                bottom: 20%;
                left: 30%;
                animation-delay: 6s;
            }

            .floating-shapes .shape4 {
                width: 200px;
                height: 200px;
                background: #bae6fd;
                top: 30%;
                right: 20%;
                animation-delay: 9s;
            }

            .floating-shapes .shape5 {
                width: 90px;
                height: 90px;
                background: #0284c7;
                bottom: 40%;
                left: 60%;
                animation-delay: 12s;
            }

            @keyframes float {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                33% {
                    transform: translate(30px, -20px) scale(1.05);
                }

                66% {
                    transform: translate(-20px, 15px) scale(0.95);
                }
            }

            .main-content {
                position: relative;
                z-index: 1;
            }

            /* ====== NAVBAR ====== */
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
                -webkit-backdrop-filter: blur(20px);
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

            /* ====== BLOG HERO ====== */
            .blog-hero {
                padding: 10rem 5% 4rem;
                text-align: center;
            }

            .blog-hero h1 {
                font-size: 3rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
            }

            .blog-hero p {
                font-size: 1.1rem;
                color: #64748b;
                max-width: 600px;
                margin: 0 auto;
            }

            /* ====== CATEGORIES ====== */
            .categories {
                display: flex;
                justify-content: center;
                gap: 1rem;
                padding: 0 5% 3rem;
                flex-wrap: wrap;
            }

            .category-btn {
                padding: 0.6rem 1.5rem;
                border: 2px solid rgba(14, 165, 233, 0.25);
                background: white;
                color: #334155;
                border-radius: 50px;
                cursor: pointer;
                font-weight: 600;
                font-size: 0.9rem;
                transition: all 0.3s ease;
            }

            .category-btn:hover,
            .category-btn.active {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                border-color: transparent;
                box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);
            }

            /* ====== FEATURED SECTION ====== */
            .featured-section {
                padding: 0 5% 3rem;
                max-width: 1400px;
                margin: 0 auto;
            }

            .featured-card {
                display: grid;
                grid-template-columns: 1fr 1fr;
                border-radius: 24px;
                overflow: hidden;
                background: white;
                border: 1px solid rgba(14, 165, 233, 0.12);
                box-shadow: 0 8px 40px rgba(14, 165, 233, 0.08);
                transition: transform 0.4s ease, box-shadow 0.4s ease;
            }

            .featured-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 50px rgba(14, 165, 233, 0.15);
            }

            .featured-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .featured-content {
                padding: 2.5rem;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .featured-badge {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                padding: 0.4rem 1rem;
                border-radius: 50px;
                font-size: 0.8rem;
                font-weight: 600;
                display: inline-block;
                width: fit-content;
                margin-bottom: 1rem;
            }

            .featured-content h2 {
                font-size: 1.5rem;
                color: #0f172a;
                margin-bottom: 1rem;
                line-height: 1.4;
            }

            .featured-content p {
                color: #64748b;
                line-height: 1.8;
                margin-bottom: 1.5rem;
            }

            /* ====== BLOG GRID ====== */
            .blog-grid {
                padding: 0 5% 3rem;
                max-width: 1400px;
                margin: 0 auto;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
                gap: 2rem;
            }

            .blog-card {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                border: 1px solid rgba(14, 165, 233, 0.1);
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.06);
                transition: all 0.4s ease;
            }

            .blog-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 45px rgba(14, 165, 233, 0.12);
            }

            .blog-image {
                position: relative;
                overflow: hidden;
                height: 220px;
            }

            .blog-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .blog-card:hover .blog-image img {
                transform: scale(1.08);
            }

            .blog-category {
                position: absolute;
                top: 1rem;
                left: 1rem;
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                padding: 0.3rem 0.8rem;
                border-radius: 50px;
                font-size: 0.75rem;
                font-weight: 600;
            }

            .blog-content {
                padding: 1.5rem;
            }

            .blog-meta {
                display: flex;
                gap: 1.5rem;
                font-size: 0.8rem;
                color: #94a3b8;
                margin-bottom: 0.8rem;
            }

            .blog-content h3 {
                font-size: 1.15rem;
                color: #0f172a;
                margin-bottom: 0.8rem;
                line-height: 1.4;
            }

            .blog-content p {
                color: #64748b;
                font-size: 0.9rem;
                line-height: 1.7;
                margin-bottom: 1rem;
            }

            .read-more {
                color: #0284c7;
                text-decoration: none;
                font-weight: 600;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .read-more:hover {
                color: #0369a1;
                gap: 0.8rem;
            }

            /* ====== NEWSLETTER ====== */
            .newsletter-section {
                padding: 3rem 5%;
                max-width: 1400px;
                margin: 0 auto;
            }

            .newsletter-container {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                border-radius: 24px;
                padding: 3rem;
                text-align: center;
                color: white;
            }

            .newsletter-container h3 {
                font-size: 1.5rem;
                margin-bottom: 0.5rem;
            }

            .newsletter-container p {
                font-size: 0.95rem;
                opacity: 0.9;
                margin-bottom: 1.5rem;
            }

            .newsletter-form {
                display: flex;
                max-width: 500px;
                margin: 0 auto;
                gap: 0.5rem;
            }

            .newsletter-form input {
                flex: 1;
                padding: 0.8rem 1.2rem;
                border: none;
                border-radius: 50px;
                font-size: 0.9rem;
                outline: none;
            }

            .newsletter-form button {
                padding: 0.8rem 1.5rem;
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
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            }

            /* ====== BLOG MODAL ====== */
            .blog-modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(8px);
                z-index: 10000;
                justify-content: center;
                align-items: center;
                padding: 2rem;
            }

            .blog-modal.active {
                display: flex;
            }

            .blog-modal-dialog {
                background: white;
                border-radius: 24px;
                max-width: 800px;
                width: 100%;
                max-height: 90vh;
                overflow-y: auto;
                position: relative;
                box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
            }

            .blog-modal-close {
                position: absolute;
                top: 1rem;
                right: 1rem;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                border: none;
                background: rgba(255, 255, 255, 0.9);
                color: #334155;
                font-size: 1.1rem;
                cursor: pointer;
                z-index: 10;
                transition: all 0.3s ease;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
            }

            .blog-modal-close:hover {
                background: #0284c7;
                color: white;
            }

            .blog-modal-img {
                width: 100%;
                height: 300px;
                object-fit: cover;
                border-radius: 24px 24px 0 0;
            }

            .blog-modal-body {
                padding: 2rem;
            }

            .blog-modal-body .tag {
                background: linear-gradient(135deg, #0284c7, #0ea5e9);
                color: white;
                padding: 0.3rem 0.8rem;
                border-radius: 50px;
                font-size: 0.75rem;
                font-weight: 600;
            }

            .blog-modal-body h3 {
                font-size: 1.5rem;
                color: #0f172a;
                margin: 1rem 0;
            }

            .modal-meta {
                display: flex;
                gap: 1.5rem;
                color: #94a3b8;
                font-size: 0.85rem;
                margin-bottom: 1.5rem;
            }

            .blog-modal-body p {
                color: #475569;
                line-height: 1.8;
                margin-bottom: 1rem;
            }

            /* ====== FOOTER ====== */
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

            /* ====== ANIMATIONS ====== */
            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* ====== RESPONSIVE ====== */
            @media (max-width: 768px) {
                .featured-card {
                    grid-template-columns: 1fr;
                }

                .blog-grid {
                    grid-template-columns: 1fr;
                }

                .footer-container {
                    grid-template-columns: 1fr;
                }

                .blog-hero h1 {
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
                    <li><a href="placement.jsp">Placements</a></li>
                    <li><a href="blog.jsp" class="active">Blogs</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="#" class="enroll-btn">ENROLL NOW <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

            <div class="blog-hero">
                <h1>Insights & Stories</h1>
                <p>Stay updated with the latest trends, campus news, and career guidance from CBS</p>
            </div>

            <!-- Category Filters -->
            <div class="categories" data-aos="fade-up">
                <button class="category-btn active" data-category="all">All Posts</button>
                <button class="category-btn" data-category="tech">Technology</button>
                <button class="category-btn" data-category="career">Career</button>
                <button class="category-btn" data-category="campus">Campus Life</button>
                <button class="category-btn" data-category="alumni">Alumni</button>
            </div>

            <!-- Featured Post -->
            <div class="featured-section" data-aos="fade-up">
                <div class="featured-card">
                    <div class="featured-image">
                        <img src="https://images.unsplash.com/photo-1677442136019-21780ecad995?w=1000&h=600&fit=crop"
                            alt="AI in Education">
                    </div>
                    <div class="featured-content">
                        <span class="featured-badge">Featured</span>
                        <h2>The Future of AI in Education: How Machine Learning is Transforming Learning</h2>
                        <p>Artificial Intelligence is revolutionizing the education sector. From personalized learning
                            paths to intelligent tutoring systems, discover how AI is shaping the future of education
                            and preparing students for Industry 4.0...</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>Artificial Intelligence is no longer a concept of the future; it is actively reshaping
                                how students learn and teachers instruct. By leveraging advanced machine learning
                                algorithms, institutions can analyze student performance patterns and tailor curriculum
                                pathways in real-time. This personalization ensures that learners can progress at their
                                own speed, focusing extra attention on challenging concepts while accelerating through
                                familiar topics.</p>
                            <p>Intelligent tutoring systems and virtual AI assistants are now capable of providing 24/7
                                support to students, answering conceptual queries, and offering instant feedback on
                                assignments. This significantly reduces the administrative workload on faculty members,
                                allowing them to dedicate more quality time to mentoring and collaborative group
                                discussions rather than repetitive grading.</p>
                            <p>Beyond individual learning, AI is helping educational administrators optimize enrollment,
                                forecast student success rates, and identify areas of curriculum improvement. At Chetan
                                Business School (CBS), we are integrating AI and Data Science concepts directly into our
                                MCA curriculum, ensuring that our graduates are not just passive consumers of AI
                                technology but the creators and engineers of the future.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="The Future of AI in Education: How Machine Learning is Transforming Learning"
                            data-category="Technology" data-date="Jan 20, 2025" data-author="Dr. Rajesh Patil"
                            data-img="https://images.unsplash.com/photo-1677442136019-21780ecad995?w=1000&h=600&fit=crop">Read
                            Full Article <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <!-- Blog Grid -->
            <div class="blog-grid" id="blogGrid">
                <!-- Blog 1 - Tech -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="100" data-category="tech">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800&h=500&fit=crop"
                            alt="Python Programming">
                        <span class="blog-category">Technology</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Jan 15, 2025</span>
                            <span><i class="far fa-user"></i> Prof. Meera Desai</span>
                        </div>
                        <h3>Top 10 Python Libraries Every MCA Student Should Master in 2025</h3>
                        <p>From data science to web development, discover the essential Python libraries that will boost
                            your career prospects and make you industry-ready.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>Python has sustained its position as the most popular language in modern computing,
                                dominating domains from software development to machine learning and automation. For MCA
                                students, mastering Python is a powerful stepping stone to securing top-tier jobs.
                                However, Python's true strength lies in its extensive ecosystem of libraries that
                                streamline complex processes.</p>
                            <p>To stand out, students must look beyond syntax and gain expertise in core libraries.
                                NumPy and Pandas are critical for data manipulation and analysis, forming the basis of
                                all data science pipelines. For visual interpretation, Matplotlib and Seaborn are
                                standard. In web development, Frameworks like Django and FastAPI are highly sought after
                                by recruiters for building robust APIs.</p>
                            <p>When it comes to Artificial Intelligence, Scikit-Learn provides simple and efficient
                                tools for predictive data analysis. For deep learning, TensorFlow and PyTorch are the
                                gold standard. Mastering these libraries through hands-on projects, such as building
                                prediction models or web applications, provides MCA graduates with a distinct
                                competitive advantage during recruitment drives.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="Top 10 Python Libraries Every MCA Student Should Master in 2025"
                            data-category="Technology" data-date="Jan 15, 2025" data-author="Prof. Meera Desai"
                            data-img="https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Blog 2 - Career -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="150" data-category="career">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&h=500&fit=crop"
                            alt="Campus Placements">
                        <span class="blog-category">Career</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Jan 10, 2025</span>
                            <span><i class="far fa-user"></i> Placement Cell</span>
                        </div>
                        <h3>Cracking Your Dream Job: Essential Tips for Campus Placements</h3>
                        <p>Expert advice on resume building, aptitude preparation, interview skills, and strategies to
                            stand out in campus recruitment drives.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>Campus placement is a major milestone for any professional student. Securing a dream
                                offer from premium MNCs requires a structured, multi-disciplinary approach. It is not
                                merely about maintaining a high GPA; candidates must showcase a balance of strong
                                technical competencies, problem-solving skills, and impeccable communication.</p>
                            <p>Preparation should begin with coding and quantitative aptitude. Many recruiters use
                                automated tests to filter candidates initially, making daily practice on platforms like
                                LeetCode or GeeksforGeeks essential. Additionally, building a clean resume that
                                highlights actual projects, contributions, and specific role responsibilities can
                                instantly attract the attention of hiring managers.</p>
                            <p>During the final stages, behavioral and technical interviews test how candidates handle
                                real-world challenges. Practicing mock interviews, preparing short stories about
                                overcoming difficulties, and presenting a professional, positive attitude are key
                                differentiator factors. The CBS Placement Cell provides continuous guidance and runs
                                targeted training programs to ensure all students are fully prepared.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="Cracking Your Dream Job: Essential Tips for Campus Placements"
                            data-category="Career" data-date="Jan 10, 2025" data-author="Placement Cell"
                            data-img="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Blog 3 - Campus -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="200" data-category="campus">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1511578314322-379afb476865?w=800&h=500&fit=crop"
                            alt="Campus Fest">
                        <span class="blog-category">Campus Life</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Jan 5, 2025</span>
                            <span><i class="far fa-user"></i> Student Council</span>
                        </div>
                        <h3>TechVibes 2025: A Spectacular Celebration of Technology and Culture</h3>
                        <p>Relive the moments from our annual tech-cultural fest featuring hackathons, celebrity
                            performances, and unforgettable memories.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>TechVibes 2025, the flagship annual tech-cultural festival of Chetan Business School,
                                concluded last week with record participation and high energy. Spanning over three days,
                                the fest brought together brilliant minds from across the region to compete,
                                collaborate, and showcase their talents in multiple academic, technical, and cultural
                                events.</p>
                            <p>The coding challenge and 24-hour hackathon were the highlights of the technical track,
                                with participants developing innovative solutions to municipal traffic and
                                sustainability problems. On the cultural side, student bands, dramatic performances, and
                                dance showcases captivated the audience, culminating in a spectacular celebrity concert
                                night that left everyone energized.</p>
                            <p>Event coordinators expressed immense pride in how the student committees managed every
                                detail, from technical setup and sponsorship to hospitality. More than just a
                                celebration, fests like TechVibes help students build crucial leadership, teamwork, and
                                project management skills that serve them well throughout their careers.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="TechVibes 2025: A Spectacular Celebration of Technology and Culture"
                            data-category="Campus Life" data-date="Jan 5, 2025" data-author="Student Council"
                            data-img="https://images.unsplash.com/photo-1511578314322-379afb476865?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Blog 4 - Alumni -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="250" data-category="alumni">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800&h=500&fit=crop"
                            alt="Alumni Spotlight">
                        <span class="blog-category">Alumni</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Dec 20, 2024</span>
                            <span><i class="far fa-user"></i> Alumni Relations</span>
                        </div>
                        <h3>Alumni Spotlight: From CBS to Google - Journey of Priya Sharma</h3>
                        <p>Read the inspiring story of our alumna who cracked Google and shares valuable lessons for
                            current students.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>We are proud to feature Priya Sharma, a graduate of Chetan Business School's MCA class of
                                2022, who recently joined Google as a Software Engineer. Priya's journey is an
                                inspiration to all current students, showing how clarity of purpose, combined with the
                                right mentorship, can pave the path to global technology companies.</p>
                            <p>Priya attributes much of her success to the strong foundational courses at CBS, the
                                continuous guidance from faculty, and her active involvement in the coding club. She
                                emphasizes that understanding computer science fundamentals—data structures, system
                                design, and database management—is key to cracking top-tier product-based company
                                interviews.</p>
                            <p>Her advice to students is simple: "Do not chase placements; chase skills. Build real
                                projects that solve genuine problems, contribute to open-source software, and network
                                with professionals on LinkedIn. The opportunities will automatically follow." Priya
                                continues to mentor CBS students through our regular guest webinar sessions.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="Alumni Spotlight: From CBS to Google - Journey of Priya Sharma"
                            data-category="Alumni" data-date="Dec 20, 2024" data-author="Alumni Relations"
                            data-img="https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Blog 5 - Tech -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="300" data-category="tech">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1600132806370-bf17e65e942f?w=800&h=500&fit=crop"
                            alt="Cloud Computing">
                        <span class="blog-category">Technology</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Dec 15, 2024</span>
                            <span><i class="far fa-user"></i> Dr. Anjali Nair</span>
                        </div>
                        <h3>Cloud Computing Trends: AWS vs Azure vs Google Cloud 2025</h3>
                        <p>A comprehensive comparison of leading cloud platforms and which skills will be most valuable
                            for IT professionals.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>The global shift to cloud-native architectures has accelerated, with almost every modern
                                application deploying on cloud infrastructure. For technology students, familiarity with
                                cloud platforms is no longer optional. The market continues to be dominated by the 'Big
                                Three': Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP).</p>
                            <p>AWS remains the market share leader, known for its extensive list of services and
                                maturity. Azure is highly favored in enterprise environments due to its seamless
                                integration with Windows and Microsoft systems. Meanwhile, Google Cloud is gaining rapid
                                adoption in data analytics, AI, and Kubernetes deployments. Understanding the strengths
                                of each platform is key to making informed deployment decisions.</p>
                            <p>Moving into 2025, trends like Serverless computing, Multi-cloud orchestration, and hybrid
                                cloud models are defining the landscape. Students are encouraged to pursue foundational
                                cloud certifications (such as AWS Solutions Architect or Azure Fundamentals) to add
                                significant weight to their professional portfolios.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="Cloud Computing Trends: AWS vs Azure vs Google Cloud 2025"
                            data-category="Technology" data-date="Dec 15, 2024" data-author="Dr. Anjali Nair"
                            data-img="https://images.unsplash.com/photo-1600132806370-bf17e65e942f?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <!-- Blog 6 - Career -->
                <div class="blog-card" data-aos="fade-up" data-aos-delay="350" data-category="career">
                    <div class="blog-image">
                        <img src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&h=500&fit=crop"
                            alt="Data Science">
                        <span class="blog-category">Career</span>
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span><i class="far fa-calendar-alt"></i> Dec 10, 2024</span>
                            <span><i class="far fa-user"></i> Career Counsellor</span>
                        </div>
                        <h3>Data Science vs AI vs Software Development: Which Career Path is Right for You?</h3>
                        <p>Detailed analysis of career paths, salary expectations, and growth opportunities to help you
                            make informed decisions.</p>
                        <div class="blog-full-content" style="display: none;">
                            <p>Choosing a career path after completing an MCA or IT degree can be daunting, given the
                                rapid convergence of technology. The three most lucrative paths today are Data Science,
                                Artificial Intelligence, and traditional Software Development. While they overlap, each
                                requires a unique mindset, skill set, and day-to-day focus.</p>
                            <p>Software Development focuses on building and maintaining scalable systems, web apps, and
                                mobile applications, relying heavily on programming languages like Java, C#, or
                                JavaScript. Data Science revolves around discovering insights from large datasets using
                                statistics and visualization tools. AI and Machine Learning involve developing
                                algorithms that learn and make decisions.</p>
                            <p>Choosing the right path depends on your personal interests: if you love building
                                products, go for Software Development; if you enjoy statistics and playing with data,
                                choose Data Science; if you are fascinated by automation and predictive modelling, AI is
                                your calling. CBS offers specialized courses in all three tracks to help students align
                                their education with their passions.</p>
                        </div>
                        <a href="#" class="read-more"
                            data-title="Data Science vs AI vs Software Development: Which Career Path is Right for You?"
                            data-category="Career" data-date="Dec 10, 2024" data-author="Career Counsellor"
                            data-img="https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&h=500&fit=crop">Read
                            More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <!-- Newsletter Section -->
            <!-- <div class="newsletter-section" data-aos="fade-up">
                <div class="newsletter-container">
                    <h3><i class="fas fa-envelope"></i> Subscribe to Our Newsletter</h3>
                    <p>Get the latest updates on admissions, events, and career tips directly in your inbox</p>
                    <div class="newsletter-form">
                        <input type="email" placeholder="Your email address">
                        <button><i class="fas fa-paper-plane"></i> Subscribe</button>
                    </div>
                </div>
            </div> -->

            <!-- Blog Detail Modal -->
            <div class="blog-modal" id="blogDetailModal">
                <div class="blog-modal-dialog">
                    <button class="blog-modal-close" id="closeBlogModal"><i class="fas fa-times"></i></button>
                    <img class="blog-modal-img" id="modalBlogImg" src="" alt="Blog Image">
                    <div class="blog-modal-body">
                        <span class="tag" id="modalBlogCategory">Category</span>
                        <h3 id="modalBlogTitle">Blog Title</h3>
                        <div class="modal-meta" id="modalBlogMeta">
                            <span><i class="far fa-calendar-alt"></i> Jan 1, 2025</span>
                            <span><i class="far fa-user"></i> Author</span>
                        </div>
                        <div id="modalBlogContent">
                            <!-- Full content paragraphs loaded dynamically -->
                        </div>
                    </div>
                </div>
            </div>

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
                        <!-- <p style="font-size:0.8rem; margin-bottom:1rem; color:#cffafe;">Subscribe for blog updates</p>
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

            // Category Filter Functionality
            const categoryBtns = document.querySelectorAll('.category-btn');
            const blogCards = document.querySelectorAll('.blog-card');

            categoryBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    categoryBtns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');

                    const category = btn.getAttribute('data-category');

                    blogCards.forEach(card => {
                        if (category === 'all' || card.getAttribute('data-category') === category) {
                            card.style.display = 'block';
                            card.style.animation = 'fadeUp 0.5s ease-out';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });

            // Blog Modal Functionality
            const blogModal = document.getElementById('blogDetailModal');
            const closeBlogModalBtn = document.getElementById('closeBlogModal');
            const modalBlogImg = document.getElementById('modalBlogImg');
            const modalBlogCategory = document.getElementById('modalBlogCategory');
            const modalBlogTitle = document.getElementById('modalBlogTitle');
            const modalBlogMeta = document.getElementById('modalBlogMeta');
            const modalBlogContent = document.getElementById('modalBlogContent');

            document.querySelectorAll('.read-more').forEach(btn => {
                btn.addEventListener('click', function (e) {
                    e.preventDefault();
                    const card = this.closest('.blog-card') || this.closest('.featured-card');
                    const title = this.getAttribute('data-title');
                    const category = this.getAttribute('data-category');
                    const date = this.getAttribute('data-date');
                    const author = this.getAttribute('data-author');
                    const img = this.getAttribute('data-img');

                    // Get full content from the hidden container inside the card
                    const fullContentEl = card.querySelector('.blog-full-content');
                    const fullHtml = fullContentEl ? fullContentEl.innerHTML : '';

                    // Populate modal
                    modalBlogImg.src = img;
                    modalBlogImg.alt = title;
                    modalBlogCategory.textContent = category;
                    modalBlogTitle.textContent = title;
                    modalBlogMeta.innerHTML = `<span><i class="far fa-calendar-alt"></i> ${date}</span>
                                       <span><i class="far fa-user"></i> ${author}</span>`;
                    modalBlogContent.innerHTML = fullHtml;

                    // Show modal
                    blogModal.classList.add('active');
                    document.body.style.overflow = 'hidden'; // Disable page scrolling when open
                });
            });

            function closeModal() {
                blogModal.classList.remove('active');
                document.body.style.overflow = ''; // Enable page scrolling
            }

            closeBlogModalBtn.addEventListener('click', closeModal);
            blogModal.addEventListener('click', function (e) {
                if (e.target === blogModal) {
                    closeModal();
                }
            });

            // Close modal on Escape key press
            window.addEventListener('keydown', function (e) {
                if (e.key === 'Escape' && blogModal.classList.contains('active')) {
                    closeModal();
                }
            });
        </script>
        <script src="js/enroll-modal.js"></script>

        <link rel="stylesheet" href="css/chatbot.css">
        <script src="js/chatbot.js"></script>
    </body>

    </html>