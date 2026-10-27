-- ============================================
-- CBS (Chetan Business School) Database Setup
-- MCA 2nd Semester Web Development Project
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS cbs_clg_db;
USE cbs_clg_db;

-- ============================================
-- Table 1: users (Admin Authentication)
-- ============================================
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Table 2: contact_queries (Contact Form Data)
-- ============================================
CREATE TABLE IF NOT EXISTS contact_queries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    program VARCHAR(100),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Table 3: enrollments (Enrollment Form Data)
-- ============================================
CREATE TABLE IF NOT EXISTS enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    program_choice VARCHAR(50) NOT NULL,
    qualification VARCHAR(100) NOT NULL,
    percentage VARCHAR(20) NOT NULL,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Insert default admin user
-- Username: admin | Password: admin123
-- ============================================
INSERT INTO users (username, password, full_name, email, role)
VALUES ('admin', 'admin123', 'Administrator', 'admin@cbs.edu', 'admin')
ON DUPLICATE KEY UPDATE username = username;