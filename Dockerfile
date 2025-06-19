FROM nginx:alpine

# Remove default nginx content and copy your build
RUN rm -rf /usr/share/nginx/html/*
COPY dist/ /usr/share/nginx/html/

# Redirect Nginx logs to a single app log file
CMD ["sh", "-c", "nginx -g 'daemon off;' > /var/log/app.log 2>&1"]

EXPOSE 3000
RUN sed -i 's/80;/3000;/' /etc/nginx/conf.d/default.conf


