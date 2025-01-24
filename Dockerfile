FROM openjdk:22-jdk
WORKDIR /backend
COPY target/cinema-app-0.0.1-SNAPSHOT.jar /backend/backend.jar
EXPOSE 8080
CMD ["java", "-jar", "backend.jar"]
