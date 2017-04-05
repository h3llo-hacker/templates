#!/bin/bash
docker build -t wrfly/brute-force_with-captcha:latest .

docker run --rm -ti -p 8081:80 wrfly/brute-force_with-captcha:latest