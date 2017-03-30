#!/bin/bash

ENV_FILE="/proc/1/environ"
FLAG=$(env | grep FLAG | sed "s/.*=//g")
NGINX_FILE="/usr/share/nginx/html/index.html"

echo "<!-- $FLAG -->" >> $NGINX_FILE

nginx -g "daemon off;"