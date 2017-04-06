#!/bin/bash
docker build -t wrfly/brute-force_mysql:latest .

docker run --rm -ti -p 33306:3306 -e FLAG=flag{hello} wrfly/brute-force_mysql:latest