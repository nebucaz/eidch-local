# build applications
echo "compiling apps.."
cd eidch-registry-base-authoring=true
mvn clean package -Djacoco.skip=true
cd ../eidch-registry-base-data
mvn clean package -Djacoco.skip=true
cd ../eidch-registry-status-data
mvn clean package -Djacoco.skip=true


# build images & start up
echo "\n\ncompiling done, starting up"
docker-compose up --build
