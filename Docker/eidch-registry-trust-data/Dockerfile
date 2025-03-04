FROM eclipse-temurin:21

# Set working directory
WORKDIR /app

COPY ./Docker/eidch-registry-trust-data/application-compose.yml .

# Copy JAR files
COPY ./eidch-registry-trust-data/target/registry-trust-data*.jar .

# Run the application
CMD ["java", "-jar", "registry-trust-data-0.0.6-SNAPSHOT.jar"]
#ENTRYPOINT ["/bin/bash"]