#!/bin/bash

docker build -t wrfly/web_pt-fileupload:level_0 . && \
docker run --rm -ti -e FLAG=hhhhhh -p 8080:80 wrfly/web_pt-fileupload:level_0