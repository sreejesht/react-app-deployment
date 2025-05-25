# Node JS (Serve Static Build)
# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the pre-built static React files
COPY devops-build-main/build/ .

# Install 'serve' to serve the static build
RUN npm install -g serve

# Make port 80 available to the world outside this container
EXPOSE 80

# Command to serve the static site
CMD ["serve", "-s", ".", "-l", "80"]

