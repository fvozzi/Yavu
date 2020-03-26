#!/bin/bash
# exit on first encountered error
# wherever you'll be ssh-ing into user@machine
readonly TARGET_MACHINE="root@192.241.172.175"
# customize the name of the Pharo image you will be deploying
readonly PROJECT_NAME="yavu"
# customize the name of the Pharo image you will be deploying
readonly TRAVIS_BUILD_NUMBER="$1"
# customize the name of the build folder
readonly ARTIFACT_DIR="${PROJECT_NAME}-${TRAVIS_BUILD_NUMBER}"
# Unzip the deploy 
unzip ~/builds/"$ARTIFACT_DIR"
# Copy to the production folder
service yavu-service stop
cp -r -v "$ARTIFACT_DIR"/* /opt/yavu/
service yavu-service start

