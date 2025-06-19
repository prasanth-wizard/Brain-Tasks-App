# Base image with Nginx
FROM nginx:alpine

# Redirect Nginx logs to console for CloudWatch collection
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Copy built React app into NGINX public directory
COPY dist/ /usr/share/nginx/html/

# (Optional) Use custom nginx config if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 3000 (as required by your setup)
EXPOSE 3000

# Start nginx in foreground (default CMD)
CMD ["nginx", "-g", "daemon off;"]

