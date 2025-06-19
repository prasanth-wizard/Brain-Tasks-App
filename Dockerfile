FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist/ /usr/share/nginx/html/
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 3000

CMD ["/start.sh"]

