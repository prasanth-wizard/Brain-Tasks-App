FROM nginx:alpine

# Remove default files
RUN rm -rf /usr/share/nginx/html/*

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy React build
COPY dist/ /usr/share/nginx/html/

# Create log directory
RUN mkdir -p /var/log/nginx && \
    chown -R nginx:nginx /var/log/nginx

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
