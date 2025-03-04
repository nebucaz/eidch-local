FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-status-data/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-status-data/target/registry-status-data*.jar .

# Run the application
CMD ["java", "-jar", "registry-status-data-0.0.6-SNAPSHOT.jar"]
#ENTRYPOINT ["/bin/bash"]