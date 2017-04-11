#!/bin/bash

docker build -t wrfly/web_pt-code_exec:example . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-code_exec:example