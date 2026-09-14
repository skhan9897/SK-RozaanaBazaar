# Step 1: Build stage using Maven and JDK 8
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# Step 2: Runtime stage using Tomcat 9
FROM tomcat:9.0-jdk8-openjdk-slim
COPY --from=build /app/target/SKRozaanaBazaar-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
