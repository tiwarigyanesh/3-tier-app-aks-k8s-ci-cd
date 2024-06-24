#!/bin/sh

envsubst '${BACKEND_IP}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx -g 'daemon off;'
