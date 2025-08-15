#!/usr/bin/env bash

source .env

# constants
REGISTRY_USERNAME=username
CONTAINER_IMAGE_VERSION=${APP_VERSION}
[[ "${APP_RUNTIME_CONTEXT}" == "dev" ]] && CONTAINER_IMAGE_VERSION=${APP_DEV_VERSION}

echo "===> Building image: ${APP_CONTAINER_IMAGE}:${CONTAINER_IMAGE_VERSION}"

# create image
docker build --no-cache --pull --build-arg APP_NAME=${APP_NAME} -t ${APP_CONTAINER_IMAGE}:${CONTAINER_IMAGE_VERSION} .

#echo "===> Build complete, pushing to registry"
#docker login -u ${REGISTRY_USERNAME} ${APP_CONTAINER_IMAGE}
#docker push ${APP_CONTAINER_IMAGE}:${CONTAINER_IMAGE_VERSION}
