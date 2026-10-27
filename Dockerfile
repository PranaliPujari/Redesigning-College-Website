# ============================
# Stage 1: Build with Maven
# ============================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and download dependencies first (layer caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build WAR
COPY src ./src
RUN mvn clean package -DskipTests -B

# ============================
# Stage 2: Run on Tomcat 10.1
# ============================
FROM tomcat:10.1-jdk17

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR to Tomcat webapps as ROOT (serves at /)
COPY --from=builder /app/target/cbs.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
