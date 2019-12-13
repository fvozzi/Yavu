#!/bin/bash
# exit on first encountered error
set -o errexit
# wherever you'll be ssh-ing into user@machine
readonly TARGET_MACHINE="root@192.241.172.175"
# customize the name of the Pharo image you will be deploying
readonly PROJECT_NAME="Yavu"
# customize the name of the build folder
readonly ARTIFACT_DIR="${PROJECT_NAME}-${TRAVIS_BUILD_NUMBER}"
# Rename the image, zip it, and send it to a server
deploy-simple() {
	mkdir "$ARTIFACT_DIR"
	cp "$SMALLTALK_CI_IMAGE" "${ARTIFACT_DIR}/${PROJECT_NAME}.image"
	cp "$SMALLTALK_CI_CHANGES" "${ARTIFACT_DIR}/${PROJECT_NAME}.changes"
	cp -r "${TRAVIS_BUILD_DIR}/img" "${ARTIFACT_DIR}/img"
	cp -r "${TRAVIS_BUILD_DIR}/scripts" "${ARTIFACT_DIR}/scripts"
	#cp -r "${SMALLTALK_CI_HOME}/pharo/img" "${ARTIFACT_DIR}/img"
	#cp -r "${SMALLTALK_CI_BUILD}/pharo/img" "${ARTIFACT_DIR}/img"
	
	
	
	local build_zip="${ARTIFACT_DIR}.zip"
	zip -qr "$build_zip" "$ARTIFACT_DIR"
	scp -rp "$build_zip" "$TARGET_MACHINE:~/builds/"
	# I have a server-side post-processing script that bundles VMs into the build
	ssh "$TARGET_MACHINE" "chmod u+x ~/builds/post-process.sh"
	ssh "$TARGET_MACHINE" "~/builds/post-process.sh ${TRAVIS_BUILD_NUMBER}"
}
main() {
	deploy-simple
	echo "Build ${ARTIFACT_DIR} deployed."
}
if [[ "$TRAVIS_BRANCH" == "master" ]]; then
	main
fi
