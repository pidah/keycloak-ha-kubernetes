#!/bin/bash

set -e

VERSION=${1:-0.0.2}
DOCKER_REPO="pidah/keycloak-ha-kubernetes"
DOCKER_IMAGE=${DOCKER_REPO}:${VERSION}

# run tests before build
#echo "Running go test..."
#go test


echo "Building docker image..."
docker build -t ${DOCKER_IMAGE} .
docker push ${DOCKER_IMAGE}
