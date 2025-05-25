#!/bin/bash

# Check for source code
if [ ! -f package.json ]; then
  echo "package.json not found. Cloning source..."
  git clone https://github.com/sriram-R-krishnan/devops-build.git temp-code
  cp -r temp-code/* .
  rm -rf temp-code
fi

# Confirm package.json is there
if [ ! -f devops-build/package.json ]; then
  echo "Error: package.json not found in devops-build/. Exiting."
  exit 1
fi
# Build Docker image and tag for dev and prod
docker build -t sreedocker911/react-app:dev .
docker tag sreedocker911/react-app:dev sreedocker911/react-app:prod
