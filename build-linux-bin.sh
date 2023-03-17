#!/usr/bin/env sh

set -euo pipefail

# build the docker image
DOCKER_BUILDKIT=1 docker build --platform=linux/amd64 -t etcpack_linux:latest .

# delete any old containers
CONTAINER_IDS=$(docker ps -a | grep etcpack_linux:latest | awk '{print $1}')
if [ -n "${CONTAINER_IDS}" ]; then
    docker rm "$CONTAINER_IDS" && echo "Deleted old containers: $CONTAINER_IDS"
fi

# create a new container
docker create etcpack_linux:latest

# get the latest container id
CONTAINER_ID=$(docker ps -a | grep etcpack_linux:latest | awk '{print $1}')
echo "The new container id is: $CONTAINER_ID"

# copy the binary from the container to the host
docker cp "$CONTAINER_ID":/app/etcpack .
echo "The new binary is available at: $(pwd)/etcpack"
