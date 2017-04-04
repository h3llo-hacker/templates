#!/bin/bash
ENV_FILE="/proc/1/environ"
FLAG=$(env | grep FLAG | sed "s/.*=//g")
NGINX_FILE="/usr/share/nginx/html/index.html"

NUM=$(date +%s | tail -c 4)
PASSWD=$(head -n $NUM /top_1000.txt| tail -1)

printf "admin:$(openssl passwd -crypt $PASSWD)\n" >> /etc/nginx/conf.d/passwd

echo "Behind your eyes." > $NGINX_FILE

echo "<!-- $FLAG -->" >> $NGINX_FILE

nginx -g "daemon off;"