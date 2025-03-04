FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-base-authoring/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-base-authoring/target/registry-base-authoring-0.0.6-SNAPSHOT.jar .

# Run the application
CMD ["java", "-jar", "base-registry-base-authoring-0.0.6-SNAPSHOT.jar"]
#ENTRYPOINT ["/bin/bash"]