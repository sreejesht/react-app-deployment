#!/bin/bash

target=${1:-dev}

# Stop existing container if running
docker stop react-app 2>/dev/null || true
docker rm react-app 2>/dev/null || true

echo "Deploying sreedocker911/react-app:$target"
docker run -d -p 80:80 --name react-app sreedocker911/react-app:$target

# How to run
# Deploy dev (default)
#./deploy.sh

# Deploy prod
#./deploy.sh prod
