#!/bin/bash
# Build and tag dev image
docker build -t sreedocker911/react-app:dev .

# Tag it as prod as well
docker tag sreedocker911/react-app:dev sreedocker911/react-app:prod
