#!/bin/bash
num=`pwd | tail -c2`
docker build -t wrfly/web_pt-sql_inject_${num}:latest . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-sql_inject_${num}:latest