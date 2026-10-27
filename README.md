# Chetan Business School (CBS) - Web Application

A full-stack Java EE web application for Chetan Business School, built for the MCA 2nd Semester Project. 

This project follows the **MVC Architecture** using **JSP, Servlets, and JDBC**, and is designed to run on **Apache Tomcat 11** with **MySQL**.

---

## Prerequisites
1. **Java Development Kit (JDK) 17 or higher** (Required for Tomcat 11)
2. **Apache NetBeans 21+** (Or any modern version supporting Jakarta EE 10)
3. **Apache Tomcat 11** 
4. **MySQL Server 8.0+**

---

## Step 1: Database Setup (MySQL)
1. Open MySQL Workbench or MySQL Command Line.
2. Ensure your MySQL username is `root` and password is `root`. 
   *(If your password is different, you must update `src/main/java/com/cbs/util/DBConnection.java` line 12 before running the project).*
3. Run the provided SQL script to create the database and tables:
   ```sql
   SOURCE C:/Users/sriha/Documents/mca 2nd project (web)/database.sql;
   ```
4. This will create the `cbs_db` database, and three tables: `users`, `contact_queries`, and `enrollments`. It also inserts a default admin account (`admin` / `admin123`).

---

## Step 2: Configure Server in Apache NetBeans
1. Open **Apache NetBeans**.
2. Go to **Tools** > **Servers** in the top menu.
3. Click **Add Server...** in the bottom left.
4. Select **Apache Tomcat or TomEE** and click Next.
5. In the **Server Location** field, click Browse and select the folder where you extracted **Apache Tomcat 11**.
6. (Optional) Create a Tomcat manager user by entering a username/password (e.g., `admin` / `admin`).
7. Click **Finish**.

---

## Step 3: Connect Database in Apache NetBeans (Optional but Recommended)
1. In NetBeans, go to the **Services** tab (usually next to Projects/Files on the left).
2. Expand the **Databases** node.
3. Right-click on **Drivers** and select **New Driver**.
4. Click **Add...** and navigate to your local maven repository (`C:\Users\sriha\.m2\repository\com\mysql\mysql-connector-j\8.3.0\mysql-connector-j-8.3.0.jar`) to select the MySQL driver, then click OK.
5. Right-click on **Databases** again and select **New Connection**.
6. Select the MySQL driver you just added.
7. Fill in the connection details:
   - **Host:** `localhost`
   - **Port:** `3306`
   - **Database:** `cbs_db`
   - **Username:** `root`
   - **Password:** `root` (or your actual password)
8. Click **Test Connection**. It should say "Connection Succeeded".
9. Click **Finish**.

---

## Step 4: Open and Run the Project
1. In NetBeans, go to **File** > **Open Project**.
2. Navigate to `C:\Users\sriha\Documents\mca 2nd project (web)` and open it. (NetBeans will recognize it automatically as a Maven project because of the `pom.xml`).
3. Right-click on the project in the Projects pane and select **Properties**.
4. In the Project Properties window, go to the **Run** category on the left.
5. Set the **Server** dropdown to **Apache Tomcat 11** (the server you added in Step 2).
6. Set the **Context Path** to `/cbs` (this makes the URL cleaner). Click OK.
7. Right-click the project again and select **Clean and Build** to download dependencies and compile.
8. Right-click the project and select **Run**.
9. NetBeans will start Tomcat 11, deploy the application, and open your default web browser to:
   `http://localhost:8080/cbs/`

---

## Application Features Overview
- **Public Pages:** Home, About, Programs, Activities, Placements, Blogs, Contact.
- **Student Enrollments:** Users can click "ENROLL NOW" from any page to submit an application via an AJAX-powered modal.
- **Contact Forms:** Users can submit queries via the Contact Us page.
- **Admin Authentication:** Access the dashboard securely via `http://localhost:8080/cbs/login` (Default Login: `admin` / `admin123`).
- **Admin Dashboard:** View all student enrollments and contact queries in a tabbed interface. Perform CRUD operations (Delete records).
- **Admin Registration:** Admins can register new admin users via the registration page.
