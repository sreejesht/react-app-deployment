#!/bin/bash

# Default to 'dev' if no argument is provided
TARGET=${1:-dev}

# Container name
CONTAINER_NAME="react-app"

# Stop and remove any existing container with the same name
echo "Stopping existing container (if running)..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# Deploy the selected image
echo "Deploying sreedocker911/react-app:$TARGET..."
docker run -d -p 80:80 --name $CONTAINER_NAME sreedocker911/react-app:$TARGET

echo "Deployment of '$TARGET' environment complete."

# How to run
# Deploy dev (default)
#./deploy.sh

# Deploy prod
#./deploy.sh prod
