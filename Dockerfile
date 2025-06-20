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

CMD ["sh", "-c", "nginx -g 'daemon off;' 2>&1 | tee -a /app-logs/app.log"]
