# Dockerfile
FROM openjdk:17-jdk-alpine
COPY target/my-app.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
