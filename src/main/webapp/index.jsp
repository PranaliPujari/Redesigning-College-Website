<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>Chetan Business School | MCA Program - Crystal Clear 3D World</title>
        <!-- Google Fonts & Font Awesome -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,600;14..32,700;14..32,800&family=Poppins:wght@300;400;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/enroll-modal.css">
        <!-- Three.js Core -->
        <script type="importmap">
        {
            "imports": {
                "three": "https://unpkg.com/three@0.128.0/build/three.module.js",
                "three/addons/": "https://unpkg.com/three@0.128.0/examples/jsm/"
            }
        }
    </script>
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

            /* Canvas 3D background - Full screen but with proper z-index */
            #canvas-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 0;
                overflow: hidden;
            }

            canvas {
                display: block;
                outline: none;
            }

            /* Main content overlay - with proper spacing */
            .content {
                position: relative;
                z-index: 10;
                min-height: 100vh;
                background: radial-gradient(circle at center, rgba(240, 248, 255, 0.4) 0%, rgba(255, 255, 255, 0.6) 100%);
            }

            /* Navbar */
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1rem 5%;
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(16px);
                border-bottom: 1px solid rgba(14, 165, 233, 0.25);
                flex-wrap: wrap;
                position: sticky;
                top: 0;
                z-index: 100;
                box-shadow: 0 4px 20px rgba(14, 165, 233, 0.08);
            }

            .logo h2 {
                font-size: 1.8rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0284c7, #0369a1, #1e40af);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                letter-spacing: -0.5px;
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
            }

            .nav-links a:hover {
                color: #0284c7;
                text-shadow: 0 0 8px rgba(14, 165, 233, 0.25);
            }

            .enroll-btn {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                padding: 0.5rem 1.5rem;
                border-radius: 40px;
                font-weight: bold;
                color: white !important;
                box-shadow: 0 4px 15px rgba(2, 132, 199, 0.3);
                transition: transform 0.2s, box-shadow 0.2s;
            }

            .enroll-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(2, 132, 199, 0.45);
            }

            .login-nav-btn {
                background: linear-gradient(45deg, #38bdf8, #0284c7);
                padding: 0.5rem 1.5rem;
                border-radius: 40px;
                font-weight: bold;
                color: white !important;
                box-shadow: 0 4px 15px rgba(56, 189, 248, 0.3);
                transition: transform 0.2s, box-shadow 0.2s;
                text-decoration: none;
                margin-left: 10px;
                display: inline-block;
            }

            .login-nav-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(56, 189, 248, 0.45);
            }

            .application-modal {
                position: fixed;
                inset: 0;
                z-index: 1000;
                display: none;
                align-items: center;
                justify-content: center;
                padding: 1.5rem;
                background: rgba(15, 23, 42, 0.45);
                backdrop-filter: blur(14px);
            }

            .application-modal.active {
                display: flex;
            }

            .application-form-card {
                width: min(720px, 100%);
                max-height: 92vh;
                overflow-y: auto;
                background: #ffffff;
                border: 1px solid rgba(14, 165, 233, 0.45);
                border-radius: 24px;
                box-shadow: 0 30px 80px rgba(15, 23, 42, 0.15);
                padding: 2rem;
                position: relative;
            }

            .application-form-card h2 {
                color: #0284c7;
                font-size: 1.8rem;
                margin-bottom: 0.35rem;
            }

            .application-form-card p {
                color: #475569;
                font-size: 0.9rem;
                margin-bottom: 1.4rem;
            }

            .close-form-btn {
                position: absolute;
                top: 1rem;
                right: 1rem;
                width: 38px;
                height: 38px;
                border-radius: 50%;
                border: 1px solid rgba(14, 165, 233, 0.45);
                background: rgba(14, 165, 233, 0.08);
                color: #0284c7;
                cursor: pointer;
                font-size: 1rem;
            }

            .close-form-btn:hover {
                background: rgba(14, 165, 233, 0.2);
            }

            .application-form {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 1rem;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 0.4rem;
            }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

            .application-form label {
                color: #334155;
                font-size: 0.84rem;
                font-weight: 600;
            }

            .application-form input,
            .application-form select,
            .application-form textarea {
                width: 100%;
                border: 1px solid rgba(14, 165, 233, 0.35);
                border-radius: 14px;
                background: #f8fafc;
                color: #0f172a;
                font-family: inherit;
                font-size: 0.95rem;
                padding: 0.8rem 0.95rem;
                outline: none;
            }

            .application-form input:focus,
            .application-form select:focus,
            .application-form textarea:focus {
                border-color: #0284c7;
                box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.18);
            }

            .application-form option {
                color: #0f172a;
            }

            .application-form textarea {
                resize: vertical;
                min-height: 90px;
            }

            .submit-application-btn {
                grid-column: 1 / -1;
                border: none;
                border-radius: 50px;
                padding: 0.9rem 1.4rem;
                background: linear-gradient(45deg, #0284c7, #0369a1);
                color: white;
                font-weight: 700;
                cursor: pointer;
                box-shadow: 0 8px 24px rgba(2, 132, 199, 0.25);
            }

            .submit-application-btn:hover {
                transform: translateY(-1px);
                box-shadow: 0 12px 32px rgba(2, 132, 199, 0.35);
            }

            /* Hero Section */
            .hero {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
                padding: 5rem 2rem 8rem;
                min-height: 90vh;
                position: relative;
                background: linear-gradient(180deg, rgba(224, 242, 254, 0.6) 0%, rgba(255, 255, 255, 0.3) 100%);
                border-bottom: 2px solid rgba(14, 165, 233, 0.2);
            }

            .hero h1 {
                font-size: 4.2rem;
                font-weight: 800;
                background: linear-gradient(135deg, #0f172a, #0284c7, #0369a1);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
                animation: fadeUp 0.8s ease-out, floatText 3s ease-in-out infinite;
                text-shadow: 0 2px 8px rgba(14, 165, 233, 0.1);
            }

            .hero p {
                font-size: 1.25rem;
                max-width: 700px;
                margin-bottom: 2rem;
                opacity: 0.95;
                color: #334155;
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(5px);
                padding: 0.5rem 1.5rem;
                border-radius: 50px;
                display: inline-block;
                box-shadow: 0 4px 15px rgba(14, 165, 233, 0.08);
            }

            .hero-badge {
                background: rgba(224, 242, 254, 0.7);
                backdrop-filter: blur(12px);
                padding: 0.6rem 1.8rem;
                border-radius: 60px;
                font-size: 0.9rem;
                color: #0369a1;
                border: 1px solid rgba(14, 165, 233, 0.5);
                display: inline-block;
                margin-bottom: 1.8rem;
                animation: pulseGlow 2s infinite;
            }

            .hero-buttons {
                display: flex;
                gap: 1.2rem;
                flex-wrap: wrap;
                justify-content: center;
                margin-top: 0.5rem;
            }

            /* Feature Cards */
            .features {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 2rem;
                padding: 3rem 5%;
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(12px);
                border-radius: 50px 50px 30px 30px;
                margin: 2rem 3% 3rem;
                position: relative;
                z-index: 20;
                box-shadow: 0 10px 30px rgba(14, 165, 233, 0.08);
                border: 1px solid rgba(14, 165, 233, 0.25);
            }

            .feature-card {
                background: #ffffff;
                border-radius: 32px;
                padding: 1.8rem 1.5rem;
                width: 230px;
                text-align: center;
                transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1);
                border: 1px solid rgba(14, 165, 233, 0.25);
                backdrop-filter: blur(5px);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .feature-card i {
                font-size: 2.8rem;
                background: linear-gradient(135deg, #38bdf8, #0284c7);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                margin-bottom: 1rem;
            }

            .feature-card h3 {
                font-size: 1.4rem;
                margin-bottom: 0.5rem;
                color: #0284c7;
            }

            .feature-card p {
                color: #475569;
            }

            .feature-card:hover {
                transform: translateY(-12px) scale(1.02);
                background: rgba(224, 242, 254, 0.5);
                border-color: #0284c7;
                box-shadow: 0 20px 30px -10px rgba(14, 165, 233, 0.15);
            }

            /* MCA Overview Section */
            .overview-section {
                padding: 2rem 5% 4rem;
                display: flex;
                flex-wrap: wrap;
                gap: 2rem;
                justify-content: space-between;
                position: relative;
                z-index: 20;
            }

            .overview-text {
                flex: 1.5;
                background: #ffffff;
                backdrop-filter: blur(10px);
                padding: 2rem;
                border-radius: 36px;
                border-left: 5px solid #0284c7;
                transition: 0.3s;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.03);
                border-top: 1px solid rgba(14, 165, 233, 0.1);
                border-bottom: 1px solid rgba(14, 165, 233, 0.1);
                border-right: 1px solid rgba(14, 165, 233, 0.1);
            }

            .overview-text h2 {
                font-size: 2rem;
                margin-bottom: 1rem;
                color: #0284c7;
            }

            .overview-text p {
                color: #475569;
            }

            .subjects {
                flex: 1;
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(10px);
                padding: 2rem;
                border-radius: 36px;
                border: 1px solid rgba(14, 165, 233, 0.35);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.03);
            }

            .subjects h3 {
                font-size: 1.6rem;
                margin-bottom: 1rem;
                color: #0284c7;
            }

            .subjects ul {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 0.8rem;
                list-style: none;
            }

            .subjects li {
                font-size: 0.9rem;
                display: flex;
                align-items: center;
                gap: 10px;
                background: rgba(224, 242, 254, 0.4);
                padding: 6px 12px;
                border-radius: 40px;
                transition: 0.2s;
                color: #334155;
            }

            .subjects li i {
                color: #0284c7;
                font-size: 0.9rem;
            }

            .subjects li:hover {
                background: rgba(14, 165, 233, 0.2);
                transform: translateX(5px);
            }

            .download-btn {
                display: inline-block;
                margin-top: 1.8rem;
                background: linear-gradient(95deg, #0284c7, #38bdf8);
                padding: 0.8rem 2rem;
                border-radius: 50px;
                color: white;
                font-weight: bold;
                text-decoration: none;
                transition: 0.25s;
                box-shadow: 0 5px 15px rgba(2, 132, 199, 0.2);
            }

            .download-btn:hover {
                transform: scale(1.03);
                background: linear-gradient(95deg, #38bdf8, #0284c7);
                box-shadow: 0 8px 25px rgba(14, 165, 233, 0.35);
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
                margin: 1rem 0 0;
                position: relative;
                z-index: 20;
            }

            .contact-info span,
            .contact-info a {
                color: #334155;
                margin-right: 1.5rem;
                font-size: 0.85rem;
                text-decoration: none;
            }

            .contact-info i {
                margin-right: 6px;
                color: #0284c7;
            }

            /* Premium Footer */
            .premium-footer {
                background: linear-gradient(145deg, #f0f9ff 0%, #e0f2fe 100%);
                border-top: 2px solid rgba(14, 165, 233, 0.4);
                position: relative;
                overflow: hidden;
                margin-top: 2rem;
                z-index: 20;
            }

            .premium-footer::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: radial-gradient(circle at 20% 30%, rgba(14, 165, 233, 0.1) 0%, transparent 60%);
                pointer-events: none;
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
                margin-bottom: 0.5rem;
            }

            .footer-brand p {
                color: #475569;
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
                width: 38px;
                height: 38px;
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
                transform: translateY(-5px);
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
                transition: 0.2s;
            }

            .footer-links a:hover {
                color: #0284c7;
                transform: translateX(6px);
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
            }

            .newsletter-form button {
                background: linear-gradient(45deg, #0284c7, #0369a1);
                border: none;
                padding: 0 1.2rem;
                border-radius: 50px;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }

            .footer-bottom {
                text-align: center;
                padding: 1.5rem;
                border-top: 1px solid rgba(14, 165, 233, 0.15);
                font-size: 0.8rem;
                background: rgba(224, 242, 254, 0.4);
                color: #475569;
            }

            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(40px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes floatText {
                0% {
                    transform: translateY(0px);
                }

                50% {
                    transform: translateY(-6px);
                }

                100% {
                    transform: translateY(0px);
                }
            }

            @keyframes pulseGlow {
                0% {
                    box-shadow: 0 0 0 0 rgba(14, 165, 233, 0.4);
                    border-color: rgba(14, 165, 233, 0.6);
                }

                70% {
                    box-shadow: 0 0 0 12px rgba(14, 165, 233, 0);
                    border-color: #0284c7;
                }

                100% {
                    box-shadow: 0 0 0 0 rgba(14, 165, 233, 0);
                }
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

                .hero h1 {
                    font-size: 2.5rem;
                }

                .hero {
                    padding: 3rem 1rem 6rem;
                    min-height: auto;
                }

                .overview-section {
                    flex-direction: column;
                }

                .subjects ul {
                    grid-template-columns: 1fr;
                }

                .footer-container {
                    flex-direction: column;
                    gap: 2rem;
                }

                .features {
                    margin: 1rem 1rem 2rem;
                }

                .application-form {
                    grid-template-columns: 1fr;
                }

                .application-form-card {
                    padding: 1.5rem;
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
                transition: 0.2s;
                font-weight: 550;
            }

            .btn-outline:hover {
                background: rgba(14, 165, 233, 0.15);
                transform: translateY(-2px);
            }

            /* Glowing animation keyframes for white text */
            @keyframes textGlowPulseWhite {
                0% {
                    text-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    box-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    border-color: rgba(2, 132, 199, 0.5);
                }

                50% {
                    text-shadow: 0 0 15px rgba(2, 132, 199, 0.6), 0 0 25px rgba(2, 132, 199, 0.4);
                    box-shadow: 0 0 15px rgba(2, 132, 199, 0.4), 0 0 25px rgba(2, 132, 199, 0.3);
                    border-color: #0284c7;
                }

                100% {
                    text-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    box-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    border-color: rgba(2, 132, 199, 0.5);
                }
            }

            /* Glowing animation for colored text (Data Science with blue glow) */
            @keyframes textGlowPulseBlue {
                0% {
                    text-shadow: 0 0 5px #0284c7, 0 0 10px #0284c7;
                    box-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    border-color: #0284c7;
                }

                50% {
                    text-shadow: 0 0 15px #0284c7, 0 0 25px #0284c7;
                    box-shadow: 0 0 15px rgba(2, 132, 199, 0.5), 0 0 25px rgba(2, 132, 199, 0.3);
                    border-color: #38bdf8;
                }

                100% {
                    text-shadow: 0 0 5px #0284c7, 0 0 10px #0284c7;
                    box-shadow: 0 0 5px rgba(2, 132, 199, 0.3), 0 0 10px rgba(2, 132, 199, 0.2);
                    border-color: #0284c7;
                }
            }

            /* Glowing animation for white text with cyan tint (for Cyber Security & Placements) */
            @keyframes textGlowPulseCyan {
                0% {
                    text-shadow: 0 0 5px #38bdf8, 0 0 10px #38bdf8;
                    box-shadow: 0 0 5px rgba(56, 189, 248, 0.3), 0 0 10px rgba(56, 189, 248, 0.2);
                    border-color: #38bdf8;
                }

                50% {
                    text-shadow: 0 0 15px #38bdf8, 0 0 25px #38bdf8;
                    box-shadow: 0 0 15px rgba(56, 189, 248, 0.5), 0 0 25px rgba(56, 189, 248, 0.3);
                    border-color: #0284c7;
                }

                100% {
                    text-shadow: 0 0 5px #38bdf8, 0 0 10px #38bdf8;
                    box-shadow: 0 0 5px rgba(56, 189, 248, 0.3), 0 0 10px rgba(56, 189, 248, 0.2);
                    border-color: #38bdf8;
                }
            }
        </style>
    </head>

    <body>

        <div id="canvas-container"></div>

        <div class="content">
            <nav class="navbar">
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
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="#" class="enroll-btn js-open-application">ENROLL NOW <i
                                class="fas fa-arrow-right"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/login" class="login-nav-btn"><i
                                class="fas fa-lock"></i> Login</a></li>
                </ul>
            </nav>

            <div class="hero">
                <div class="hero-badge">
                    <i class="fas fa-check-circle"></i> AICTE Approved | Affiliated to Karnataka University, Dharwad
                </div>
                <h1>Master of Computer Applications <span
                        style="background:linear-gradient(135deg,#06b6d4,#fff); -webkit-background-clip:text; background-clip:text; color:transparent;">(MCA)</span>
                </h1>
                <p>2-year full-time postgraduate program Intake 120 Industry-ready with AI, ML, Data Science &
                    Cybersecurity</p>
                <div class="hero-buttons">
                    <a href="#" class="enroll-btn js-open-application" style="padding: 0.8rem 2rem; font-size: 1rem;"><i
                            class="fas fa-rocket"></i> Apply Now 2027</a>
                    <a href="CBS_Premium_Brochure_v2.pdf" target="_blank" rel="noopener" class="btn-outline">Download
                        Brochure <i class="fas fa-download"></i></a>
                </div>
            </div>

            <div class="application-modal" id="applicationModal" aria-hidden="true">
                <div class="application-form-card" role="dialog" aria-modal="true" aria-labelledby="applicationTitle">
                    <button class="close-form-btn" type="button" id="closeApplicationForm"
                        aria-label="Close application form">
                        <i class="fas fa-times"></i>
                    </button>
                    <h2 id="applicationTitle">MCA Admission Form 2027</h2>
                    <p>Fill in your details and our admission team will contact you shortly.</p>
                    <form class="application-form" id="applicationForm">
                        <div class="form-group">
                            <label for="studentName">Full Name</label>
                            <input type="text" id="studentName" name="studentName" placeholder="Enter your name"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Mobile Number</label>
                            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="+91 98765 43210"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="emailAddress">Email Address</label>
                            <input type="email" id="emailAddress" name="emailAddress" placeholder="you@example.com"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="programChoice">Program</label>
                            <select id="programChoice" name="programChoice" required>
                                <option value="">Select program</option>
                                <option value="MCA">MCA</option>
                                <option value="MBA">MBA</option>
                                <option value="Research Programs">Research Programs</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="qualification">Highest Qualification</label>
                            <input type="text" id="qualification" name="qualification"
                                placeholder="BCA, B.Sc, B.Com, etc." required>
                        </div>
                        <div class="form-group">
                            <label for="percentage">Percentage / CGPA</label>
                            <input type="text" id="percentage" name="percentage" placeholder="Example: 72% or 8.1 CGPA"
                                required>
                        </div>
                        <div class="form-group full-width">
                            <label for="message">Message</label>
                            <textarea id="message" name="message"
                                placeholder="Tell us if you have any questions"></textarea>
                        </div>
                        <button class="submit-application-btn" type="submit">
                            <i class="fas fa-paper-plane"></i> Submit Application
                        </button>
                    </form>
                </div>
            </div>

            <div class="features">
                <div class="feature-card"><i class="fas fa-user-graduate"></i>
                    <h3>Eligibility</h3>
                    <p>Degree with 50% (45% for others)</p>
                </div>
                <div class="feature-card"><i class="fas fa-clock"></i>
                    <h3>Duration</h3>
                    <p>2 Years (Full Time)</p>
                </div>
                <div class="feature-card"><i class="fas fa-users"></i>
                    <h3>Intake</h3>
                    <p>120 Seats</p>
                </div>
                <div class="feature-card"><i class="fas fa-chalkboard-user"></i>
                    <h3>Activities</h3>
                    <p>Talent Hunt <br>Internship<br> Workshop<br> Webinars</p>
                </div>
            </div>

            <div class="overview-section">
                <div class="overview-text">
                    <h2><i class="fas fa-book-open"></i> Course Overview</h2>
                    <p><strong>Chetan Business Schoolâ€™s MCA program</strong>, affiliated with Karnataka University,
                        Dharwad, and <strong>AICTE approved</strong>, offers a comprehensive postgraduate degree for
                        aspiring IT professionals. Recognized by the <strong>Government of Karnataka</strong>, the
                        2-year full-time course provides advanced knowledge in Programming, Database Management,
                        Software Engineering, Web Technologies, and Network Security.</p>
                    <p style="margin-top: 1rem;"> Equips students with skills for IT careers & research in Software
                        Development, Data Science, AI, Cybersecurity.</p>
                    <p style="margin-top: 1rem;"><strong>Key Objectives:</strong><br> Deep knowledge of computer
                        applications & IT management.<br> Hands-on programming & software design.<br> Career
                        preparation for emerging technologies.</p>
                </div>
                <div class="subjects">
                    <h3><i class="fas fa-code"></i> Core Subjects</h3>
                    <ul>
                        <li><i class="fas fa-microchip"></i> Digital Logic & Computer Design</li>
                        <li><i class="fas fa-network-wired"></i> Computer Networks</li>
                        <li><i class="fab fa-python"></i> Python Programming</li>
                        <li><i class="fas fa-database"></i> DBMS</li>
                        <li><i class="fas fa-chart-line"></i> Design & Analysis of Algorithms</li>
                        <li><i class="fas fa-chart-simple"></i> Data Mining</li>
                        <li><i class="fas fa-globe"></i> Web Technologies</li>
                        <li><i class="fas fa-cogs"></i> Software Engineering</li>
                        <li><i class="fas fa-robot"></i> AI & Machine Learning</li>
                        <li><i class="fas fa-calculator"></i> Operation Research</li>
                    </ul>
                    <a href="MCA-I-to-IV-Semester-Syllabus-2024-25.pdf" class="download-btn" target="_blank"
                        rel="noopener"><i class="fas fa-file-pdf"></i> MCA Syllabus I-IV Sem (PDF)</a>
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
                            <li><a href="about.jsp"><i class=" fas fa-chevron-right"></i> About CBS</a></li>
                            <li><a href="programs.jsp"><i class="fas fa-chevron-right"></i> MCA Program</a></li>
                            <li><a href="placement.jsp"><i class="fas fa-chevron-right"></i> Placements</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Photo Gallery</a></li>
                            <li><a href="contact.jsp"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
                            <li><a href="${pageContext.request.contextPath}/login"><i class="fas fa-chevron-right"></i>
                                    Admin Login</a></li>
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
                    <p>Â© 2025 Chetan Business School - All Rights Reserved. | Designed with <i class="fas fa-heart"
                            style="color:#06b6d4;"></i> for future innovators</p>
                </div>
            </footer>
        </div>


        <script type="module">
            import * as THREE from 'three';
            import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
            import { CSS2DRenderer, CSS2DObject } from 'three/addons/renderers/CSS2DRenderer.js';

            const container = document.getElementById('canvas-container');
            const scene = new THREE.Scene();
            scene.background = new THREE.Color(0xf0f8ff);
            scene.fog = new THREE.FogExp2(0xf0f8ff, 0.0025);

            const camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);
            camera.position.set(5, 3.5, 9);
            camera.lookAt(0, 1, 0);

            const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: false });
            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.shadowMap.enabled = true;
            renderer.shadowMap.type = THREE.PCFSoftShadowMap;
            renderer.setPixelRatio(window.devicePixelRatio);
            container.appendChild(renderer.domElement);

            const labelRenderer = new CSS2DRenderer();
            labelRenderer.setSize(window.innerWidth, window.innerHeight);
            labelRenderer.domElement.style.position = 'absolute';
            labelRenderer.domElement.style.top = '0px';
            labelRenderer.domElement.style.left = '0px';
            labelRenderer.domElement.style.pointerEvents = 'none';
            labelRenderer.domElement.style.zIndex = '5';
            container.appendChild(labelRenderer.domElement);

            // Enhanced Lighting
            const ambientLight = new THREE.AmbientLight(0xbcdeff, 0.6);
            scene.add(ambientLight);
            const mainLight = new THREE.DirectionalLight(0xffffff, 1.2);
            mainLight.position.set(5, 8, 4);
            mainLight.castShadow = true;
            scene.add(mainLight);
            const fillLight = new THREE.PointLight(0x38bdf8, 0.8);
            fillLight.position.set(-2, 3, 4);
            scene.add(fillLight);
            const backLight = new THREE.PointLight(0x0284c7, 0.7);
            backLight.position.set(0, 2, -5);
            scene.add(backLight);
            const hemiLight = new THREE.HemisphereLight(0xffffff, 0xbbe1fa, 0.6);
            scene.add(hemiLight);

            // Crystal Clear 3D Models
            const coreMat = new THREE.MeshStandardMaterial({ color: 0x0284c7, emissive: 0x012e52, metalness: 0.9, roughness: 0.1 });
            const coreIco = new THREE.Mesh(new THREE.IcosahedronGeometry(0.95, 0), coreMat);
            coreIco.castShadow = true;
            coreIco.position.set(0, 0.9, 0);
            scene.add(coreIco);

            const knotGeo = new THREE.TorusKnotGeometry(0.85, 0.14, 180, 24, 3, 4);
            const knotMat = new THREE.MeshStandardMaterial({ color: 0x38bdf8, emissive: 0x034c70, metalness: 0.8, roughness: 0.15 });
            const knot = new THREE.Mesh(knotGeo, knotMat);
            knot.position.set(2.3, 1.3, 1.6);
            knot.castShadow = true;
            scene.add(knot);

            const techCubeMat = new THREE.MeshStandardMaterial({ color: 0x0284c7, metalness: 0.9, roughness: 0.1 });
            const techCube = new THREE.Mesh(new THREE.BoxGeometry(0.9, 0.9, 0.9), techCubeMat);
            techCube.position.set(-1.9, 1.0, 2.1);
            techCube.castShadow = true;
            scene.add(techCube);
            const edgesGeo = new THREE.EdgesGeometry(techCube.geometry);
            const edgesMat = new THREE.LineBasicMaterial({ color: 0x38bdf8 });
            const wireframe = new THREE.LineSegments(edgesGeo, edgesMat);
            techCube.add(wireframe);

            const pyramidMat = new THREE.MeshStandardMaterial({ color: 0xffa07a, metalness: 0.5, roughness: 0.2 });
            const pyramid = new THREE.Mesh(new THREE.ConeGeometry(0.68, 1.0, 4), pyramidMat);
            pyramid.position.set(-2.3, 0.4, -1.4);
            pyramid.castShadow = true;
            scene.add(pyramid);

            const torusMat = new THREE.MeshStandardMaterial({ color: 0x38bdf8, metalness: 0.7, roughness: 0.1 });
            const smallTorus = new THREE.Mesh(new THREE.TorusGeometry(0.65, 0.08, 64, 120), torusMat);
            smallTorus.position.set(1.5, -0.2, 2.2);
            smallTorus.castShadow = true;
            scene.add(smallTorus);

            // Orbiting Spheres
            const dataSpheres = [];
            for (let i = 0; i < 10; i++) {
                const sphMat = new THREE.MeshStandardMaterial({ color: 0x38bdf8, emissive: 0x0284c7 });
                const sphere = new THREE.Mesh(new THREE.SphereGeometry(0.22, 32, 32), sphMat);
                sphere.castShadow = true;
                scene.add(sphere);
                dataSpheres.push(sphere);
            }

            // Ring Cubes
            const securityRing = [];
            for (let i = 0; i < 16; i++) {
                const cubMat = new THREE.MeshStandardMaterial({ color: 0x0284c7 });
                const cubelet = new THREE.Mesh(new THREE.BoxGeometry(0.18, 0.18, 0.18), cubMat);
                cubelet.castShadow = true;
                scene.add(cubelet);
                securityRing.push(cubelet);
            }

            // Starfield
            const starCount = 1000;
            const starGeo = new THREE.BufferGeometry();
            const starPositions = [];
            for (let i = 0; i < starCount; i++) {
                starPositions.push((Math.random() - 0.5) * 200);
                starPositions.push((Math.random() - 0.5) * 100);
                starPositions.push((Math.random() - 0.5) * 80 - 40);
            }
            starGeo.setAttribute('position', new THREE.BufferAttribute(new Float32Array(starPositions), 3));
            const stars = new THREE.Points(starGeo, new THREE.PointsMaterial({ color: 0x38bdf8, size: 0.15, transparent: true, opacity: 0.5 }));
            scene.add(stars);

            const gridHelper = new THREE.GridHelper(18, 32, 0x0284c7, 0xbae6fd);
            gridHelper.position.y = -1.2;
            gridHelper.material.transparent = true;
            gridHelper.material.opacity = 0.35;
            scene.add(gridHelper);

            // Helper function to create labels with white background, skyblue border, and dark blue text
            function makeLabel(text, position, isGlowing = false, glowColor = 'cyan') {
                const div = document.createElement('div');
                div.textContent = text;
                div.style.color = '#0f172a';  // Dark text
                div.style.fontSize = '0.9rem';
                div.style.fontWeight = '600';
                div.style.background = 'rgba(255, 255, 255, 0.9)';
                div.style.padding = '6px 16px';
                div.style.borderRadius = '30px';
                div.style.backdropFilter = 'blur(4px)';
                div.style.border = `2px solid #38bdf8`;
                div.style.fontFamily = 'Poppins, sans-serif';
                div.style.whiteSpace = 'nowrap';
                div.style.boxShadow = '0 4px 12px rgba(14, 165, 233, 0.15)';

                // Apply glowing effect if specified
                if (isGlowing) {
                    div.style.fontWeight = '800';
                    div.style.background = '#ffffff';

                    if (glowColor === 'blue') {
                        div.style.animation = 'textGlowPulseBlue 1.5s ease-in-out infinite';
                        div.style.borderColor = '#0284c7';
                    } else {
                        div.style.animation = 'textGlowPulseCyan 1.5s ease-in-out infinite';
                        div.style.borderColor = '#38bdf8';
                    }
                }

                const label = new CSS2DObject(div);
                label.position.copy(position);
                scene.add(label);
                return label;
            }

            // Create labels
            makeLabel('🤖 AI & ML Hub', new THREE.Vector3(2.7, 2.0, 1.4), false);
            makeLabel('📊 Data Science', new THREE.Vector3(-2.4, 2.2, 1.9), true, 'blue');
            makeLabel('🔒 Cyber Security', new THREE.Vector3(1.9, -0.2, 2.7), true, 'cyan');
            makeLabel('💻 100% Placements', new THREE.Vector3(-2.3, -0.5, 2.3), true, 'cyan');

            const controls = new OrbitControls(camera, renderer.domElement);
            controls.enableDamping = true;
            controls.autoRotate = true;
            controls.autoRotateSpeed = 0.8;
            controls.enableZoom = true;
            controls.enablePan = false;
            controls.target.set(0, 0.9, 0);

            let time = 0;
            function animate() {
                requestAnimationFrame(animate);
                time += 0.012;

                coreIco.rotation.y = time * 0.4;
                knot.rotation.x = time * 0.5;
                knot.rotation.y = time * 0.7;
                techCube.rotation.x = time * 0.4;
                techCube.rotation.y = time * 0.6;
                pyramid.rotation.y = time * 0.35;
                smallTorus.rotation.x = time * 0.5;

                dataSpheres.forEach((sph, idx) => {
                    const angle = time * 1.0 + idx;
                    sph.position.x = 2.9 + Math.cos(angle) * 1.1;
                    sph.position.z = 1.2 + Math.sin(angle) * 1.1;
                    sph.position.y = 0.7 + Math.sin(angle * 1.8) * 0.4;
                });

                securityRing.forEach((cub, idx) => {
                    const angle = time * 0.7 + (idx / securityRing.length) * Math.PI * 2;
                    cub.position.x = Math.cos(angle) * 1.9;
                    cub.position.z = Math.sin(angle) * 1.9;
                    cub.position.y = 0.3 + Math.sin(angle * 2) * 0.35;
                    cub.rotation.x = time;
                    cub.rotation.y = time;
                });

                stars.rotation.y += 0.0003;
                controls.update();
                renderer.render(scene, camera);
                labelRenderer.render(scene, camera);
            }
            animate();

            window.addEventListener('resize', () => {
                camera.aspect = window.innerWidth / window.innerHeight;
                camera.updateProjectionMatrix();
                renderer.setSize(window.innerWidth, window.innerHeight);
                labelRenderer.setSize(window.innerWidth, window.innerHeight);
            });
        </script>
        <script src="js/enroll-modal.js?v=2"></script>

        <link rel="stylesheet" href="css/chatbot.css">
        <script src="js/chatbot.js"></script>
    </body>

    </html>