#!/bin/bash

# build applications
echo "compiling apps.."

cd eidch-registry-base-authoring
mvn clean package -Djacoco.skip=true

cd ../eidch-registry-base-data
mvn clean package -Djacoco.skip=true

cd ../eidch-registry-status-data
mvn clean package -Djacoco.skip=true

cd ../eidch-registry-status-authoring
mvn clean package -Djacoco.skip=true

cd ../eidch-registry-trust-data
mvn clean package -Djacoco.skip=true

cd ../eidch-registry-trust-authoring
mvn clean package -Djacoco.skip=true

# build images & start up
echo -e "\n\ncompiling done, starting up"
docker-compose up --build
# docker-compose build
