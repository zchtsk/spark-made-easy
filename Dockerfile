# Use the Nginx Alpine image for a small footprint
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets from your local build folder to the Nginx container
COPY ./app/out /usr/share/nginx/html

# Copy the custom Nginx config file into the container
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
