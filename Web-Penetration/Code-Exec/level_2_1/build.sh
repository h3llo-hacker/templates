#!/bin/bash

docker build -t wrfly/web_pt-code_exec:level_2_1 . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-code_exec:level_2_1