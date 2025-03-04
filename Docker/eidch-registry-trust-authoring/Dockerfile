FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-trust-authoring/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-trust-authoring/target/registry-trust-authoring*.jar .

# Run the application
CMD ["java", "-jar", "registry-trust-authoring-0.0.6-SNAPSHOT.jar"]
#ENTRYPOINT ["/bin/bash"]