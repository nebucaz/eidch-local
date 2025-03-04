FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-status-authoring/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-status-authoring/target/registry-status-authoring*.jar .

# Run the application
CMD ["java", "-jar", "registry-status-authoring-0.0.6-SNAPSHOT.jar"]
#ENTRYPOINT ["/bin/bash"]