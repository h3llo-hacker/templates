#!/bin/bash

docker build -t wrfly/web_pt-fileincl:level_1 . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-fileincl:level_1