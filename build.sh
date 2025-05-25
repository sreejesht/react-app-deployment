#!/bin/bash

# Check for build folder
if [ ! -d devops-build-main/build ]; then
  echo "Static build not found. Cloning..."
  git clone https://github.com/sriram-R-krishnan/devops-build.git devops-build-main
fi

# Confirm static build files are present
if [ ! -f devops-build-main/build/index.html ]; then
  echo "Error: Static build folder is missing index.html. Exiting."
  exit 1
fi

# Build Docker image and tag for dev and prod
docker build -t sreedocker911/react-app:dev .
docker tag sreedocker911/react-app:dev sreedocker911/react-app:prod

