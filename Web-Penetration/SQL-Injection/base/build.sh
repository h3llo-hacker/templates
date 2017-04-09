#!/bin/bash

docker build -t wrfly/web_pt-sql_inject:base . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-sql_inject:base