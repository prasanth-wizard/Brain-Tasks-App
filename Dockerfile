FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY dist/ /usr/share/nginx/html/
EXPOSE 3000
RUN sed -i 's/80;/3000;/' /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]

