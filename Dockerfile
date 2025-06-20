# Use nginx base image
FROM nginx:alpine

# Clean default nginx html files
RUN rm -rf /usr/share/nginx/html/*

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built React app files
COPY dist/ /usr/share/nginx/html/

# Expose app port
EXPOSE 3000

# ✅ At container startup, create app log file with open permissions
CMD ["sh", "-c", "mkdir -p /var/log && touch /var/log/app.log && chmod 666 /var/log/app.log && nginx -g 'daemon off;'"]

