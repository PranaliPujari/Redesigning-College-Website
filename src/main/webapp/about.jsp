<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | About Us - Excellence in IT & Management</title>
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

            /* Animated Gradient Background */
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
                animation-duration: 14s;
            }

            .shape5 {
                width: 280px;
                height: 280px;
                top: 65%;
                left: 35%;
                animation-delay: -10s;
            }

            .shape6 {
                width: 100px;
                height: 100px;
                top: 20%;
                left: 20%;
                animation-delay: -5s;
                animation-duration: 12s;
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
                letter-spacing: -0.5px;
                transition: 0.3s;
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

            /* Main Content */
            .main-content {
                position: relative;
                z-index: 10;
            }

            /* Hero Section with Parallax */
            .about-hero {
                text-align: center;
                padding: 6rem 2rem 8rem;
                background: linear-gradient(135deg, rgba(224, 242, 254, 0.6) 0%, rgba(255, 255, 255, 0.3) 100%);
                border-bottom: 1px solid rgba(14, 165, 233, 0.2);
                position: relative;
                overflow: hidden;
            }

            .about-hero::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, rgba(14, 165, 233, 0.12) 0%, transparent 70%);
                animation: rotateGlow 20s linear infinite;
            }

            @keyframes rotateGlow {
                from {
                    transform: rotate(0deg);
                }

                to {
                    transform: rotate(360deg);
                }
            }

            .about-hero h1 {
                font-size: 4rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0f172a, #0284c7, #0369a1);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
                animation: titleReveal 0.8s ease-out;
                position: relative;
                z-index: 2;
            }

            .about-hero p {
                font-size: 1.3rem;
                max-width: 700px;
                margin: 0 auto;
                color: #334155;
                animation: fadeUp 0.8s ease-out 0.2s both;
                position: relative;
                z-index: 2;
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

            /* Story Section with Hover Cards */
            .story-section {
                display: flex;
                flex-wrap: wrap;
                gap: 3rem;
                padding: 5rem 5%;
                max-width: 1400px;
                margin: 0 auto;
            }

            .story-text {
                flex: 1.2;
                background: #ffffff;
                backdrop-filter: blur(12px);
                padding: 2.5rem;
                border-radius: 40px;
                border: 1px solid rgba(14, 165, 233, 0.25);
                transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
                transform-origin: center;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            }

            .story-text:hover {
                border-color: #0284c7;
                transform: translateY(-8px) scale(1.01);
                box-shadow: 0 20px 40px rgba(14, 165, 233, 0.1), 0 0 20px rgba(14, 165, 233, 0.1);
                background: rgba(224, 242, 254, 0.3);
            }

            .story-text h2 {
                font-size: 2.2rem;
                color: #0284c7;
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .story-text p {
                line-height: 1.8;
                margin-bottom: 1rem;
                color: #475569;
            }

            .story-stats {
                flex: 0.8;
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
            }

            .stat-card {
                background: #ffffff;
                backdrop-filter: blur(12px);
                padding: 1.8rem;
                border-radius: 32px;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.25);
                transition: all 0.4s ease;
                cursor: default;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .stat-card:hover {
                transform: translateY(-8px) scale(1.02);
                border-color: #0284c7;
                background: rgba(224, 242, 254, 0.4);
                box-shadow: 0 15px 30px rgba(14, 165, 233, 0.15);
            }

            .stat-number {
                font-size: 2.8rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #38bdf8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                transition: 0.3s;
            }

            .stat-label {
                font-size: 0.95rem;
                color: #334155;
                margin-top: 0.5rem;
            }

            /* Mission & Vision */
            .mission-vision {
                display: flex;
                flex-wrap: wrap;
                gap: 2rem;
                padding: 3rem 5%;
                max-width: 1400px;
                margin: 0 auto;
            }

            .mv-card {
                flex: 1;
                background: #ffffff;
                backdrop-filter: blur(12px);
                padding: 2.5rem;
                border-radius: 40px;
                text-align: center;
                border: 1px solid rgba(14, 165, 233, 0.25);
                transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            }

            .mv-card:hover {
                transform: translateY(-12px);
                border-color: #0284c7;
                box-shadow: 0 25px 45px rgba(14, 165, 233, 0.12);
                background: linear-gradient(135deg, rgba(224, 242, 254, 0.5) 0%, rgba(255, 255, 255, 0.8) 100%);
            }

            .mv-card i {
                font-size: 3.5rem;
                background: linear-gradient(135deg, #38bdf8, #0284c7);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1.2rem;
                transition: 0.3s;
            }

            .mv-card:hover i {
                transform: scale(1.1);
            }

            .mv-card h3 {
                font-size: 1.8rem;
                color: #0284c7;
                margin-bottom: 1rem;
            }

            .mv-card p {
                color: #475569;
                line-height: 1.7;
            }

            /* Why Choose Us - Animated Grid */
            .why-choose {
                padding: 5rem 5%;
                background: rgba(240, 248, 255, 0.5);
                backdrop-filter: blur(8px);
                margin: 2rem 0;
                position: relative;
            }

            .section-title {
                text-align: center;
                font-size: 2.8rem;
                font-weight: 700;
                margin-bottom: 3.5rem;
                background: linear-gradient(135deg, #0f172a, #0284c7, #0369a1);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                position: relative;
                display: inline-block;
                width: 100%;
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

            .features-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 2rem;
                max-width: 1300px;
                margin: 0 auto;
            }

            .feature-item {
                background: #ffffff;
                backdrop-filter: blur(8px);
                padding: 2rem;
                border-radius: 32px;
                text-align: center;
                transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
                border: 1px solid rgba(14, 165, 233, 0.2);
                position: relative;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .feature-item::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(14, 165, 233, 0.15), transparent);
                transition: left 0.6s ease;
            }

            .feature-item:hover::before {
                left: 100%;
            }

            .feature-item:hover {
                transform: translateY(-10px) scale(1.02);
                background: rgba(224, 242, 254, 0.5);
                border-color: #0284c7;
                box-shadow: 0 20px 35px rgba(14, 165, 233, 0.1);
            }

            .feature-item i {
                font-size: 2.8rem;
                background: linear-gradient(135deg, #0284c7, #38bdf8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
                transition: 0.3s;
            }

            .feature-item:hover i {
                transform: scale(1.1);
            }

            .feature-item h4 {
                font-size: 1.3rem;
                color: #0284c7;
                margin-bottom: 0.8rem;
            }

            .feature-item p {
                color: #475569;
                font-size: 0.9rem;
                line-height: 1.6;
            }

            /* Leadership Team with Image Cards */
            .leadership {
                padding: 5rem 5%;
                max-width: 1400px;
                margin: 0 auto;
            }

            .team-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
                gap: 2rem;
                margin-top: 2rem;
            }

            .team-card {
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(10px);
                border-radius: 32px;
                padding: 2rem 1.5rem;
                text-align: center;
                transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
                border: 1px solid rgba(6, 182, 212, 0.2);
                border: 1px solid rgba(14, 165, 233, 0.25);
                position: relative;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .team-card:hover {
                transform: translateY(-12px);
                border-color: #0284c7;
                background: rgba(224, 242, 254, 0.35);
                box-shadow: 0 25px 40px rgba(14, 165, 233, 0.12);
            }

            .team-icon {
                width: 120px;
                height: 120px;
                background: linear-gradient(135deg, #0284c7, #38bdf8);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem;
                transition: all 0.3s ease;
                position: relative;
            }

            .team-card:hover .team-icon {
                transform: scale(1.05);
                box-shadow: 0 0 25px rgba(14, 165, 233, 0.4);
            }

            .team-icon i {
                font-size: 3.5rem;
                color: white;
            }

            .team-card h4 {
                font-size: 1.3rem;
                color: #0284c7;
                margin-bottom: 0.3rem;
            }

            .team-card .designation {
                font-size: 0.85rem;
                color: #0369a1;
                margin-bottom: 0.8rem;
            }

            .team-card p {
                font-size: 0.85rem;
                color: #475569;
                line-height: 1.5;
            }

            /* Contact Strip */
            .contact-strip {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                background: rgba(240, 248, 255, 0.9);
                backdrop-filter: blur(12px);
                padding: 1.2rem 5%;
                gap: 1.5rem;
                border-top: 1px solid rgba(14, 165, 233, 0.3);
                border-bottom: 1px solid rgba(14, 165, 233, 0.3);
                margin-top: 2rem;
            }

            .contact-info span,
            .contact-info a {
                color: #334155;
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
                background: linear-gradient(145deg, #f0f9ff 0%, #e0f2fe 100%);
                border-top: 2px solid rgba(14, 165, 233, 0.4);
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
                opacity: 0.4;
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
                background: rgba(14, 165, 233, 0.1);
                border-radius: 50%;
                color: #0284c7;
                font-size: 1.2rem;
                transition: all 0.3s ease;
                border: 1px solid rgba(14, 165, 233, 0.2);
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
                color: #334155;
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
                border: none;
                background: #ffffff;
                color: #0f172a;
                font-size: 0.85rem;
                outline: none;
                border: 1px solid rgba(14, 165, 233, 0.4);
                transition: 0.3s;
            }

            .newsletter-form input:focus {
                border-color: #0284c7;
                background: #ffffff;
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

            .newsletter-form button:hover {
                transform: scale(1.02);
                box-shadow: 0 5px 15px rgba(2, 132, 199, 0.3);
            }

            .footer-bottom {
                text-align: center;
                padding: 1.5rem;
                border-top: 1px solid rgba(14, 165, 233, 0.15);
                font-size: 0.8rem;
                background: rgba(224, 242, 254, 0.4);
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

                .about-hero h1 {
                    font-size: 2.5rem;
                }

                .about-hero p {
                    font-size: 1rem;
                }

                .story-section {
                    flex-direction: column;
                }

                .mission-vision {
                    flex-direction: column;
                }

                .section-title {
                    font-size: 2rem;
                }

                .contact-strip {
                    flex-direction: column;
                    text-align: center;
                }

                .footer-container {
                    flex-direction: column;
                    gap: 2rem;
                }
            }

            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-track {
                background: #f0f8ff;
            }

            ::-webkit-scrollbar-thumb {
                background: #38bdf8;
                border-radius: 10px;
            }

            .btn-outline {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(8px);
                border: 1px solid #0284c7;
                padding: 0.8rem 2rem;
                border-radius: 40px;
                color: #0284c7;
                text-decoration: none;
                transition: 0.3s;
                display: inline-block;
                font-weight: 550;
            }

            .btn-outline:hover {
                background: rgba(14, 165, 233, 0.15);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(6, 182, 212, 0.3);
            }

            /* Director Section */
            .director-section {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                gap: 3rem;
                padding: 5rem 5%;
                max-width: 1600px;
                margin: 0 auto;
                position: relative;
            }

            .director-photo {
                flex: 1.1;
                min-width: 400px;
                position: relative;
                display: flex;
                justify-content: center;
            }

            .photo-frame {
                position: relative;
                width: min(520px, 100%);
                border-radius: 20px;
                padding: 15px;
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(6, 182, 212, 0.2);
                backdrop-filter: blur(10px);
                z-index: 2;
            }

            .photo-frame img,
            .photo-frame iframe {
                width: 100%;
                height: 560px;
                object-fit: cover;
                object-position: center top;
                border-radius: 12px;
                display: block;
                position: relative;
                z-index: 2;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                border: none;
            }

            .photo-glow {
                position: absolute;
                top: -10%;
                left: -10%;
                width: 120%;
                height: 120%;
                background: radial-gradient(circle, rgba(99, 102, 241, 0.4) 0%, transparent 60%);
                z-index: 1;
                filter: blur(30px);
                animation: pulseGlowDir 4s infinite alternate;
            }

            @keyframes pulseGlowDir {
                0% {
                    transform: scale(0.9);
                    opacity: 0.6;
                }

                100% {
                    transform: scale(1.1);
                    opacity: 0.9;
                }
            }

            .director-message {
                flex: 1.1;
                min-width: 350px;
            }

            .director-message h3 {
                font-size: 2rem;
                color: #2399ed;
                margin-bottom: 0.5rem;
            }

            .director-message .designation {
                color: #06b6d4;
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 2rem;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .message-content {
                background: rgba(255, 255, 255, 0.03);
                padding: 2.5rem;
                border-radius: 24px;
                border-left: 4px solid #6366f1;
                position: relative;
            }

            .message-content p {
                font-size: 1.05rem;
                color: #0d1114;
                line-height: 1.8;
                margin-bottom: 1rem;
            }

            .message-content p:last-child {
                margin-bottom: 0;
            }

            .quote-icon {
                font-size: 2.5rem;
                color: rgba(6, 182, 212, 0.2);
                position: absolute;
                top: -15px;
                left: 20px;
            }

            @media (max-width: 900px) {
                .director-section {
                    flex-direction: column;
                    text-align: center;
                    gap: 2rem;
                }

                .director-message .section-title {
                    text-align: center !important;
                }

                .director-message .section-title::after {
                    left: 50%;
                    transform: translateX(-50%);
                }

                .message-content {
                    text-align: left;
                }

                .director-photo {
                    min-width: 0;
                    width: 100%;
                }

                .photo-frame {
                    width: min(460px, 100%);
                }

                .photo-frame img,
                .photo-frame iframe {
                    height: 500px;
                }
            }

            .team-icon {
                overflow: hidden;
                padding: 4px;
            }

            .team-icon img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 50%;
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
                <div class="shape6"></div>
            </div>
        </div>

        <div class="main-content">
            <nav class="navbar" id="navbar">
                <div class="logo">
                    <img src="images/cbs-logo.webp" alt="CBS Logo" style="height: 90px; margin-top: 5px;">
                </div>
                <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp" class="active">About Us</a></li>
                    <li><a href="programs.jsp">Programs</a></li>
                    <li><a href="activities.jsp">Activities</a></li>
                    <li><a href="placement.jsp">Placements</a></li>
                    <li><a href="blog.jsp">Blogs</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="index.jsp" class="enroll-btn">ENROLL NOW <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

            <div class="about-hero">
                <h1>About Chetan Business School</h1>
                <p>Shaping Future Leaders in IT & Management Since 2005</p>
            </div>

            <!-- Director Message Section -->
            <div class="director-section" data-aos="fade-up" data-aos-duration="800">
                <div class="director-photo" data-aos="fade-right" data-aos-delay="200">
                    <div class="photo-frame">
                        <iframe src="https://www.youtube.com/embed/jQk9yalCIOg?si=xGq5zWr9e6RYH9y9"
                            title="YouTube video player"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                        <div class="photo-glow"></div>
                    </div>
                </div>
                <div class="director-message" data-aos="fade-left" data-aos-delay="300">
                    <h2 class="section-title" style="text-align: left;">Message from the Director</h2>
                    <h3>Dr. V. M. Koravi</h3>
                    <p class="designation">Director, Chetan Business School</p>
                    <div class="message-content">
                        <p><i class="fas fa-quote-left quote-icon"></i> Welcome to Chetan Business School. Our mission
                            is to transform ambitious individuals into dynamic leaders who can navigate the complexities
                            of the modern corporate world.</p>
                        <p>Through our cutting-edge MCA program and state-of-the-art facilities, we provide an ecosystem
                            that fosters innovation, ethical values, and technological proficiency.</p>
                        <p>We invite you to join us on this journey of excellence and shape your future with the best
                            minds in the industry.</p>
                    </div>
                </div>
            </div>

            <div class="story-section" data-aos="fade-up" data-aos-duration="800">
                <div class="story-text" data-aos="fade-right" data-aos-delay="100">
                    <h2><i class="fas fa-book-open"></i> Our Story</h2>
                    <p>Chetan B School Hubballi, established in 2011 under the auspices of the DKS Trust,
                        has been dedicated to providing quality education in the fields of management and computer
                        applications.
                        Initially offering an MBA program, the institution expanded in 2024 by introducing an MCA
                        program,
                        catering to the growing demand for tech-savvy professionals in the digital age.
                    </p>
                    <p>What sets Chetan B School apart is its emphasis on industry-connected curricular activities.
                        By integrating real-world business practices and technologies into its academic framework,
                        the school ensures students are equipped with practical knowledge and skills essential for
                        success in today's fast-evolving corporate world.
                        The institution’s strategic approach is aimed at fostering innovation, leadership,
                        and problem-solving abilities among its students.</p>
                    <p>The commitment of Chetan B School Hubballi to provide an industry-oriented education makes it a
                        premier choice for aspiring
                        professionals, preparing them to meet the challenges of both management and technology sectors.
                    </p>
                </div>
                <div class="story-stats" data-aos="fade-left" data-aos-delay="200">
                    <div class="stat-card">
                        <div class="stat-number">120+</div>
                        <div class="stat-label">MCA Seats Annually</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Years of Excellence</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Placement Assistance</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Industry Partners</div>
                    </div>
                </div>
            </div>

            <div class="mission-vision" data-aos="fade-up" data-aos-delay="100">
                <div class="mv-card" data-aos="zoom-in" data-aos-delay="150">
                    <i class="fas fa-bullseye"></i>
                    <h3>Our Mission</h3>
                    <p>To provide quality education in Computer Applications and Management, fostering analytical
                        thinking, technical excellence, and ethical leadership. We aim to bridge academia and industry
                        through innovative teaching, research, and continuous skill development.</p>
                </div>
                <div class="mv-card" data-aos="zoom-in" data-aos-delay="300">
                    <i class="fas fa-eye"></i>
                    <h3>Our Vision</h3>
                    <p>To become a center of excellence in IT and Management education, recognized globally for
                        producing competent professionals who drive technological innovation and contribute to societal
                        growth.</p>
                </div>
                <div class="mv-card" data-aos="zoom-in" data-aos-delay="450">
                    <i class="fas fa-heart"></i>
                    <h3>Core Values</h3>
                    <p>Fairness in treating everyone with respect and equality, Accountability for actions and
                        responsibilities, and Commitment towards excellence in education and professional growth.
                        The institution also promotes Transparency, ensuring honesty, ethics, and openness in all its
                        activities.</p>
                </div>
            </div>

            <div class="why-choose" data-aos="fade-up">
                <h2 class="section-title">Why Choose CBS?</h2>
                <div class="features-grid">
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="100">
                        <i class="fas fa-chalkboard-user"></i>
                        <h4>Expert Faculty</h4>
                        <p>Highly qualified and experienced professors with industry background, dedicated to mentoring
                            students for successful careers.</p>
                    </div>
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="200">
                        <i class="fas fa-laptop-code"></i>
                        <h4>Modern Curriculum</h4>
                        <p>Industry-aligned syllabus covering AI, ML, Data Science, Cloud Computing, and emerging
                            technologies.</p>
                    </div>
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="300">
                        <i class="fas fa-briefcase"></i>
                        <h4>100% Placement Support</h4>
                        <p>Dedicated placement cell with tie-ups with top MNCs, regular mock interviews, and career
                            counseling sessions.</p>
                    </div>
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="400">
                        <i class="fas fa-flask"></i>
                        <h4>State-of-the-Art Labs</h4>
                        <p>Advanced computing labs with latest software, 24/7 Wi-Fi campus, and modern research
                            facilities.</p>
                    </div>
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="500">
                        <i class="fas fa-globe"></i>
                        <h4>Industry Exposure</h4>
                        <p>Regular workshops, seminars, hackathons, and internships with leading IT companies.</p>
                    </div>
                    <div class="feature-item" data-aos="flip-left" data-aos-delay="600">
                        <i class="fas fa-handshake"></i>
                        <h4>Strong Alumni Network</h4>
                        <p>Active alumni association with professionals working at Google, Microsoft, Infosys, and other
                            top firms.</p>
                    </div>
                </div>
            </div>

            <div class="leadership" data-aos="fade-up">
                <h2 class="section-title">Leadership & Faculty</h2>
                <div class="team-grid">
                    <div class="team-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="team-icon">
                            <img src="images/director.jpg" alt="Director Photo">
                        </div>
                        <h4>Dr. V. M. Koravi </h4>
                        <div class="designation">Founder & Director</div><br>
                        <!-- <p>Ph.D. in Computer Science, 20+ years of experience in academia and industry leadership.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="150">
                        <div class="team-icon">
                            <img src="images/HOD.jpg" alt="HOD Photo">
                        </div>
                        <h4>Dr. Bhargav Revankar</h4><br>
                        <div class="designation">Professor & HOD, MCA Department</div>
                        <!-- <p>Specializes in Data Science & AI, published researcher with multiple patents.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="450">
                        <div class="team-icon">
                            <img src="images/WhatsApp%20Image%202026-06-03%20at%202.12.14%20PM.jpeg"
                                alt="Dr. Ramakant Kulkarni">
                        </div>
                        <h4>Dr. Ramakant Kulkarni</h4><br>
                        <div class="designation">Director, Academics</div>
                        <!-- <p>Full-stack developer with extensive React and Node.js experience.</p> -->
                    </div>


                    <div class="team-card" data-aos="fade-up" data-aos-delay="250">
                        <div class="team-icon">
                            <img src="images/anirud.jpeg" alt="Dr. Anjali Nair Photo">
                        </div>
                        <h4>Dr. Aniruddha R</h4><br>
                        <div class="designation">Professor - AI & ML</div>
                        <!-- <p>Ph.D. in Machine Learning, industry consultant for AI-driven solutions.</p> -->
                    </div>

                    <!-- 8 New Faculties -->
                    <div class="team-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="team-icon">
                            <img src="images/manik.jpeg" alt="Dr. Rajesh Kumar Photo">
                        </div>
                        <h4>Dr. Mohammed Jameel Manik</h4><br>
                        <div class="designation">Professor & Dean
                        </div>
                        <!-- <p>Expert in distributed systems and AWS cloud architecture.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="350">
                        <div class="team-icon">
                            <img src="images/shreyas.jpeg" alt="Prof. Sneha Rao Photo">
                        </div>
                        <h4>Prof. Shreyas Murdeshwar</h4><br>
                        <div class="designation">Assistant Professor </div>
                        <!-- <p>Certified Ethical Hacker with a focus on network security.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="400">
                        <div class="team-icon">
                            <img src="images/WhatsApp%20Image%202026-06-03%20at%202.11.23%20PM.jpeg"
                                alt="Dr. Mangala Yaragatti">
                        </div>
                        <h4>Dr. Mangala Yaragatti</h4><br>
                        <div class="designation">Associate Professor
                        </div>
                        <!-- <p>Specialist in big data analytics and NoSQL database optimization.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="team-icon">
                            <img src="images/ravikumarroogi.webp" alt="Placement Director Photo">
                        </div>
                        <h4>Dr. Ravikumar.R</h4><br>
                        <div class="designation">Assistant Professor</div>
                        <!-- <p>Former HR head at top MNCs, responsible for 500+ placements annually.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="500">
                        <div class="team-icon">
                            <img src="images/WhatsApp%20Image%202026-06-03%20at%202.12.27%20PM.jpeg"
                                alt="Dr. A R Wadakannavar">
                        </div>
                        <h4>Dr. A R Wadakannavar</h4><br>
                        <div class="designation">Adjunct Professor</div>
                        <!-- <p>Focuses on Agile methodologies and DevOps practices.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="550">
                        <div class="team-icon">
                            <img src="images/shweta.jpeg" alt="Dr. Priya Singh Photo">
                        </div>
                        <h4>Prof.Shweta Lali</h4><br>
                        <div class="designation">Teaching Associate</div>
                        <!-- <p>Researching smart city solutions and embedded systems integration.</p> -->
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="700">
                        <div class="team-icon">
                            <img src="images/Almas.jpeg" alt="Prof. Almas Photo">
                        </div>
                        <h4>Prof. Almas.M</h4><br>
                        <div class="designation">Teaching Associate</div>
                        <!-- <p>Former HR head at top MNCs, responsible for 500+ placements annually.</p> -->
                    </div>





                    <!-- <div class="team-card" data-aos="fade-up" data-aos-delay="600">
                        <div class="team-icon">
                            <img src="images/ravikumarroogi.webp" alt="Faculty Photo">
                        </div>
                        <h4>Prof. Sanjay Gupta</h4>
                        <div class="designation">Assistant Professor - Mobile Dev</div>
                        <p>Veteran Android developer with apps used by millions worldwide.</p>
                    </div>
                    <div class="team-card" data-aos="fade-up" data-aos-delay="650">
                        <div class="team-icon">
                            <img src="images/ravikumarroogi.webp" alt="Faculty Photo">
                        </div>
                        <h4>Ms. Neha Patel</h4>
                        <div class="designation">Lecturer - Business Analytics</div>
                        <p>Bridges the gap between data science algorithms and business logic.</p>
                    </div> -->
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
                        <!-- <p style="font-size:0.8rem; margin-bottom:1rem; color:#cffafe;">Subscribe for latest updates &
                            events</p>
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
                    <p>Ã‚Â© 2025 Chetan Business School - All Rights Reserved. | Designed with <i class="fas fa-heart"
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

        </script>
        <script src="js/enroll-modal.js"></script>

        <link rel="stylesheet" href="css/chatbot.css">
        <script src="js/chatbot.js"></script>
    </body>

    </html>