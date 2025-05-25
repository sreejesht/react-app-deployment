# Node JS (Production Build with Serve)

# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the app for production
RUN npm run build

# Install serve to serve the production build
RUN npm install -g serve

# Make port 80 available to the world outside this container
EXPOSE 80

# Command to serve the build directory
CMD ["serve", "-s", "build"]

