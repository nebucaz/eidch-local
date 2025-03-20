#!/bin/bash

compile_sources() {
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

    cd ../eidch-issuer-agent-management
    mvn clean package -Djacoco.skip=true

    cd ../eidch-issuer-agent-oid4vci
    mvn clean package -Djacoco.skip=true

    # build images & start up
    echo -e "\n\ncompiling done"
}

COMPILED=false
JAVA_EXEC=$(which java)
if [ -x "$JAVA_EXEC" ]; then
    JAVA_VERSION=$("$JAVA_EXEC" -version 2>&1 | head -n 1)
    VERSION_MAJOR=$(echo "$JAVA_VERSION" | sed -n 's/.*version "\([0-9]*\)\..*/\1/p')

    if [ "$VERSION_MAJOR" -ne 21 ]; then
        echo "Java version is not 21 (is: ${JAVA_VERSION})"
    #     exit 1
    else
        compile_sources
        COMPILED=true
    fi
fi

if ! $COMPILED; then
    if [ -z "$JAVA_HOME" ]; then
        # JAVA_HOME is not set, check if /opt/homebrew/Cellar/openjdk@21/21.0.6
        if [ -d "/opt/homebrew/Cellar/openjdk@21/21.0.6" ]; then
            export JAVA_HOME="/opt/homebrew/Cellar/openjdk@21/21.0.6"
            echo "JAVA_HOME is set to ${JAVA_HOME}"
            compile_sources
        fi
    else
            echo "JAVA_HOME=${JAVA_HOME} has to be changed, maybe?"
    fi
fi

# if ! $COMPILED; then
#     if [ -z "$JAVA_HOME" ]; then
#     echo  "2"
#     # JAVA_HOME is not set, check if /opt/homebrew/Cellar/openjdk@21/21.0.6
#     if [ -d "/opt/homebrew/Cellar/openjdk@21/21.0.6" ]; then
#         export JAVA_HOME="/opt/homebrew/Cellar/openjdk@21/21.0.6"
#         echo "JAVA_HOME is set to /h/21/java"
#         compile_sources
#     else
#         echo "No JAVA_HOME."
#         exit 1
#     fi
# fi
# docker-compose up --build
#docker-compose build