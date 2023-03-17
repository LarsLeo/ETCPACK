#!/usr/bin/env sh

set -exuo pipefail

# build the docker image
DOCKER_BUILDKIT=1 docker build --platform=linux/amd64 -t etcpack_linux:latest .

# create a new container
docker create etcpack_linux:latest

# get the latest container id
CONTAINER_ID=$(docker ps -a | grep etcpack_linux:latest | tail -1 | awk '{print $1}')

# copy the binary from the container to the host
docker cp "$CONTAINER_ID":/app/etcpack .
echo "The new binary is available at: $(pwd)/etcpack"
