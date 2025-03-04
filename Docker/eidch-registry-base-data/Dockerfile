# Base image
FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-base-data/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-base-data/base-registry-data-did-store/target/base-registry-data-did-store*.jar .
COPY ./eidch-registry-base-data/base-registry-data-service/target/base-registry-data-service*.jar .
COPY ./eidch-registry-base-data/base-registry-data-shared/target/base-registry-data-shared*.jar .

# Run the application
CMD ["java", "-jar", "base-registry-data-service-0.0.6-SNAPSHOT.jar"]
