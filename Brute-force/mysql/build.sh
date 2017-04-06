#!/bin/bash
docker build -t wrfly/brute-force_mysql:latest .

docker run --rm -ti -p 33306:3306 -e FLAG=hello wrfly/brute-force_mysql:latest