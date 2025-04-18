# Use an official Node.js runtime as the base image
FROM node:16 AS build
# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the application code
COPY . .
# Build the React application
RUN npm run build
# Use a lightweight web server to serve the React app
FROM nginx:alpine
# Copy the built React app to the Nginx web server directo>
COPY --from=build /app/build /usr/share/nginx/html
# Expose port 80 for the web server
EXPOSE 80
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
