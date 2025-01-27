#!/bin/bash

BUILDCONTAINER_DATA_PATH="/data"
PATHTOBUILD="$BUILDCONTAINER_DATA_PATH"
BUILDERARCH=amd64

#ARCH=all
#ARCH=amd64
#ARCH=aarch64
#ARCH=aarmv7

echo "project directory is $PROJECTDIR"
echo "build container data path is $BUILDCONTAINER_DATA_PATH"
echo "build container target build path is $PATHTOBUILD"
#Build remote
CMD="docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro ghcr.io/home-assistant/{BUILDERARCH}-builder:latest --$ARCH -t spotify -r https://github.com/nedguy/addon-spotify-connect -b main"

#Build local
#CMD="docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro -v ./spotify:$BUILDCONTAINER_DATA_PATH ghcr.io/home-assistant/{BUILDERARCH}-builder:latest --target $PATHTOBUILD --$ARCH"

#Build and deploy local
#CMD="docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro -v ./spotify:$BUILDCONTAINER_DATA_PATH ghcr.io/home-assistant/{BUILDERARCH}-builder:latest --target $PATHTOBUILD --$ARCH --test --docker-hub local"
echo "$CMD"
$CMD