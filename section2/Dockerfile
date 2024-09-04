# Use the official NGINX base image
FROM nginx:latest

# Copy the static HTML file to the NGINX default document root
COPY ./section2/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]
