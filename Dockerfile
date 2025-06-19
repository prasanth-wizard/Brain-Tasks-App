FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your React build
COPY dist/ /usr/share/nginx/html/

# Change nginx port from 80 to 3000
RUN sed -i 's/80;/3000;/' /etc/nginx/conf.d/default.conf

# Create app log file and redirect access/error logs into it
RUN mkdir -p /var/log && touch /var/log/app.log && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Start nginx and tee logs into app.log
CMD sh -c "nginx -g 'daemon off;' & tail -F /var/log/nginx/access.log /var/log/nginx/error.log > /var/log/app.log"

