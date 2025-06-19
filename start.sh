#!/bin/sh

mkdir -p /var/log/nginx
touch /var/log/nginx/access.log /var/log/nginx/error.log /var/log/app.log
chmod 666 /var/log/* /var/log/nginx/*
nginx -g "daemon off;"

