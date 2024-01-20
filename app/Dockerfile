# Use the Nginx Alpine image for a small footprint
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets from your local build folder to the Nginx container
COPY ./out /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
